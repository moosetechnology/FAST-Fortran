"
a Fortran Return Statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTTReturnStatement` | `returnOwner` | `FASTTExpression` | The expression returned|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `alternateReturnLabel` | `String` | nil | Optional. Expression of type INTEGER or REAL|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranReturnStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTTReturnStatement',
	#classTraits : 'FASTTReturnStatement classTrait',
	#instVars : [
		'#alternateReturnLabel => FMProperty'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranReturnStatement class >> annotation [

	<FMClass: #ReturnStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranReturnStatement >> alternateReturnLabel [

	<FMProperty: #alternateReturnLabel type: #String>
	<generated>
	<FMComment: 'Optional. Expression of type INTEGER or REAL'>
	^ alternateReturnLabel
]

{ #category : 'accessing' }
FASTFortranReturnStatement >> alternateReturnLabel: anObject [
	<generated>
	alternateReturnLabel := anObject
]
