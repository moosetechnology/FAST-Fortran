"
Contains the block of Fortran statements

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTBehaviouralEntity` | Behavioural entity containing the statement block.|
| `parentIfBlock` | `FASTFortranStatementBlock` | `elseStatementBlock` | `FASTFortranIfBlockStatement` | Parent if block|
| `parentIfBlock` | `FASTFortranStatementBlock` | `thenStatementBlock` | `FASTFortranIfBlockStatement` | Parent if block|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FASTTWithComments` | `container` | `FASTTComment` | list of comments defined in the entity|
| `statements` | `FASTTStatementBlock` | `statementContainer` | `FASTTStatement` | Statements enclosed in this block|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranStatementBlock',
	#superclass : 'FASTFortranEntity',
	#traits : 'FASTTStatementBlock + FASTTWithComments',
	#classTraits : 'FASTTStatementBlock classTrait + FASTTWithComments classTrait',
	#instVars : [
		'#parentIfBlock => FMOne type: #FASTFortranIfBlockStatement opposite: #thenStatementBlock'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranStatementBlock class >> annotation [

	<FMClass: #StatementBlock super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranStatementBlock >> parentIfBlock [
	"Relation named: #parentIfBlock type: #FASTFortranIfBlockStatement opposite: #thenStatementBlock"

	<generated>
	<FMComment: 'Parent if block'>
	<container>
	<derived>
	^ parentIfBlock
]

{ #category : 'accessing' }
FASTFortranStatementBlock >> parentIfBlock: anObject [

	<generated>
	parentIfBlock := anObject
]

{ #category : 'navigation' }
FASTFortranStatementBlock >> parentIfBlockGroup [
	<generated>
	<navigation: 'ParentIfBlock'>
	^ MooseSpecializedGroup with: self parentIfBlock
]
