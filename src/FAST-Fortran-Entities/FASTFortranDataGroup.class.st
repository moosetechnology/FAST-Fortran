"
I represent a Fortran Data group (nlist, clist) in a Data statement
DATA nlist / clist / [[,] nlist / clist /] ...

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentDataStatement` | `FASTFortranDataGroup` | `groups` | `FASTFortranDataStatement` | |
| `parentVariableGroup` | `FASTFortranTVariableGroup` | `variableGroups` | `FASTFortranEquivalenceStatement` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `constants` | `FASTFortranDataGroup` | `parentDataGroup` | `FASTFortranAbstractExpression` | |
| `variables` | `FASTFortranTVariableGroup` | `parentVariableGroup` | `FASTFortranVariable` | |



"
Class {
	#name : #FASTFortranDataGroup,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTVariableGroup',
	#classTraits : 'FASTFortranTVariableGroup classTrait',
	#instVars : [
		'#constants => FMMany type: #FASTFortranAbstractExpression opposite: #parentDataGroup',
		'#parentDataStatement => FMOne type: #FASTFortranDataStatement opposite: #groups'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDataGroup class >> annotation [

	<FMClass: #DataGroup super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranDataGroup >> addConstant: anObject [
	<generated>
	^ self constants add: anObject
]

{ #category : #accessing }
FASTFortranDataGroup >> constants [
	"Relation named: #constants type: #FASTFortranAbstractExpression opposite: #parentDataGroup"

	<generated>
	<derived>
	^ constants
]

{ #category : #accessing }
FASTFortranDataGroup >> constants: anObject [

	<generated>
	constants value: anObject
]

{ #category : #navigation }
FASTFortranDataGroup >> constantsGroup [
	<generated>
	<navigation: 'Constants'>
	^ MooseSpecializedGroup withAll: self constants asSet
]

{ #category : #accessing }
FASTFortranDataGroup >> parentDataStatement [
	"Relation named: #parentDataStatement type: #FASTFortranDataStatement opposite: #groups"

	<generated>
	<container>
	^ parentDataStatement
]

{ #category : #accessing }
FASTFortranDataGroup >> parentDataStatement: anObject [

	<generated>
	parentDataStatement := anObject
]

{ #category : #navigation }
FASTFortranDataGroup >> parentDataStatementGroup [
	<generated>
	<navigation: 'ParentDataStatement'>
	^ MooseSpecializedGroup with: self parentDataStatement
]
