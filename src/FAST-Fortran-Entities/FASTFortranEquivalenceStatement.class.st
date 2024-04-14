"
I represent a Fortran Equivalence statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variableGroups` | `FASTFortranEquivalenceStatement` | `parentVariableGroup` | `FASTFortranTVariableGroup` | |



"
Class {
	#name : #FASTFortranEquivalenceStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#variableGroups => FMMany type: #FASTFortranTVariableGroup opposite: #parentVariableGroup'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranEquivalenceStatement class >> annotation [

	<FMClass: #EquivalenceStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranEquivalenceStatement >> addVariableGroup: anObject [
	<generated>
	^ self variableGroups add: anObject
]

{ #category : #accessing }
FASTFortranEquivalenceStatement >> variableGroups [
	"Relation named: #variableGroups type: #FASTFortranTVariableGroup opposite: #parentVariableGroup"

	<generated>
	<derived>
	^ variableGroups
]

{ #category : #accessing }
FASTFortranEquivalenceStatement >> variableGroups: anObject [

	<generated>
	variableGroups value: anObject
]

{ #category : #navigation }
FASTFortranEquivalenceStatement >> variableGroupsGroup [
	<generated>
	<navigation: 'VariableGroups'>
	^ MooseSpecializedGroup withAll: self variableGroups asSet
]
