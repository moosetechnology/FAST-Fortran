"
I represent Fortran External statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTFortranTNamedEntity` | `invoked` | `FASTFortranTInvocation` | Optional invocation where this name is used|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranExternalStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTNamedEntity',
	#classTraits : 'FASTFortranTNamedEntity classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranExternalStatement class >> annotation [

	<FMClass: #ExternalStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
