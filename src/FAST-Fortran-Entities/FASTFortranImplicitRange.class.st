"
I represent a range of characters in an Implicit statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentImplicitRule` | `FASTFortranImplicitRange` | `ranges` | `FASTFortranImplicitTypingRule` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `from` | `String` | nil | Start of character range for implicit rule|
| `to` | `String` | nil | End of character range for implicit rule|

"
Class {
	#name : 'FASTFortranImplicitRange',
	#superclass : 'FASTFortranEntity',
	#instVars : [
		'#from => FMProperty',
		'#to => FMProperty',
		'#parentImplicitRule => FMOne type: #FASTFortranImplicitTypingRule opposite: #ranges'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranImplicitRange class >> annotation [

	<FMClass: #ImplicitRange super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranImplicitRange >> from [

	<FMProperty: #from type: #String>
	<generated>
	<FMComment: 'Start of character range for implicit rule'>
	^ from
]

{ #category : 'accessing' }
FASTFortranImplicitRange >> from: anObject [
	<generated>
	from := anObject
]

{ #category : 'accessing' }
FASTFortranImplicitRange >> parentImplicitRule [
	"Relation named: #parentImplicitRule type: #FASTFortranImplicitTypingRule opposite: #ranges"

	<generated>
	<container>
	^ parentImplicitRule
]

{ #category : 'accessing' }
FASTFortranImplicitRange >> parentImplicitRule: anObject [

	<generated>
	parentImplicitRule := anObject
]

{ #category : 'navigation' }
FASTFortranImplicitRange >> parentImplicitRuleGroup [
	<generated>
	<navigation: 'ParentImplicitRule'>
	^ MooseSpecializedGroup with: self parentImplicitRule
]

{ #category : 'accessing' }
FASTFortranImplicitRange >> to [

	<FMProperty: #to type: #String>
	<generated>
	<FMComment: 'End of character range for implicit rule'>
	^ to
]

{ #category : 'accessing' }
FASTFortranImplicitRange >> to: anObject [
	<generated>
	to := anObject
]
