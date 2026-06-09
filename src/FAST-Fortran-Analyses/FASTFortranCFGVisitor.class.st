"
A FASTFortranVisitor that computes ConftrolFlowGraph on the statements

It is based on the algorithm to compute basic blocks from [https://en.wikipedia.org/wiki/Basic_block](https://en.wikipedia.org/wiki/Basic_block)
"
Class {
	#name : 'FASTFortranCFGVisitor',
	#superclass : 'FASTFortranVisitor',
	#traits : 'FASTTCFGVisitor',
	#classTraits : 'FASTTCFGVisitor classTrait',
	#instVars : [
		'cfgBuilder'
	],
	#category : 'FAST-Fortran-Analyses-CFG',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'CFG'
}

{ #category : 'visiting - expressions' }
FASTFortranCFGVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [
	"pruning the visit, no need to go inside expressions"

]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [

	^ self visitFASTFortranTStatement: aFASTFortranCallStatement
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [
	"basic blocks for a LOOP
	 - ConditionalBlock that need to be chained as #nextBlock of current one
	 - BasicBlock for the body of the loop
	 - another BasicBlock for after the LOOP"

	| conditionalBlock |
	conditionalBlock := cfgBuilder newConditionalBlock:
		                    aFASTFortranDoStatement.
	cfgBuilder checkLabelledConditionalStatement: aFASTFortranDoStatement.
	cfgBuilder parentLoopBlocks push: conditionalBlock.

	"loop body"
	self assert: cfgBuilder pendingNextBlock isEmpty.
	cfgBuilder addPendingNextBlockAction: [ :bodyBlock |
		conditionalBlock nextBlock: bodyBlock onValue: true ].
	cfgBuilder closeCurrentBlock.
	aFASTFortranDoStatement body accept: self.
	cfgBuilder chainPendingBlocksTo: conditionalBlock.

	"after loop"
	self assert: cfgBuilder pendingNextBlock isEmpty.
	cfgBuilder addPendingNextBlockAction: [ :afterBlock |
		conditionalBlock nextBlock: afterBlock onValue: false ].

	cfgBuilder parentLoopBlocks pop.
	cfgBuilder closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [
	"looks a bit like a GOTO, but does not need to specify the label (goes to enclosing loop)"

	self visitFASTFortranTStatement: aFASTFortranExitStatement.

	cfgBuilder chainPendingBlocksTo:
		(cfgBuilder findParentLoopBlock: nil). "aFASTFortranExitStatement label"

	cfgBuilder closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [
	"GoTo with several possible target labels
	 - new ConditionalBlock (#nextBlock of current one)
	 - need to chain labelled blocks to each target label"

	| conditionalBlock |
	conditionalBlock := cfgBuilder newConditionalBlock:
		                    aFASTFortranGoToComputedStatement.
	cfgBuilder checkLabelledConditionalStatement:
		aFASTFortranGoToComputedStatement.

	aFASTFortranGoToComputedStatement labelReferences do: [
			:labelReference |
			cfgBuilder
				findLabelledBlock: labelReference label
				setter: [ :labeledBlock |
					conditionalBlock
						nextBlock: labeledBlock
						onValue: labelReference label ] ].

	cfgBuilder closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [
	"todo:
	 - end currentBlock (contains this statement)
	 - nextBlock of currentBlock is a block starting on the right label
	Note: need to introduce a local variable because the setter block can be evaluated later
	and we want it to reference the current value of #currentBlock, not the value it will have
	at this later time"

	| gotoBlock |

	self visitFASTFortranTStatement: aFASTFortranGoToStatement.

	gotoBlock := cfgBuilder currentBlock.
	cfgBuilder
		findLabelledBlock:
		aFASTFortranGoToStatement labelReferences anyOne label
		setter: [ :labeledBlock | gotoBlock nextBlock: labeledBlock ].

	cfgBuilder removePendingActionFor: cfgBuilder currentBlock.
	cfgBuilder closeCurrentBlock
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
	branches := cfgBuilder ioStatementBranches: aFASTFortranIOStatement.
	branches ifEmpty: [
		^ self visitFASTFortranTStatement: aFASTFortranIOStatement ].

	ioBlock := cfgBuilder newConditionalBlock: aFASTFortranIOStatement.
	cfgBuilder checkLabelledConditionalStatement: aFASTFortranIOStatement.

	branches do: [ :assignExpr |
			cfgBuilder
				findLabelledBlock: assignExpr expression primitiveValue
				setter: [ :labeledBlock |
					ioBlock nextBlock: labeledBlock onValue: assignExpr variable name ] ].
	cfgBuilder addPendingNextBlockAction: [ :nextBlock |
		ioBlock nextBlock: nextBlock onValue: 'proceed' ].

	cfgBuilder closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [
	"Note: next statement after an ArithmeticIf should be labelled or there is no way it gets executed"

	| conditionalBlock |
	conditionalBlock := cfgBuilder newConditionalBlock:
		                    aFASTFortranIfArithmeticStatement.
	cfgBuilder checkLabelledConditionalStatement:
		aFASTFortranIfArithmeticStatement.

	cfgBuilder
		findLabelledBlock: aFASTFortranIfArithmeticStatement lessLabel label
		setter: [ :labeledBlock |
			conditionalBlock nextBlock: labeledBlock onValue: #negative ].
	cfgBuilder
		findLabelledBlock:
		aFASTFortranIfArithmeticStatement equalLabel label
		setter: [ :labeledBlock |
			conditionalBlock nextBlock: labeledBlock onValue: #null ].
	cfgBuilder
		findLabelledBlock:
		aFASTFortranIfArithmeticStatement greaterLabel label
		setter: [ :labeledBlock |
			conditionalBlock nextBlock: labeledBlock onValue: #positive ].
	cfgBuilder closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [
	"basic blocks for a IF
	 - new ConditionalBlock (#nextBlock of current one)
	 - BasicBlock for the then-part
	 - BasicBlock for the else-part
	 - bth then and else part will be chained to whatever follows"

	| conditionalBlock thenLastBlock |

	conditionalBlock := cfgBuilder newConditionalBlock:
		                    aFASTFortranIfBlockStatement.
	cfgBuilder checkLabelledConditionalStatement: aFASTFortranIfBlockStatement.

	"then-part"
	self assert: cfgBuilder pendingNextBlock isEmpty.
	cfgBuilder addPendingNextBlockAction: [ :thenBlock |
		conditionalBlock nextBlock: thenBlock onValue: true ].
	cfgBuilder closeCurrentBlock.
	aFASTFortranIfBlockStatement thenStatementBlock accept: self.

	"else part
	 need to empty the pendingNextBlocks from then-part while processing else-part"
	thenLastBlock := cfgBuilder pendingNextBlock copy.
	cfgBuilder pendingNextBlock removeAll.
	cfgBuilder addPendingNextBlockAction: [ :elseBlock |
		conditionalBlock nextBlock: elseBlock onValue: false ].
	cfgBuilder closeCurrentBlock.
	aFASTFortranIfBlockStatement elseStatementBlock ifNotNil: [ :elsePart |
		elsePart accept: self ].

	"put back the pendingNextBlocks from then-part"
	cfgBuilder pendingNextBlock addAll: thenLastBlock.
	cfgBuilder closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [

	| conditionalBlock |

	conditionalBlock := cfgBuilder newConditionalBlock:
		                    aFASTFortranIfLogicalStatement.
	cfgBuilder checkLabelledConditionalStatement:
		aFASTFortranIfLogicalStatement.

	"then-statement"
	self assert: cfgBuilder pendingNextBlock isEmpty.
	cfgBuilder addPendingNextBlockAction: [ :thenBlock |
		conditionalBlock nextBlock: thenBlock onValue: true ].
	cfgBuilder closeCurrentBlock.
	aFASTFortranIfLogicalStatement statement accept: self.

	"else part"
	cfgBuilder addPendingNextBlockAction: [ :elseBlock |
		conditionalBlock nextBlock: elseBlock onValue: false ].
	cfgBuilder closeCurrentBlock
]

{ #category : 'visiting - programUnits' }
FASTFortranCFGVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [

	| visit |
	visit := super visitFASTFortranProgramUnit: aFASTFortranProgramUnit.

	cfgBuilder basicBlocks first isStart: true.

	^ visit
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranReadStatement: aFASTFortranReadStatement [

	self visitFASTFortranIOStatement: aFASTFortranReadStatement
]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranReturnStatement: aFASTFortranReturnStatement [
	"Ends the current basicBlock and has no nextBlock"

	self visitFASTFortranTStatement: aFASTFortranReturnStatement.

	cfgBuilder currentBlock nextBlock: FASTNullBlock new.
	cfgBuilder closeCurrentBlock
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

	cfgBuilder currentBlock nextBlock: FASTNullBlock new.
	cfgBuilder closeCurrentBlock
]

{ #category : 'visiting - traits' }
FASTFortranCFGVisitor >> visitFASTFortranTStatement: aFASTFortranTStatement [

	| newBlock |

	cfgBuilder checkLabelledStatement: aFASTFortranTStatement.

	cfgBuilder currentBlock ifNil: [
		newBlock := cfgBuilder newBasicBlock: FASTBasicBlock.
		cfgBuilder addPendingNextBlockAction: [ :nextBlock |
			newBlock nextBlock: nextBlock ] ].
	cfgBuilder currentBlock addStatement: aFASTFortranTStatement

	"super visitFASTFortranTStatement: aFASTFortranTStatement."
]

{ #category : 'visiting - expressions' }
FASTFortranCFGVisitor >> visitFASTFortranUnaryExpression: aFASTFortranUnaryExpression [
	"pruning the visit, no need to go inside expressions"

]

{ #category : 'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [

	self visitFASTFortranIOStatement: aFASTFortranWriteStatement
]
