"
I represent a Fortran Data statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variableGroups` | `FASTFortranTWithVariableGroups` | `withVariableGroups` | `FASTFortranTVariableGroup` | |



"
Class {
	#name : 'FASTFortranDataStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTFortranTWithVariableGroups',
	#classTraits : 'FASTFortranTWithVariableGroups classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranDataStatement class >> annotation [

	<FMClass: #DataStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
