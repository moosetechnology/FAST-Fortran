"
The DATA statement initializes variables, substrings, arrays
DATA nlist / clist / [[,] nlist / clist /] ...

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `groups` | `FASTFortranDataStatement` | `parentDataStatement` | `FASTFortranDataGroup` | |



"
Class {
	#name : #FASTFortranDataStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#groups => FMMany type: #FASTFortranDataGroup opposite: #parentDataStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDataStatement class >> annotation [

	<FMClass: #DataStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranDataStatement >> addGroup: anObject [
	<generated>
	^ self groups add: anObject
]

{ #category : #accessing }
FASTFortranDataStatement >> groups [
	"Relation named: #groups type: #FASTFortranDataGroup opposite: #parentDataStatement"

	<generated>
	<derived>
	^ groups
]

{ #category : #accessing }
FASTFortranDataStatement >> groups: anObject [

	<generated>
	groups value: anObject
]

{ #category : #navigation }
FASTFortranDataStatement >> groupsGroup [
	<generated>
	<navigation: 'Groups'>
	^ MooseSpecializedGroup withAll: self groups asSet
]
