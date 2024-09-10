"
I represent the declaration of the function after an ExternalStatement
(usually appears right after the EXTERNAL statement)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `returnType` | `FASTFortranTTypedFunction` | `typedFunctions` | `FASTFortranType` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranExternalFunctionDeclarationStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTFortranTTypedFunction + FASTTNamedEntity',
	#classTraits : 'FASTFortranTTypedFunction classTrait + FASTTNamedEntity classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranExternalFunctionDeclarationStatement class >> annotation [

	<FMClass: #ExternalFunctionDeclarationStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
