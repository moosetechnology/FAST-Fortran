"
I represent Fortran Do statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBranchStatement` | `FASTTStatement` | `branches` | `FASTTBranchStatement` | My parent BranchStatement (of which I am a branch)|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `branches` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTStatement` | The various children branches of this BranchStatement|
| `expression` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTExpression` | The expression commanding which branch is executed|
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
