"
I represent an entity with several variables like in a DataStatement or an EquivalenceStatement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentVariableGroup` | `FASTFortranTVariableGroup` | `variableGroup` | `FASTFortranTWithVariableGroups` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variables` | `FASTFortranTVariableGroup` | `parentVariableGroup` | `FASTFortranVariable` | |



"
Trait {
	#name : #FASTFortranTVariableGroup,
	#instVars : [
		'#parentVariableGroup => FMOne type: #FASTFortranTWithVariableGroups opposite: #variableGroup',
		'#variables => FMMany type: #FASTFortranVariable opposite: #parentVariableGroup'
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
FASTFortranTVariableGroup >> parentVariableGroup [
	"Relation named: #parentVariableGroup type: #FASTFortranTWithVariableGroups opposite: #variableGroup"

	<generated>
	<container>
	^ parentVariableGroup
]

{ #category : #accessing }
FASTFortranTVariableGroup >> parentVariableGroup: anObject [

	<generated>
	parentVariableGroup := anObject
]

{ #category : #navigation }
FASTFortranTVariableGroup >> parentVariableGroupGroup [
	<generated>
	<navigation: 'ParentVariableGroup'>
	^ MooseSpecializedGroup with: self parentVariableGroup
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
