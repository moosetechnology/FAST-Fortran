"
I represent Fortran Write statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|
| `ioParameters` | `FASTFortranTWithIOParameters` | `parentIOStatement` | `FASTFortranTIOParameter` | I represent a statement with IO-parameters (read or write)|



"
Class {
	#name : #FASTFortranWriteStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithIOParameters + FASTTWithArguments',
	#classTraits : 'FASTFortranTWithIOParameters classTrait + FASTTWithArguments classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranWriteStatement class >> annotation [

	<FMClass: #WriteStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
