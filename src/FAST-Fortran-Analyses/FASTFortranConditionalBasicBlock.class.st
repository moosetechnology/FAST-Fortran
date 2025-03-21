"
A conditional or branching block in the CFG

It contains one statement which is a conditional or branching statement

It has several successors, each associated to a value
For example an if-statement will be represented has a ConditionalBasicBlock and will have two succesors associated respectively to the `true` and `false` values
"
Class {
	#name : 'FASTFortranConditionalBasicBlock',
	#superclass : 'FASTFortranAbstractBasicBlock',
	#instVars : [
		'nextBlocks'
	],
	#category : 'FAST-Fortran-Analyses-CFG',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'CFG'
}

{ #category : 'accessing' }
FASTFortranConditionalBasicBlock >> addStatement: aStatement [

	self isEmpty ifFalse: [ AssertionFailure signal: 'ConditionalBasicBlocks can have only one statement' ].

	super addStatement: aStatement
]

{ #category : 'initialization' }
FASTFortranConditionalBasicBlock >> initialize [

	super initialize.

	nextBlocks := Dictionary new: 2
]

{ #category : 'testing' }
FASTFortranConditionalBasicBlock >> isConditional [

	^true
]

{ #category : 'accessing' }
FASTFortranConditionalBasicBlock >> isFinal [

	super isFinal ifTrue: [ ^true ].
	nextBlocks valuesDo: [ :nextBlock | nextBlock ifNil: [ ^true ] ].
	^false
]

{ #category : 'accessing' }
FASTFortranConditionalBasicBlock >> nextBlock: aBlock onValue: aValue [
	"if the next block for aValue is not a NullBlock, then set it to aBlock, otherwise leave the NullBlock"
	| currentNext |

	currentNext := nextBlocks at: aValue ifAbsent: [ self ].
	currentNext ifNil: [ currentNext := self ].

	currentNext isNullBlock ifTrue: [ ^self ].

	nextBlocks at: aValue put: aBlock
]

{ #category : 'accessing' }
FASTFortranConditionalBasicBlock >> nextBlockForValue: aValue [

	^nextBlocks at: aValue ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTFortranConditionalBasicBlock >> nextBlockForValues [

	^nextBlocks associations
]

{ #category : 'accessing' }
FASTFortranConditionalBasicBlock >> nextBlocks [

	^nextBlocks values
]

{ #category : 'printing' }
FASTFortranConditionalBasicBlock >> sourceCode [

	^self firstStatement exportForCFG
]

{ #category : 'accessing' }
FASTFortranConditionalBasicBlock >> statement: aFASTFortranStatement [

	self addStatement: aFASTFortranStatement 
]
