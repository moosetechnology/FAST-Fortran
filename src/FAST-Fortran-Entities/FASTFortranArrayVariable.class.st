"
An array Fortran Variable, accessed in the code

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `indices` | `FASTFortranArrayVariable` | `parentArrayExpression` | `FASTFortranAbstractExpression` | Indices used in the array access|



"
Class {
	#name : #FASTFortranArrayVariable,
	#superclass : #FASTFortranVariable,
	#instVars : [
		'#indices => FMMany type: #FASTFortranAbstractExpression opposite: #parentArrayExpression'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranArrayVariable class >> annotation [

	<FMClass: #ArrayVariable super: #FASTFortranVariable>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranArrayVariable >> addIndice: anObject [
	<generated>
	^ self indices add: anObject
]

{ #category : #accessing }
FASTFortranArrayVariable >> indices [
	"Relation named: #indices type: #FASTFortranAbstractExpression opposite: #parentArrayExpression"

	<generated>
	<FMComment: 'Indices used in the array access'>
	<derived>
	^ indices
]

{ #category : #accessing }
FASTFortranArrayVariable >> indices: anObject [

	<generated>
	indices value: anObject
]

{ #category : #navigation }
FASTFortranArrayVariable >> indicesGroup [
	<generated>
	<navigation: 'Indices'>
	^ MooseSpecializedGroup withAll: self indices asSet
]
