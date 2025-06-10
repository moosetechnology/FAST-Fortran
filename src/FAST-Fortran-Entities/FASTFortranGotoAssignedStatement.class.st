"
I represent Fortran Go To( Assigned) statement

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


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranGotoAssignedStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTTBranchStatement',
	#classTraits : 'FASTTBranchStatement classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranGotoAssignedStatement class >> annotation [

	<FMClass: #GotoAssignedStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
