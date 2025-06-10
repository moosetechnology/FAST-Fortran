"
A FASTFortranVisitor that computes ConftrolFlowGraph on the statements

It is based on the algorithm to compute basic blocks from [https://en.wikipedia.org/wiki/Basic_block](https://en.wikipedia.org/wiki/Basic_block)
"
Class {
	#name : 'FASTFortranCFGVisitor',
	#superclass : 'FASTFortranVisitor',
	#traits : 'FASTCFGTVisitor',
	#classTraits : 'FASTCFGTVisitor classTrait',
	#instVars : [
		'labelReferences',
		'parentLoopBlocks'
	],
	#category : 'FAST-Fortran-Analyses-CFG',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'CFG'
}

{ #category : 'basicBlocks' }
FASTFortranCFGVisitor >> checkLabelledConditionalStatement: aFASTFortranTStatement [
	"simlar to #checkLabelledStatement: but does not set the #nextStatement of currentStatement"

	aFASTFortranTStatement label ifNil: [ ^ self ].

	self
		chainRegisteredJumps: aFASTFortranTStatement label
		toBlock: currentBlock
]

{ #category : 'basicBlocks' }
FASTFortranCFGVisitor >> checkLabelledStatement: aFASTFortranTStatement [
	"Labelled statement start a new block (except if we are already at the start of a new one)
	 Plus need to check whether we met a goto referring to this label earlier"

	| newBlock |
	aFASTFortranTStatement label ifNil: [ ^ self ].

	newBlock := self newBasicBlock: FASTCFGBasicBlock.
	self unconditionalActionFromBlock: newBlock.

	self
		chainRegisteredJumps: aFASTFortranTStatement label
		toBlock: newBlock
]

{ #category : 'basicBlocks' }
FASTFortranCFGVisitor >> findLabelledBlock: label setter: settingAction [
	"search for a block starting with this label. If none found, returns nil and
	 register currentBlock as wanting this label"

	^basicBlocks
		detect: [ :bloc |
			bloc firstStatement label = label ]
		ifOne: [ :labeledBlock |
			settingAction value: labeledBlock.
			labeledBlock
		]
		ifNone: [
			settingAction value: nil.
			self
				registerReference: settingAction
				toLabel: label
		]
]

{ #category : 'basicBlocks' }
FASTFortranCFGVisitor >> findParentLoopBlock: aLabel [
	"if there is no label to the EXIT, take the first loop block in the stack
	 otherwise, search for the loop with the right label"

	aLabel ifNil: [ ^parentLoopBlocks top ].
	^nil
]

{ #category : 'initialization' }
FASTFortranCFGVisitor >> initialize [

	super initialize.

	labelReferences := Dictionary new.
	parentLoopBlocks := Stack new.
]

{ #category : 'private' }
FASTFortranCFGVisitor >> ioStatementBranches: anIOStatement [

	"IO Statements are  BACKSPACE, CLOSE, DECODE, ENCODE, ENDFILE, OPEN, READ, REWIND, WRITE
	 They can be branching statements if they have END=<label> or ERR=<label> io parameters"

	^anIOStatement ioParameters select: [ :parameter |
		(parameter class = FASTFortranAssignmentExpression) and:
		[ #('end' 'err') anySatisfy: [ :specialVar | parameter variable name = specialVar ] ]
	]
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [

	^ self visitFASTFortranTStatement: aFASTFortranCallStatement
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [

	"conditionalBlock := self newConditionalBlock: aFASTFortranDoStatement.
	self checkLabelledConditionalStatement: aFASTFortranDoStatement.
	parentLoopBlocks push: conditionalBlock.
	[...]"

	self visitFASTTLoopStatement: aFASTFortranDoStatement 
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [
	"looks a bit like a GOTO, but does not need to specify the label (goes to enclosing loop)"

	self visitFASTFortranTStatement: aFASTFortranExitStatement.

	self chainPendingBlocksTo: (self findParentLoopBlock: nil). "aFASTFortranExitStatement label"

	self closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranGotoComputedStatement: aFASTFortranGoToComputedStatement [
	"GoTo with several possible target labels
	 - new ConditionalBlock (#nextBlock of current one)
	 - need to chain labelled blocks to each target label"

	| conditionalBlock |

	conditionalBlock := self newConditionalBlock:
		                    aFASTFortranGoToComputedStatement.
	self checkLabelledConditionalStatement:
		aFASTFortranGoToComputedStatement.

	aFASTFortranGoToComputedStatement labelReferences do: [
		:labelReference |
		self
			findLabelledBlock: labelReference label
			setter: [ :labeledBlock |
				conditionalBlock
					nextBlock: labeledBlock
					onValue: labelReference label ] ].

	self closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranGotoStatement: aFASTFortranGoToStatement [
	"todo:
	 - end currentBlock (contains this statement)
	 - nextBlock of currentBlock is a block starting on the right label
	Note: need to introduce a local variable because the setter block can be evaluated later
	and we want it to reference the current value of #currentBlock, not the value it will have
	at this later time"

	| gotoBlock |

	self visitFASTFortranTStatement: aFASTFortranGoToStatement.

	gotoBlock := currentBlock.
	self
		findLabelledBlock:
		aFASTFortranGoToStatement labelReferences anyOne label
		setter: [ :labeledBlock | gotoBlock nextBlock: labeledBlock ].

	self removePendingActionFor: currentBlock.
	self closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIOStatement: aFASTFortranIOStatement [
	"IOStatements (see #ioStatementBranches:) can be regular statements or branching statements
	 depending on their IO-parameters.
	 If they are branching statements they are similar to ComputedGotos (several targets):
	 - proceed : proceed to next statement after read (no end, no err)
	 - end : goto specified label upon end-of-file
	 - err : goto specified label upon error"

	| branches ioBlock |

	branches := self ioStatementBranches: aFASTFortranIOStatement.
	branches ifEmpty: [
		^ self visitFASTFortranTStatement: aFASTFortranIOStatement ].

	ioBlock := self newConditionalBlock: aFASTFortranIOStatement.
	self checkLabelledConditionalStatement: aFASTFortranIOStatement.

	branches do: [ :assignExpr |
		self
			findLabelledBlock: assignExpr expression primitiveValue
			setter: [ :labeledBlock |
				ioBlock nextBlock: labeledBlock onValue: assignExpr variable name ] ].
	self addPendingNextBlockAction: [ :nextBlock |
		ioBlock nextBlock: nextBlock onValue: 'proceed' ].

	self closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [
	"Note: next statement after an ArithmeticIf should be labelled or there is no way it gets executed"

	| conditionalBlock |
	conditionalBlock := self newConditionalBlock:
		                    aFASTFortranIfArithmeticStatement.
	self checkLabelledConditionalStatement:
		aFASTFortranIfArithmeticStatement.

	self
		findLabelledBlock: aFASTFortranIfArithmeticStatement lessLabel label
		setter: [ :labeledBlock |
			conditionalBlock nextBlock: labeledBlock onValue: #negative ].
	self
		findLabelledBlock:
		aFASTFortranIfArithmeticStatement equalLabel label
		setter: [ :labeledBlock |
			conditionalBlock nextBlock: labeledBlock onValue: #null ].
	self
		findLabelledBlock:
		aFASTFortranIfArithmeticStatement greaterLabel label
		setter: [ :labeledBlock |
			conditionalBlock nextBlock: labeledBlock onValue: #positive ].
	self closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [

	"conditionalBlock := self newConditionalBlock: aFASTFortranIfBlockStatement.
	self checkLabelledConditionalStatement: aFASTFortranIfBlockStatement.
	[...]"

	^ self visitFASTTConditionalStatement: aFASTFortranIfBlockStatement 
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [

	"conditionalBlock := self newConditionalBlock:
		                    aFASTFortranIfLogicalStatement.
	self checkLabelledConditionalStatement:
		aFASTFortranIfLogicalStatement.
	[...]"

	^ self visitFASTTConditionalStatement: aFASTFortranIfLogicalStatement 
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranReadStatement: aFASTFortranReadStatement [

	self visitFASTFortranIOStatement: aFASTFortranReadStatement
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranReturnStatement: aFASTFortranReturnStatement [
	"Ends the current basicBlock and has no nextBlock"

	self visitFASTFortranTStatement: aFASTFortranReturnStatement.

	currentBlock nextBlock: FASTCFGNullBlock new.
	self closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatement [
	"note: `super visitFASTFortranTStatementBlock:` instead of `super visitFASTFortranStatementBlock:`
	to avoid calling #visitTStatement:"

	super visitFASTFortranTStatementBlock: aFASTFortranStatement
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranStopStatement: aFASTFortranStopStatement [
	"Ends the current basicBlock and has no nextBlock"

	self visitFASTFortranTStatement: aFASTFortranStopStatement.

	currentBlock nextBlock: FASTCFGNullBlock new.
	self closeCurrentBlock
]

{ #category : 'visiting - expressions' }
FASTFortranCFGVisitor >> visitFASTFortranUnaryExpression: aFASTFortranUnaryExpression [
	"pruning the visit, no need to go inside expressions"

]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [

	self visitFASTFortranIOStatement: aFASTFortranWriteStatement
]
