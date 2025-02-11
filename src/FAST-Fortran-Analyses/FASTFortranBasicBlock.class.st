"
A ""normal"" basic block in the CFG

it contains a list of statement (without branching) and have a successor block (#nextBlock)
"
Class {
	#name : 'FASTFortranBasicBlock',
	#superclass : 'FASTFortranAbstractBasicBlock',
	#instVars : [
		'nextBlock'
	],
	#category : 'FAST-Fortran-Analyses-CFG',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'CFG'
}

{ #category : 'accessing' }
FASTFortranBasicBlock >> nextBlock [

	^ nextBlock
]

{ #category : 'accessing' }
FASTFortranBasicBlock >> nextBlock: aBlock [
	"puts aBlock in #nextBlock unless it already contains aNullBlock"

	(nextBlock isNotNil and: [ nextBlock isNullBlock ])
	ifTrue: [ ^self ].
	
	nextBlock := aBlock
]

{ #category : 'accessing' }
FASTFortranBasicBlock >> nextBlockForValues [

	^{ #next -> self nextBlock }
]

{ #category : 'accessing' }
FASTFortranBasicBlock >> nextBlocks [

	^nextBlock
		ifNil: [ #() ]
		ifNotNil: [ { nextBlock } ]
]

{ #category : 'printing' }
FASTFortranBasicBlock >> sourceCode [

	^FASTFortranExporterVisitor export: (FASTFortranStatementBlock new
		statements: self statements ;
		yourself)
]
