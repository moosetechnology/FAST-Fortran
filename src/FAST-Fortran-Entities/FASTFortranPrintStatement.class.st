"
I represent Fortran Print statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|
| `format` | `FASTFortranTWithFormat` | `parentFormatedStatement` | `FASTFortranTFormat` | The description of the format|



"
Class {
	#name : #FASTFortranPrintStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithFormat + FASTTWithArguments',
	#classTraits : 'FASTFortranTWithFormat classTrait + FASTTWithArguments classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranPrintStatement class >> annotation [

	<FMClass: #PrintStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
