"
a Fortran Return Statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentIfStatement` | `FASTTStatement` | `statement` | `FASTFortranIfLogicalStatement` | Parent if statement|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTTReturnStatement` | `returnOwner` | `FASTTExpression` | The expression returned|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `alternateReturnLable` | `String` | nil | Optional. Expression of type INTEGER or REAL|
| `endPos` | `Number` | nil | |
| `label` | `String` | nil | Determines the statement label which consists of 1 to 5 digits, with at least one nonzero|
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranReturnStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTTReturnStatement',
	#classTraits : 'FASTTReturnStatement classTrait',
	#instVars : [
		'#alternateReturnLable => FMProperty'
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
FASTFortranReturnStatement >> alternateReturnLable [

	<FMProperty: #alternateReturnLable type: #String>
	<generated>
	<FMComment: 'Optional. Expression of type INTEGER or REAL'>
	^ alternateReturnLable
]

{ #category : #accessing }
FASTFortranReturnStatement >> alternateReturnLable: anObject [
	<generated>
	alternateReturnLable := anObject
]
