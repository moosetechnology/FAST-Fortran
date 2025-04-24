"
I represent Fortran Do While statement

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
| `body` | `FASTTLoopStatement` | `parentLoopStatement` | `FASTTStatement` | The body of the loop|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranDoWhileStatement',
	#superclass : 'FASTFortranConditionalStatement',
	#traits : 'FASTTLoopStatement',
	#classTraits : 'FASTTLoopStatement classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranDoWhileStatement class >> annotation [

	<FMClass: #DoWhileStatement super: #FASTFortranConditionalStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
