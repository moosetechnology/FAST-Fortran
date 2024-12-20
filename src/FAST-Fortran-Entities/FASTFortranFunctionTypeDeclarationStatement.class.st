"
I represent a return type declaration statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaredType` | `FASTFortranTDeclaredType` | `parentDeclaration` | `FASTFortranType` | type|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranFunctionTypeDeclarationStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTFortranTDeclaredType + FASTTNamedEntity',
	#classTraits : 'FASTFortranTDeclaredType classTrait + FASTTNamedEntity classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranFunctionTypeDeclarationStatement class >> annotation [

	<FMClass: #FunctionTypeDeclarationStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
