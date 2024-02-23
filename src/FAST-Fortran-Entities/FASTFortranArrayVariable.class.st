"
An array Fortran Variable, accessed in the code

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `indices` | `FASTFortranArrayVariable` | `parentArrayExpression` | `FASTTExpression` | Indices used in the array access|



"
Class {
	#name : #FASTFortranArrayVariable,
	#superclass : #FASTFortranVariable,
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
	"Relation named: #indices type: #FASTTExpression opposite: #parentArrayExpression"

	<generated>
	<FMComment: 'Indices used in the array access'>
	<derived>
	<FMProperty: #indices type: #FASTTExpression opposite: #parentArrayExpression>
	^ self attributeAt: #indices ifAbsentPut: [ FMMultivalueLink on: self opposite: #parentArrayExpression: ]
]

{ #category : #accessing }
FASTFortranArrayVariable >> indices: anObject [

	<generated>
	self indices value: anObject
]
