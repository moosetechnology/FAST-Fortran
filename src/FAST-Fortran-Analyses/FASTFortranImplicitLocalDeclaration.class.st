"
I represent a FASTNonLocalDeclaration in Fortran where variables can be implicitly declared

"
Class {
	#name : 'FASTFortranImplicitLocalDeclaration',
	#superclass : 'FASTEntity',
	#category : 'FAST-Fortran-Analyses-Resolver',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'Resolver'
}

{ #category : 'private - ssa' }
FASTFortranImplicitLocalDeclaration >> activeVersion [

	^self firstUse activeVersion
]

{ #category : 'private - ssa' }
FASTFortranImplicitLocalDeclaration >> activeVersion: aSSAVersion [

	^self firstUse activeVersion: aSSAVersion
]

{ #category : 'accessing' }
FASTFortranImplicitLocalDeclaration >> firstUse [
	"For an implicit declaration, the firstUse is considered the 'declaration' "

	^self localUses first
]

{ #category : 'testing' }
FASTFortranImplicitLocalDeclaration >> isImplicitDeclaration [

	^true
]

{ #category : 'testing' }
FASTFortranImplicitLocalDeclaration >> isParameter [

	^false
]

{ #category : 'accessing' }
FASTFortranImplicitLocalDeclaration >> name [

	^self firstUse name
]

{ #category : 'accessing' }
FASTFortranImplicitLocalDeclaration >> name: aName [

	"not needed"
]

{ #category : 'printing' }
FASTFortranImplicitLocalDeclaration >> printOn: aStream [
	"Overrides MooseEntity>>printOn: because this is not a real MooseEntity (not meta-described)
	 We duplicated Object>>printOn:"

	| title |
	title := self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title
]

{ #category : 'private - ssa' }
FASTFortranImplicitLocalDeclaration >> ssaVersion: aSSAVersion [

	^self firstUse ssaVersion: aSSAVersion


]
