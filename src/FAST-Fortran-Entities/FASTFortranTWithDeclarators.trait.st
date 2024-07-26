"
I represent a declaration with several variable declarators

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declarators` | `FASTFortranTWithDeclarators` | `parentDeclaration` | `FASTFortranVariableDeclarator` | variables declared|



"
Trait {
	#name : 'FASTFortranTWithDeclarators',
	#instVars : [
		'#declarators => FMMany type: #FASTFortranVariableDeclarator opposite: #parentDeclaration'
	],
	#category : 'FAST-Fortran-Entities-Traits',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTFortranTWithDeclarators classSide >> annotation [

	<FMClass: #TWithDeclarators super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTFortranTWithDeclarators >> addDeclarator: anObject [
	<generated>
	^ self declarators add: anObject
]

{ #category : 'accessing' }
FASTFortranTWithDeclarators >> declarators [
	"Relation named: #declarators type: #FASTFortranVariableDeclarator opposite: #parentDeclaration"

	<generated>
	<FMComment: 'variables declared'>
	<derived>
	^ declarators
]

{ #category : 'accessing' }
FASTFortranTWithDeclarators >> declarators: anObject [

	<generated>
	declarators value: anObject
]

{ #category : 'navigation' }
FASTFortranTWithDeclarators >> declaratorsGroup [
	<generated>
	<navigation: 'Declarators'>
	^ MooseSpecializedGroup withAll: self declarators asSet
]
