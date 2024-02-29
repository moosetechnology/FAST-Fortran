"
I represent a Fortran ""implied do"" expression

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `withVariableGroups` | `FASTFortranTVariableGroup` | `variableGroups` | `FASTFortranTWithVariableGroups` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `loopControl` | `FASTFortranTWithLoopControl` | `parentLoop` | `FASTFortranLoopControlExpression` | loop control|
| `variables` | `FASTFortranTVariableGroup` | `parentVariableGroup` | `FASTFortranVariable` | |
| `variables` | `FASTFortranImpliedDoExpression` | `parentImpliedExpression` | `FASTFortranTVariableEntity` | |



"
Class {
	#name : #FASTFortranImpliedDoExpression,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTVariableGroup + FASTFortranTWithLoopControl',
	#classTraits : 'FASTFortranTVariableGroup classTrait + FASTFortranTWithLoopControl classTrait',
	#instVars : [
		'#variables => FMMany type: #FASTFortranTVariableEntity opposite: #parentImpliedExpression'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranImpliedDoExpression class >> annotation [

	<FMClass: #ImpliedDoExpression super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranImpliedDoExpression >> addVariable: anObject [
	<generated>
	^ self variables add: anObject
]

{ #category : #accessing }
FASTFortranImpliedDoExpression >> variables [
	"Relation named: #variables type: #FASTFortranTVariableEntity opposite: #parentImpliedExpression"

	<generated>
	<derived>
	^ variables
]

{ #category : #accessing }
FASTFortranImpliedDoExpression >> variables: anObject [

	<generated>
	variables value: anObject
]

{ #category : #navigation }
FASTFortranImpliedDoExpression >> variablesGroup [
	<generated>
	<navigation: 'Variables'>
	^ MooseSpecializedGroup withAll: self variables asSet
]
