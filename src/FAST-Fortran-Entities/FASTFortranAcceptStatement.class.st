"
I represent Fortran accept statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentIfStatement` | `FASTTStatement` | `statement` | `FASTFortranIfLogicalStatement` | Parent if statement|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `label` | `String` | nil | Determines the statement label which consists of 1 to 5 digits, with at least one nonzero|
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranAcceptStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAcceptStatement class >> annotation [

	<FMClass: #AcceptStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
