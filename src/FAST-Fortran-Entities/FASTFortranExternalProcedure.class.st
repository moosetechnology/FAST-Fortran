"
I represent a procedure in a ExternalStatement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `externalStatement` | `FASTFortranExternalProcedure` | `procedures` | `FASTFortranExternalStatement` | |
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranExternalProcedure,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTTNamedEntity',
	#classTraits : 'FASTTNamedEntity classTrait',
	#instVars : [
		'#externalStatement => FMOne type: #FASTFortranExternalStatement opposite: #procedures'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranExternalProcedure class >> annotation [

	<FMClass: #ExternalProcedure super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranExternalProcedure >> externalStatement [
	"Relation named: #externalStatement type: #FASTFortranExternalStatement opposite: #procedures"

	<generated>
	<container>
	^ externalStatement
]

{ #category : #accessing }
FASTFortranExternalProcedure >> externalStatement: anObject [

	<generated>
	externalStatement := anObject
]

{ #category : #navigation }
FASTFortranExternalProcedure >> externalStatementGroup [
	<generated>
	<navigation: 'ExternalStatement'>
	^ MooseSpecializedGroup with: self externalStatement
]
