"
I represent a fortran statement with a condition: if-block, if-logical

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `condition` | `FASTFortranConditionalStatement` | `parentConditionalStatement` | `FASTFortranAbstractExpression` | Condition|



"
Class {
	#name : 'FASTFortranConditionalStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#instVars : [
		'#condition => FMOne type: #FASTFortranAbstractExpression opposite: #parentConditionalStatement'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranConditionalStatement class >> annotation [

	<FMClass: #ConditionalStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranConditionalStatement >> condition [
	"Relation named: #condition type: #FASTFortranAbstractExpression opposite: #parentConditionalStatement"

	<generated>
	<FMComment: 'Condition'>
	^ condition
]

{ #category : 'accessing' }
FASTFortranConditionalStatement >> condition: anObject [

	<generated>
	condition := anObject
]

{ #category : 'navigation' }
FASTFortranConditionalStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]
