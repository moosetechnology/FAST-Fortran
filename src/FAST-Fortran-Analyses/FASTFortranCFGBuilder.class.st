Class {
	#name : 'FASTFortranCFGBuilder',
	#superclass : 'FASTGenericCFGBuilder',
	#instVars : [
		'labelReferences'
	],
	#category : 'FAST-Fortran-Analyses-CFG',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'CFG'
}

{ #category : 'basicBlocks' }
FASTFortranCFGBuilder >> chainRegisteredJumps: aLabel toBlock: labeledBlock [
	"When a new label is found, check if there are pas goto statements registered for it.
	 If so, chains the registered blocks to the new labeledBlock"

	(labelReferences at: aLabel ifAbsent: [ #(  ) ])
		do: [ :setterAction | setterAction value: labeledBlock ].

	labelReferences removeKey: aLabel ifAbsent: [ ].
]

{ #category : 'basicBlocks' }
FASTFortranCFGBuilder >> checkLabelledConditionalStatement: aFASTFortranTStatement [
	"simlar to #checkLabelledStatement: but does not set the #nextStatement of currentStatement"

	aFASTFortranTStatement label ifNil: [ ^ self ].

	self
		chainRegisteredJumps: aFASTFortranTStatement label
		toBlock: currentBlock
]

{ #category : 'basicBlocks' }
FASTFortranCFGBuilder >> checkLabelledStatement: aFASTFortranTStatement [
	"Labelled statement start a new block (except if we are already at the start of a new one)
	 Plus need to check whether we met a goto referring to this label earlier"

	| newBlock |
	aFASTFortranTStatement label ifNil: [ ^ self ].

	newBlock := self newBasicBlock: FASTBasicBlock.
	self addPendingNextBlockAction: [ :nextBlock | newBlock nextBlock: nextBlock ].

	self
		chainRegisteredJumps: aFASTFortranTStatement label
		toBlock: newBlock
]

{ #category : 'basicBlocks' }
FASTFortranCFGBuilder >> findLabelledBlock: label setter: settingAction [
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
FASTFortranCFGBuilder >> initialize [ 

	super initialize.
	
	labelReferences := Dictionary new
]

{ #category : 'private' }
FASTFortranCFGBuilder >> ioStatementBranches: anIOStatement [

	"IO Statements are  BACKSPACE, CLOSE, DECODE, ENCODE, ENDFILE, OPEN, READ, REWIND, WRITE
	 They can be branching statements if they have END=<label> or ERR=<label> io parameters"

	^anIOStatement ioParameters select: [ :parameter |
		(parameter class = FASTFortranAssignmentExpression) and:
		[ #('end' 'err') anySatisfy: [ :specialVar | parameter variable name = specialVar ] ]
	]
]

{ #category : 'basicBlocks' }
FASTFortranCFGBuilder >> registerReference: setterAction toLabel: label [
	"#setterAction is a Pharo block taking one BasicBlock as argument and seting a jump to this block when executed"

	(labelReferences at: label ifAbsentPut: [ OrderedCollection new ])
		add: setterAction
]
