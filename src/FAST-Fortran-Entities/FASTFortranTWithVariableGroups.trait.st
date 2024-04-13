"
I represent a statement with variable groups like a DataStatement or an EquivalenceStatement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variableGroup` | `FASTFortranTWithVariableGroups` | `parentVariableGroup` | `FASTFortranTVariableGroup` | |



"
Trait {
	#name : #FASTFortranTWithVariableGroups,
	#instVars : [
		'#variableGroup => FMMany type: #FASTFortranTVariableGroup opposite: #parentVariableGroup'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithVariableGroups classSide >> annotation [

	<FMClass: #TWithVariableGroups super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranTWithVariableGroups >> addVariableGroup: anObject [
	<generated>
	^ self variableGroup add: anObject
]

{ #category : #accessing }
FASTFortranTWithVariableGroups >> variableGroup [
	"Relation named: #variableGroup type: #FASTFortranTVariableGroup opposite: #parentVariableGroup"

	<generated>
	<derived>
	^ variableGroup
]

{ #category : #accessing }
FASTFortranTWithVariableGroups >> variableGroup: anObject [

	<generated>
	variableGroup value: anObject
]

{ #category : #navigation }
FASTFortranTWithVariableGroups >> variableGroupGroup [
	<generated>
	<navigation: 'VariableGroup'>
	^ MooseSpecializedGroup withAll: self variableGroup asSet
]
