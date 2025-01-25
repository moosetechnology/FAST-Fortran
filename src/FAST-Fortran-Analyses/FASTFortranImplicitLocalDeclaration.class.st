"
I represent a FASTNonLocalDeclaration in Fortran where it can be an implicitDeclaration

I a more a marker than a real class
"
Class {
	#name : 'FASTFortranImplicitLocalDeclaration',
	#superclass : 'FASTFortranEntity',
	#classTraits : 'FASTTEntity classTrait',
	#category : 'FAST-Fortran-Analyses-Resolver',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'Resolver'
}

{ #category : 'visiting' }
FASTFortranImplicitLocalDeclaration >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranImplicitLocalDeclaration: self.

]

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

{ #category : 'accessing' }
FASTFortranImplicitLocalDeclaration >> name [

	^self firstUse name
]

{ #category : 'accessing' }
FASTFortranImplicitLocalDeclaration >> name: aName [

	"not needed"
]

{ #category : 'private - ssa' }
FASTFortranImplicitLocalDeclaration >> ssaVersion: aSSAVersion [

	^self firstUse ssaVersion: aSSAVersion


]

{ #category : 'accessing' }
FASTFortranImplicitLocalDeclaration >> variable [

	self flag: 'should not exist. Due to'.
	^self name
]
