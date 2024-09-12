"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `interface` | `FASTFortran2kIModuleProcedureSummary` | `interfaceProcedure` | `FASTFortran2kInterface` | |
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
	#name : 'FASTFortran2kIModuleProcedureSummary',
	#superclass : 'FASTFortran2kInterfaceProcedure',
	#category : 'FAST-Fortran2k-Entities-Entities',
	#package : 'FAST-Fortran2k-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortran2kIModuleProcedureSummary class >> annotation [

	<FMClass: #IModuleProcedureSummary super: #FASTFortran2kInterfaceProcedure>
	<package: #'FAST-Fortran2k-Entities'>
	<generated>
	^ self
]
