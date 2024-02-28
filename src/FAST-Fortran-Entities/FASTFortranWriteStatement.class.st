"
I represent Fortran Write statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTFortranTWithArguments` | `argumentOwner` | `FASTFortranTExpression` | My arguments|



"
Class {
	#name : #FASTFortranWriteStatement,
	#superclass : #FASTFortranAbstractIOStatement,
	#traits : 'FASTFortranTWithArguments',
	#classTraits : 'FASTFortranTWithArguments classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranWriteStatement class >> annotation [

	<FMClass: #WriteStatement super: #FASTFortranAbstractIOStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
