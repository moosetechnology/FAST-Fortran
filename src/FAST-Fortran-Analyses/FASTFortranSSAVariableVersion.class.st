Class {
	#name : #FASTFortranSSAVariableVersion,
	#superclass : #Object,
	#instVars : [
		'version',
		'localDeclaration'
	],
	#category : #'FAST-Fortran-Analyses-SSA'
}

{ #category : #'instance creation' }
FASTFortranSSAVariableVersion class >> for: aFASTFortranVariable [

	^self new
		on: aFASTFortranVariable ;
		yourself
]

{ #category : #accessing }
FASTFortranSSAVariableVersion >> localDeclaration [

	^localDeclaration
]

{ #category : #accessing }
FASTFortranSSAVariableVersion >> localDeclaration: anObject [

	localDeclaration := anObject
]

{ #category : #accessing }
FASTFortranSSAVariableVersion >> name [

	^localDeclaration variable , '_' , version asString
]

{ #category : #'instance creation' }
FASTFortranSSAVariableVersion >> on: aFASTFortranVariable [

	localDeclaration := aFASTFortranVariable localDeclaration.
	version := localDeclaration newVersionNumber
]

{ #category : #testing }
FASTFortranSSAVariableVersion >> sameVariableAs: otherFASTFortranVariable [

	^self localDeclaration = otherFASTFortranVariable localDeclaration 
]

{ #category : #accessing }
FASTFortranSSAVariableVersion >> version [

	^ version
]

{ #category : #accessing }
FASTFortranSSAVariableVersion >> version: anObject [

	version := anObject
]
