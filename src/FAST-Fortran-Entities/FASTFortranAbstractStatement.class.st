"
I am the super class of all Fortran statements

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentIfStatement` | `FASTFortranAbstractStatement` | `statement` | `FASTFortranIfLogicalStatement` | Parent if statement|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `label` | `String` | nil | Determines the statement label which consists of 1 to 5 digits, with at least one nonzero|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranAbstractStatement',
	#superclass : 'FASTFortranEntity',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#label => FMProperty',
		'#parentIfStatement => FMOne type: #FASTFortranIfLogicalStatement opposite: #statement'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranAbstractStatement class >> annotation [

	<FMClass: #AbstractStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranAbstractStatement >> label [

	<FMProperty: #label type: #String>
	<generated>
	<FMComment: 'Determines the statement label which consists of 1 to 5 digits, with at least one nonzero'>
	^ label
]

{ #category : 'accessing' }
FASTFortranAbstractStatement >> label: anObject [
	<generated>
	label := anObject
]

{ #category : 'accessing' }
FASTFortranAbstractStatement >> parentIfStatement [
	"Relation named: #parentIfStatement type: #FASTFortranIfLogicalStatement opposite: #statement"

	<generated>
	<FMComment: 'Parent if statement'>
	<container>
	<derived>
	^ parentIfStatement
]

{ #category : 'accessing' }
FASTFortranAbstractStatement >> parentIfStatement: anObject [

	<generated>
	parentIfStatement := anObject
]

{ #category : 'navigation' }
FASTFortranAbstractStatement >> parentIfStatementGroup [
	<generated>
	<navigation: 'ParentIfStatement'>
	^ MooseSpecializedGroup with: self parentIfStatement
]
