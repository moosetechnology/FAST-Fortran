"
I represent a FASTNonLocalDeclaration in Fortran where it can be an implicitDeclaration

I a more a marker than a real class
"
Class {
	#name : #FASTFortranImplicitLocalDeclaration,
	#superclass : #FASTNonLocalDeclaration,
	#category : #'FAST-Fortran-Analyses-Resolver'
}

{ #category : #accessing }
FASTFortranImplicitLocalDeclaration >> firstUse [
	"For an implicit declaration, the firstUse is considered the 'declaration' "

	^self localUses first
]

{ #category : #testing }
FASTFortranImplicitLocalDeclaration >> isImplicitDeclaration [

	^true
]
