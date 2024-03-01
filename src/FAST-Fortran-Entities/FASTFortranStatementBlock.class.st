"
Contains the block of Fortran statements

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTFortranTStatementBlock` | `statementBlock` | `FASTFortranTBehaviouralEntity` | Behavioural entity containing the statement block.|
| `parentDoStatement` | `FASTFortranTStatementBlock` | `statementBlock` | `FASTFortranDoStatement` | Parent do statement|
| `parentIfBlock` | `FASTFortranTStatementBlock` | `thenStatementBlock` | `FASTFortranIfBlockStatement` | Parent if block|
| `parentIfBlock` | `FASTFortranTStatementBlock` | `elseStatementBlock` | `FASTFortranIfBlockStatement` | Parent if block|
| `statementContainer` | `FASTFortranTStatement` | `statements` | `FASTFortranTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FASTFortranTWithComments` | `container` | `FASTFortranTComment` | list of comments defined in the entity|
| `statements` | `FASTFortranTStatementBlock` | `statementContainer` | `FASTFortranTStatement` | Statements enclosed in this block|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranStatementBlock,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTStatementBlock + FASTFortranTWithComments',
	#classTraits : 'FASTFortranTStatementBlock classTrait + FASTFortranTWithComments classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranStatementBlock class >> annotation [

	<FMClass: #StatementBlock super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
