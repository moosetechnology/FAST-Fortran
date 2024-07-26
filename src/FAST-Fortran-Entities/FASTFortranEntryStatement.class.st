"
I represent Fortran Entry statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `entryArguments` | `FASTFortranEntryStatement` | `entryStatement` | `FASTFortranTEntryArgument` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranEntryStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTTNamedEntity',
	#classTraits : 'FASTTNamedEntity classTrait',
	#instVars : [
		'#entryArguments => FMMany type: #FASTFortranTEntryArgument opposite: #entryStatement'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranEntryStatement class >> annotation [

	<FMClass: #EntryStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTFortranEntryStatement >> addEntryArgument: anObject [
	<generated>
	^ self entryArguments add: anObject
]

{ #category : 'accessing' }
FASTFortranEntryStatement >> entryArguments [
	"Relation named: #entryArguments type: #FASTFortranTEntryArgument opposite: #entryStatement"

	<generated>
	<derived>
	^ entryArguments
]

{ #category : 'accessing' }
FASTFortranEntryStatement >> entryArguments: anObject [

	<generated>
	entryArguments value: anObject
]

{ #category : 'navigation' }
FASTFortranEntryStatement >> entryArgumentsGroup [
	<generated>
	<navigation: 'EntryArguments'>
	^ MooseSpecializedGroup withAll: self entryArguments asSet
]
