"
I represent Fortran Read statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|
| `ioParameters` | `FASTFortranTWithIOParameters` | `parentIOStatement` | `FASTFortranTIOParameter` | I represent a statement with IO-parameters (read or write)|



"
Class {
	#name : #FASTFortranReadStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithIOParameters + FASTTWithArguments',
	#classTraits : 'FASTFortranTWithIOParameters classTrait + FASTTWithArguments classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranReadStatement class >> annotation [

	<FMClass: #ReadStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
