Class {
	#name : 'FASTFortranSSAVariablePhiVersion',
	#superclass : 'FASTFortranSSAVariableVersion',
	#instVars : [
		'choices'
	],
	#category : 'FAST-Fortran-Analyses-SSA',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'SSA'
}

{ #category : 'adding' }
FASTFortranSSAVariablePhiVersion >> addChoiceToPhi: aPhiVersion [

	choices do: [ :v | v addChoiceToPhi: aPhiVersion ]
]

{ #category : 'accessing' }
FASTFortranSSAVariablePhiVersion >> choices [

	^choices
]

{ #category : 'instance creation' }
FASTFortranSSAVariablePhiVersion >> for: aCollection [

	localDeclaration := aCollection anyOne localDeclaration.
	version := nil.

	choices := OrderedCollection new.
	aCollection do: [ :v | v addChoiceToPhi: self ]

]

{ #category : 'accessing' }
FASTFortranSSAVariablePhiVersion >> name [

	^'phi(' ,
	($, join: (choices collect: #name)) ,
	')'
]

{ #category : 'accessing' }
FASTFortranSSAVariablePhiVersion >> version [

	^(choices collect: #version) max
]

{ #category : 'accessing' }
FASTFortranSSAVariablePhiVersion >> version: anObject [

	self shouldNotImplement
]
