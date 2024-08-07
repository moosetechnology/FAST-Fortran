"
I represent a statement with variable groups like a DataStatement or an EquivalenceStatement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variableGroups` | `FASTFortranTWithVariableGroups` | `withVariableGroups` | `FASTFortranTVariableGroup` | |



"
Trait {
	#name : 'FASTFortranTWithVariableGroups',
	#instVars : [
		'#variableGroups => FMMany type: #FASTFortranTVariableGroup opposite: #withVariableGroups'
	],
	#category : 'FAST-Fortran-Entities-Traits',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTFortranTWithVariableGroups classSide >> annotation [

	<FMClass: #TWithVariableGroups super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTFortranTWithVariableGroups >> addVariableGroup: anObject [
	<generated>
	^ self variableGroups add: anObject
]

{ #category : 'accessing' }
FASTFortranTWithVariableGroups >> variableGroups [
	"Relation named: #variableGroups type: #FASTFortranTVariableGroup opposite: #withVariableGroups"

	<generated>
	<derived>
	^ variableGroups
]

{ #category : 'accessing' }
FASTFortranTWithVariableGroups >> variableGroups: anObject [

	<generated>
	variableGroups value: anObject
]

{ #category : 'navigation' }
FASTFortranTWithVariableGroups >> variableGroupsGroup [
	<generated>
	<navigation: 'VariableGroups'>
	^ MooseSpecializedGroup withAll: self variableGroups asSet
]
