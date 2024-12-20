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
| `variables` | `FASTFortranImpliedDoExpression` | `parentImpliedExpression` | `FASTTVariableEntity` | |
| `variables` | `FASTFortranTVariableGroup` | `parentVariableGroup` | `FASTFortranVariable` | |



"
Class {
	#name : 'FASTFortranImpliedDoExpression',
	#superclass : 'FASTFortranAbstractExpression',
	#traits : 'FASTFortranTVariableGroup + FASTFortranTWithLoopControl',
	#classTraits : 'FASTFortranTVariableGroup classTrait + FASTFortranTWithLoopControl classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranImpliedDoExpression class >> annotation [

	<FMClass: #ImpliedDoExpression super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTFortranImpliedDoExpression >> addVariable: anObject [
	<generated>
	^ self variables add: anObject
]

{ #category : 'accessing' }
FASTFortranImpliedDoExpression >> variables [
	"Relation named: #variables type: #FASTTVariableEntity opposite: #parentImpliedExpression"

	<generated>
	<derived>
	<FMProperty: #variables type: #FASTTVariableEntity opposite: #parentImpliedExpression>
	^ self attributeAt: #variables ifAbsentPut: [ FMMultivalueLink on: self opposite: #parentImpliedExpression: ]
]

{ #category : 'accessing' }
FASTFortranImpliedDoExpression >> variables: anObject [

	<generated>
	self variables value: anObject
]

{ #category : 'navigation' }
FASTFortranImpliedDoExpression >> variablesGroup [
	<generated>
	<navigation: 'Variables'>
	^ MooseSpecializedGroup withAll: self variables asSet
]
