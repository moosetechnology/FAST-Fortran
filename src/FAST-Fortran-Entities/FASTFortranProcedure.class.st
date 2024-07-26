"
I represent a fortran subroutine or a function

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parameters` | `FASTTWithParameters` | `parameterOwner` | `FASTTVariableEntity` | My parameters|



"
Class {
	#name : 'FASTFortranProcedure',
	#superclass : 'FASTFortranSubprogram',
	#traits : 'FASTTWithParameters',
	#classTraits : 'FASTTWithParameters classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranProcedure class >> annotation [

	<FMClass: #Procedure super: #FASTFortranSubprogram>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
