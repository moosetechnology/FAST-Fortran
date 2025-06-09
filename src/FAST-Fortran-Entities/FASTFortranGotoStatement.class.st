"
I represent Fortran Go To (unconditional) statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBranchStatement` | `FASTTStatement` | `branches` | `FASTTBranchStatement` | My parent BranchStatement (of which I am a branch)|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `gotoLabel` | `String` | nil | The goto destination label. Note: property ""label"" already used by tLabeledStatement|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranGotoStatement',
	#superclass : 'FASTFortranEntity',
	#traits : 'FASTTGotoStatement',
	#classTraits : 'FASTTGotoStatement classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranGotoStatement class >> annotation [

	<FMClass: #GotoStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
