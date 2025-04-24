"
I represent a fortran statement with a condition: if-block, if-logical

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
| `condition` | `FASTTConditionalStatement` | `parentConditionalStatement` | `FASTTExpression` | The boolean condition tested|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranConditionalStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTTConditionalStatement',
	#classTraits : 'FASTTConditionalStatement classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranConditionalStatement class >> annotation [

	<FMClass: #ConditionalStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
