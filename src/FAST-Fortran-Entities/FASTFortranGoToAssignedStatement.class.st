"
I represent Fortran Go To( Assigned) statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `labelReferences` | `FASTFortranTWithLabelReferences` | `referencer` | `FASTFortranLabelReference` | the label(s) referenced|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `selectorExpression` | `FASTFortranGoToAssignedStatement` | `parentGotoAssignedStatement` | `FASTTExpression` | The expression which value selects the label to go to|



"
Class {
	#name : #FASTFortranGoToAssignedStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithLabelReferences',
	#classTraits : 'FASTFortranTWithLabelReferences classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranGoToAssignedStatement class >> annotation [

	<FMClass: #GoToAssignedStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranGoToAssignedStatement >> selectorExpression [
	"Relation named: #selectorExpression type: #FASTTExpression opposite: #parentGotoAssignedStatement"

	<generated>
	<FMComment: 'The expression which value selects the label to go to'>
	<FMProperty: #selectorExpression type: #FASTTExpression opposite: #parentGotoAssignedStatement>
	^ self attributeAt: #selectorExpression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTFortranGoToAssignedStatement >> selectorExpression: anObject [

	<generated>
	(self attributeAt: #selectorExpression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self selectorExpression.
		self attributeAt: #selectorExpression put: anObject.
		otherSide parentGotoAssignedStatement: nil ]
	ifNotNil: [ 
		self attributeAt: #selectorExpression put: anObject.
		anObject parentGotoAssignedStatement: self ]
]
