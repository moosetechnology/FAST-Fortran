"
A virtual entity representing all the content of an included file

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FASTTWithComments` | `container` | `FASTTComment` | list of comments defined in the entity|
| `declarations` | `FASTFortranTWithDeclarations` | `fortranDeclarationOwner` | `FASTFortranTDeclaration` | The elements I declare|



"
Class {
	#name : 'FASTFortranIncludedFile',
	#superclass : 'FASTFortranStatementBlock',
	#traits : 'FASTFortranTWithDeclarations + FASTTWithComments',
	#classTraits : 'FASTFortranTWithDeclarations classTrait + FASTTWithComments classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranIncludedFile class >> annotation [

	<FMClass: #IncludedFile super: #FASTFortranStatementBlock>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
