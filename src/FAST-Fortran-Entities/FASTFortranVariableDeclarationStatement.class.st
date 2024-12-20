"
I represent a type declaration for one or many scalar variables or arrays

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declarators` | `FASTFortranTWithDeclarators` | `parentDeclaration` | `FASTFortranVariableDeclarator` | variables declared|
| `declaredType` | `FASTFortranTDeclaredType` | `parentDeclaration` | `FASTFortranType` | type|



"
Class {
	#name : 'FASTFortranVariableDeclarationStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTFortranTDeclaredType + FASTFortranTWithDeclarators',
	#classTraits : 'FASTFortranTDeclaredType classTrait + FASTFortranTWithDeclarators classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranVariableDeclarationStatement class >> annotation [

	<FMClass: #VariableDeclarationStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
