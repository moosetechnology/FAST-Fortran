"
I represent Fortran Do statement

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
| `labelReferences` | `FASTFortranTWithLabelReferences` | `referencer` | `FASTFortranLabelReference` | the label(s) referenced|
| `loopControl` | `FASTFortranTWithLoopControl` | `parentLoop` | `FASTFortranLoopControlExpression` | loop control|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranDoStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTFortranTWithLabelReferences + FASTFortranTWithLoopControl + FASTTLoopStatement',
	#classTraits : 'FASTFortranTWithLabelReferences classTrait + FASTFortranTWithLoopControl classTrait + FASTTLoopStatement classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranDoStatement class >> annotation [

	<FMClass: #DoStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
