"
I represent Fortran External statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `procedures` | `FASTFortranExternalStatement` | `externalStatement` | `FASTFortranExternalProcedure` | |


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
	#traits : 'FASTTNamedEntity',
	#classTraits : 'FASTTNamedEntity classTrait',
	#instVars : [
		'#procedures => FMMany type: #FASTFortranExternalProcedure opposite: #externalStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranExternalStatement class >> annotation [

	<FMClass: #ExternalStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranExternalStatement >> addProcedure: anObject [
	<generated>
	^ self procedures add: anObject
]

{ #category : #accessing }
FASTFortranExternalStatement >> procedures [
	"Relation named: #procedures type: #FASTFortranExternalProcedure opposite: #externalStatement"

	<generated>
	<derived>
	^ procedures
]

{ #category : #accessing }
FASTFortranExternalStatement >> procedures: anObject [

	<generated>
	procedures value: anObject
]

{ #category : #navigation }
FASTFortranExternalStatement >> proceduresGroup [
	<generated>
	<navigation: 'Procedures'>
	^ MooseSpecializedGroup withAll: self procedures asSet
]
