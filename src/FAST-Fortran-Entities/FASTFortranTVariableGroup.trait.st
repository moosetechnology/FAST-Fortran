"
I represent an entity with several variables like in a DataStatement or an EquivalenceStatement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `withVariableGroups` | `FASTFortranTVariableGroup` | `variableGroups` | `FASTFortranTWithVariableGroups` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variables` | `FASTFortranTVariableGroup` | `parentVariableGroup` | `FASTFortranVariable` | |



"
Trait {
	#name : #FASTFortranTVariableGroup,
	#instVars : [
		'#variables => FMMany type: #FASTFortranVariable opposite: #parentVariableGroup',
		'#withVariableGroups => FMOne type: #FASTFortranTWithVariableGroups opposite: #variableGroups'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTVariableGroup classSide >> annotation [

	<FMClass: #TVariableGroup super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranTVariableGroup >> addVariable: anObject [
	<generated>
	^ self variables add: anObject
]

{ #category : #accessing }
FASTFortranTVariableGroup >> variables [
	"Relation named: #variables type: #FASTFortranVariable opposite: #parentVariableGroup"

	<generated>
	<derived>
	^ variables
]

{ #category : #accessing }
FASTFortranTVariableGroup >> variables: anObject [

	<generated>
	variables value: anObject
]

{ #category : #navigation }
FASTFortranTVariableGroup >> variablesGroup [
	<generated>
	<navigation: 'Variables'>
	^ MooseSpecializedGroup withAll: self variables asSet
]

{ #category : #accessing }
FASTFortranTVariableGroup >> withVariableGroups [
	"Relation named: #withVariableGroups type: #FASTFortranTWithVariableGroups opposite: #variableGroups"

	<generated>
	<container>
	^ withVariableGroups
]

{ #category : #accessing }
FASTFortranTVariableGroup >> withVariableGroups: anObject [

	<generated>
	withVariableGroups := anObject
]

{ #category : #navigation }
FASTFortranTVariableGroup >> withVariableGroupsGroup [
	<generated>
	<navigation: 'WithVariableGroups'>
	^ MooseSpecializedGroup with: self withVariableGroups
]
