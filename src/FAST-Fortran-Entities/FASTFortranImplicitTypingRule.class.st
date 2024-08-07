"
I represent a rule (ie. Type+letter range) in an Implicit statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentImplicitStatement` | `FASTFortranImplicitTypingRule` | `typingRules` | `FASTFortranImplicitStatement` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `ranges` | `FASTFortranImplicitTypingRule` | `parentImplicitRule` | `FASTFortranImplicitRange` | |
| `type` | `FASTFortranImplicitTypingRule` | `parentImplicitRule` | `FASTFortranType` | |



"
Class {
	#name : 'FASTFortranImplicitTypingRule',
	#superclass : 'FASTFortranEntity',
	#instVars : [
		'#parentImplicitStatement => FMOne type: #FASTFortranImplicitStatement opposite: #typingRules',
		'#type => FMOne type: #FASTFortranType opposite: #parentImplicitRule',
		'#ranges => FMMany type: #FASTFortranImplicitRange opposite: #parentImplicitRule'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranImplicitTypingRule class >> annotation [

	<FMClass: #ImplicitTypingRule super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTFortranImplicitTypingRule >> addRange: anObject [
	<generated>
	^ self ranges add: anObject
]

{ #category : 'accessing' }
FASTFortranImplicitTypingRule >> parentImplicitStatement [
	"Relation named: #parentImplicitStatement type: #FASTFortranImplicitStatement opposite: #typingRules"

	<generated>
	<container>
	^ parentImplicitStatement
]

{ #category : 'accessing' }
FASTFortranImplicitTypingRule >> parentImplicitStatement: anObject [

	<generated>
	parentImplicitStatement := anObject
]

{ #category : 'navigation' }
FASTFortranImplicitTypingRule >> parentImplicitStatementGroup [
	<generated>
	<navigation: 'ParentImplicitStatement'>
	^ MooseSpecializedGroup with: self parentImplicitStatement
]

{ #category : 'accessing' }
FASTFortranImplicitTypingRule >> ranges [
	"Relation named: #ranges type: #FASTFortranImplicitRange opposite: #parentImplicitRule"

	<generated>
	<derived>
	^ ranges
]

{ #category : 'accessing' }
FASTFortranImplicitTypingRule >> ranges: anObject [

	<generated>
	ranges value: anObject
]

{ #category : 'navigation' }
FASTFortranImplicitTypingRule >> rangesGroup [
	<generated>
	<navigation: 'Ranges'>
	^ MooseSpecializedGroup withAll: self ranges asSet
]

{ #category : 'accessing' }
FASTFortranImplicitTypingRule >> type [
	"Relation named: #type type: #FASTFortranType opposite: #parentImplicitRule"

	<generated>
	^ type
]

{ #category : 'accessing' }
FASTFortranImplicitTypingRule >> type: anObject [

	<generated>
	type := anObject
]

{ #category : 'navigation' }
FASTFortranImplicitTypingRule >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
