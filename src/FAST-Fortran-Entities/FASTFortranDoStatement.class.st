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
| `loopControl` | `FASTFortranTWithLoopControl` | `parentLoop` | `FASTFortranLoopControlExpression` | loop control|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `doLabel` | `String` | nil | A label to come back to, at the end of the DO loop|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranDoStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTFortranTWithLoopControl + FASTTLoopStatement',
	#classTraits : 'FASTFortranTWithLoopControl classTrait + FASTTLoopStatement classTrait',
	#instVars : [
		'#doLabel => FMProperty'
	],
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

{ #category : 'accessing' }
FASTFortranDoStatement >> doLabel [

	<FMProperty: #doLabel type: #String>
	<generated>
	<FMComment: 'A label to come back to, at the end of the DO loop'>
	^ doLabel
]

{ #category : 'accessing' }
FASTFortranDoStatement >> doLabel: anObject [
	<generated>
	doLabel := anObject
]
