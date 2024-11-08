"
I am a declaration in fortran

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fortranDeclarationOwner` | `FASTFortranTDeclaration` | `declarations` | `FASTFortranTWithDeclarations` | The element that declares me|



"
Trait {
	#name : 'FASTFortranTDeclaration',
	#instVars : [
		'#fortranDeclarationOwner => FMOne type: #FASTFortranTWithDeclarations opposite: #declarations'
	],
	#category : 'FAST-Fortran-Entities-Traits',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTFortranTDeclaration classSide >> annotation [

	<FMClass: #TDeclaration super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranTDeclaration >> fortranDeclarationOwner [
	"Relation named: #fortranDeclarationOwner type: #FASTFortranTWithDeclarations opposite: #declarations"

	<generated>
	<FMComment: 'The element that declares me'>
	<container>
	^ fortranDeclarationOwner
]

{ #category : 'accessing' }
FASTFortranTDeclaration >> fortranDeclarationOwner: anObject [

	<generated>
	fortranDeclarationOwner := anObject
]

{ #category : 'navigation' }
FASTFortranTDeclaration >> fortranDeclarationOwnerGroup [
	<generated>
	<navigation: 'FortranDeclarationOwner'>
	^ MooseSpecializedGroup with: self fortranDeclarationOwner
]
