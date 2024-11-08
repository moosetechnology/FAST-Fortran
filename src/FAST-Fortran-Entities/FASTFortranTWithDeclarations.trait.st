"
I have declarations

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declarations` | `FASTFortranTWithDeclarations` | `fortranDeclarationOwner` | `FASTFortranTDeclaration` | The elements I declare|



"
Trait {
	#name : 'FASTFortranTWithDeclarations',
	#instVars : [
		'#declarations => FMMany type: #FASTFortranTDeclaration opposite: #fortranDeclarationOwner'
	],
	#category : 'FAST-Fortran-Entities-Traits',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTFortranTWithDeclarations classSide >> annotation [

	<FMClass: #TWithDeclarations super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTFortranTWithDeclarations >> addDeclaration: anObject [
	<generated>
	^ self declarations add: anObject
]

{ #category : 'accessing' }
FASTFortranTWithDeclarations >> declarations [
	"Relation named: #declarations type: #FASTFortranTDeclaration opposite: #fortranDeclarationOwner"

	<generated>
	<FMComment: 'The elements I declare'>
	<derived>
	^ declarations
]

{ #category : 'accessing' }
FASTFortranTWithDeclarations >> declarations: anObject [

	<generated>
	declarations value: anObject
]

{ #category : 'navigation' }
FASTFortranTWithDeclarations >> declarationsGroup [
	<generated>
	<navigation: 'Declarations'>
	^ MooseSpecializedGroup withAll: self declarations asSet
]
