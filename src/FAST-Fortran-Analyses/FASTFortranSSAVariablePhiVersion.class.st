Class {
	#name : #FASTFortranSSAVariablePhiVersion,
	#superclass : #FASTFortranSSAVariableVersion,
	#instVars : [
		'choices'
	],
	#category : #'FAST-Fortran-Analyses-SSA'
}

{ #category : #accessing }
FASTFortranSSAVariablePhiVersion >> name [

	^'phi(' ,
	($, join: (choices collect: #name)) ,
	')'
]

{ #category : #'instance creation' }
FASTFortranSSAVariablePhiVersion >> on: aCollection [

	localDeclaration := aCollection anyOne localDeclaration.
	choices := aCollection.
	version := nil.
]

{ #category : #accessing }
FASTFortranSSAVariablePhiVersion >> version [

	^(choices collect: #version) max
]

{ #category : #accessing }
FASTFortranSSAVariablePhiVersion >> version: anObject [

	self shouldNotImplement
]
