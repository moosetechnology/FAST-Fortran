"
I represent Fortran Read statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTFortranTWithArguments` | `argumentOwner` | `FASTFortranTExpression` | My arguments|



"
Class {
	#name : #FASTFortranReadStatement,
	#superclass : #FASTFortranAbstractIOStatement,
	#traits : 'FASTFortranTWithArguments',
	#classTraits : 'FASTFortranTWithArguments classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranReadStatement class >> annotation [

	<FMClass: #ReadStatement super: #FASTFortranAbstractIOStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
