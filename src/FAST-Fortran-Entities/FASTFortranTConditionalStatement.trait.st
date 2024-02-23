"
I represent a fortran statement with a condition: if-block, if-logical

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `condition` | `FASTFortranTConditionalStatement` | `parentConditionalStatement` | `FASTTExpression` | Condition|



"
Trait {
	#name : #FASTFortranTConditionalStatement,
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTConditionalStatement classSide >> annotation [

	<FMClass: #TConditionalStatement super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTConditionalStatement >> condition [
	"Relation named: #condition type: #FASTTExpression opposite: #parentConditionalStatement"

	<generated>
	<FMComment: 'Condition'>
	<FMProperty: #condition type: #FASTTExpression opposite: #parentConditionalStatement>
	^ self attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTFortranTConditionalStatement >> condition: anObject [

	<generated>
	(self attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self attributeAt: #condition put: anObject.
		otherSide parentConditionalStatement: nil ]
	ifNotNil: [ 
		self attributeAt: #condition put: anObject.
		anObject parentConditionalStatement: self ]
]

{ #category : #navigation }
FASTFortranTConditionalStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]
