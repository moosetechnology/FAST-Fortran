"
Contains the block of Fortran statements

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTBehaviouralEntity` | Behavioural entity containing the statement block.|
| `parentDoStatement` | `FASTTStatementBlock` | `statementBlock` | `FASTFortranDoStatement` | Parent do statement|
| `parentIfBlock` | `FASTTStatementBlock` | `thenStatementBlock` | `FASTFortranIfBlockStatement` | Parent if block|
| `parentIfBlock` | `FASTTStatementBlock` | `elseStatementBlock` | `FASTFortranIfBlockStatement` | Parent if block|
| `parentIfStatement` | `FASTTStatement` | `statement` | `FASTFortranIfLogicalStatement` | Parent if statement|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `statements` | `FASTTStatementBlock` | `statementContainer` | `FASTTStatement` | Statements enclosed in this block|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FASTTWithComments` | `container` | `FASTTComment` | list of comments defined in the entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `label` | `String` | nil | Determines the statement label which consists of 1 to 5 digits, with at least one nonzero|
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranStatementBlock,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTTStatementBlock + FASTTWithComments',
	#classTraits : 'FASTTStatementBlock classTrait + FASTTWithComments classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranStatementBlock class >> annotation [

	<FMClass: #StatementBlock super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
