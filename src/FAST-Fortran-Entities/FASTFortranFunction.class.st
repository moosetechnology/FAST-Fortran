"
I represent a Fortran Function

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `returnType` | `FASTFortranTTypedFunction` | `typedFunctions` | `FASTFortranType` | |



"
Class {
	#name : 'FASTFortranFunction',
	#superclass : 'FASTFortranProcedure',
	#traits : 'FASTFortranTTypedFunction',
	#classTraits : 'FASTFortranTTypedFunction classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranFunction class >> annotation [

	<FMClass: #Function super: #FASTFortranProcedure>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
