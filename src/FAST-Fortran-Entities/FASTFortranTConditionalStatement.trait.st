"
I represent a fortran statement with a condition: if-block, if-logical

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `condition` | `FASTFortranTConditionalStatement` | `parentConditionalStatement` | `FASTFortranAbstractExpression` | Condition|



"
Trait {
	#name : #FASTFortranTConditionalStatement,
	#instVars : [
		'#condition => FMOne type: #FASTFortranAbstractExpression opposite: #parentConditionalStatement'
	],
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
	"Relation named: #condition type: #FASTFortranAbstractExpression opposite: #parentConditionalStatement"

	<generated>
	<FMComment: 'Condition'>
	^ condition
]

{ #category : #accessing }
FASTFortranTConditionalStatement >> condition: anObject [

	<generated>
	condition := anObject
]

{ #category : #navigation }
FASTFortranTConditionalStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]
