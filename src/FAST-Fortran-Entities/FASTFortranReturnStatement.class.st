"
a Fortran Return Statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentIfStatement` | `FASTFortranTStatement` | `statement` | `FASTFortranIfLogicalStatement` | Parent if statement|
| `statementContainer` | `FASTFortranTStatement` | `statements` | `FASTFortranTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTFortranTReturnStatement` | `returnOwner` | `FASTFortranTExpression` | The expression returned|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `alternateReturnLabel` | `String` | nil | Optional. Expression of type INTEGER or REAL|
| `endPos` | `Number` | nil | |
| `label` | `String` | nil | Determines the statement label which consists of 1 to 5 digits, with at least one nonzero|
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranReturnStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTReturnStatement',
	#classTraits : 'FASTFortranTReturnStatement classTrait',
	#instVars : [
		'#alternateReturnLabel => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranReturnStatement class >> annotation [

	<FMClass: #ReturnStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranReturnStatement >> alternateReturnLabel [

	<FMProperty: #alternateReturnLabel type: #String>
	<generated>
	<FMComment: 'Optional. Expression of type INTEGER or REAL'>
	^ alternateReturnLabel
]

{ #category : #accessing }
FASTFortranReturnStatement >> alternateReturnLabel: anObject [
	<generated>
	alternateReturnLabel := anObject
]
