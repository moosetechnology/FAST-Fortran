"
I represent Fortran Read statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|



"
Class {
	#name : #FASTFortranReadStatement,
	#superclass : #FASTFortranAbstractIOStatement,
	#traits : 'FASTTWithArguments',
	#classTraits : 'FASTTWithArguments classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranReadStatement class >> annotation [

	<FMClass: #ReadStatement super: #FASTFortranAbstractIOStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
