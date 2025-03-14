Class {
	#name : 'FASTFortranSSAVariableVersion',
	#superclass : 'Object',
	#instVars : [
		'version',
		'localDeclaration'
	],
	#category : 'FAST-Fortran-Analyses-SSA',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'SSA'
}

{ #category : 'instance creation' }
FASTFortranSSAVariableVersion class >> for: aFASTFortranVariable [

	^self new
		for: aFASTFortranVariable ;
		yourself
]

{ #category : 'adding' }
FASTFortranSSAVariableVersion >> addChoiceToPhi: aPhiVersion [

	aPhiVersion choices add: self
]

{ #category : 'instance creation' }
FASTFortranSSAVariableVersion >> for: aFASTFortranVariable [

	localDeclaration := aFASTFortranVariable localDeclaration.
]

{ #category : 'initialization' }
FASTFortranSSAVariableVersion >> initialize [

	super initialize.

	version := 0
]

{ #category : 'accessing' }
FASTFortranSSAVariableVersion >> localDeclaration [

	^localDeclaration
]

{ #category : 'accessing' }
FASTFortranSSAVariableVersion >> localDeclaration: anObject [

	localDeclaration := anObject
]

{ #category : 'accessing' }
FASTFortranSSAVariableVersion >> name [

	^localDeclaration name , '_' , version asString
]

{ #category : 'instance creation' }
FASTFortranSSAVariableVersion >> newVersionNumber [

	^version := version + 1
]

{ #category : 'testing' }
FASTFortranSSAVariableVersion >> sameVariableAs: otherFASTFortranVariable [

	^self localDeclaration = otherFASTFortranVariable localDeclaration 
]

{ #category : 'accessing' }
FASTFortranSSAVariableVersion >> version [

	^ version
]

{ #category : 'accessing' }
FASTFortranSSAVariableVersion >> version: anObject [

	version := anObject
]
