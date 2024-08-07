"
I represent Fortran Common statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `groups` | `FASTFortranCommonStatement` | `parentCommonStatement` | `FASTFortranCommonGroup` | List common groups in this common statement|



"
Class {
	#name : 'FASTFortranCommonStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#instVars : [
		'#groups => FMMany type: #FASTFortranCommonGroup opposite: #parentCommonStatement'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranCommonStatement class >> annotation [

	<FMClass: #CommonStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTFortranCommonStatement >> addGroup: anObject [
	<generated>
	^ self groups add: anObject
]

{ #category : 'accessing' }
FASTFortranCommonStatement >> groups [
	"Relation named: #groups type: #FASTFortranCommonGroup opposite: #parentCommonStatement"

	<generated>
	<FMComment: 'List common groups in this common statement'>
	<derived>
	^ groups
]

{ #category : 'accessing' }
FASTFortranCommonStatement >> groups: anObject [

	<generated>
	groups value: anObject
]

{ #category : 'navigation' }
FASTFortranCommonStatement >> groupsGroup [
	<generated>
	<navigation: 'Groups'>
	^ MooseSpecializedGroup withAll: self groups asSet
]
