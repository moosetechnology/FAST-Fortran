"
I represent Fortran Arithmetic Integer Literal (Constant)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentFormatedStatement` | `FASTFortranTFormat` | `format` | `FASTFortranTWithFormat` | A format description in a Format/Print/Read/Write statement|
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranAbstractIOStatement` | |



"
Class {
	#name : 'FASTFortranIntegerLiteral',
	#superclass : 'FASTFortranNumericalConstant',
	#traits : 'FASTFortranTFormat',
	#classTraits : 'FASTFortranTFormat classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranIntegerLiteral class >> annotation [

	<FMClass: #IntegerLiteral super: #FASTFortranNumericalConstant>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
