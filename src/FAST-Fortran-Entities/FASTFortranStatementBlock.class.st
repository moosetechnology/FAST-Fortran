"
Contains the block of Fortran statements

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTBehaviouralEntity` | Behavioural entity containing the statement block.|
| `parentDoStatement` | `FASTFortranStatementBlock` | `statementBlock` | `FASTFortranDoStatement` | Parent do statement|
| `parentIfBlock` | `FASTFortranStatementBlock` | `elseStatementBlock` | `FASTFortranIfBlockStatement` | Parent if block|
| `parentIfBlock` | `FASTFortranStatementBlock` | `thenStatementBlock` | `FASTFortranIfBlockStatement` | Parent if block|
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
		'#parentDoStatement => FMOne type: #FASTFortranDoStatement opposite: #statementBlock',
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
FASTFortranStatementBlock >> parentDoStatement [
	"Relation named: #parentDoStatement type: #FASTFortranDoStatement opposite: #statementBlock"

	<generated>
	<FMComment: 'Parent do statement'>
	<container>
	<derived>
	^ parentDoStatement
]

{ #category : 'accessing' }
FASTFortranStatementBlock >> parentDoStatement: anObject [

	<generated>
	parentDoStatement := anObject
]

{ #category : 'navigation' }
FASTFortranStatementBlock >> parentDoStatementGroup [
	<generated>
	<navigation: 'ParentDoStatement'>
	^ MooseSpecializedGroup with: self parentDoStatement
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
