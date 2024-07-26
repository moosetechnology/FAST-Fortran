"
I represent a Fortran Data group in a Data statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `withVariableGroups` | `FASTFortranTVariableGroup` | `variableGroups` | `FASTFortranTWithVariableGroups` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `dataConstants` | `FASTFortranDataGroup` | `parentDataStatement` | `FASTFortranAbstractExpression` | |
| `variables` | `FASTFortranTVariableGroup` | `parentVariableGroup` | `FASTFortranVariable` | |



"
Class {
	#name : 'FASTFortranDataGroup',
	#superclass : 'FASTFortranEntity',
	#traits : 'FASTFortranTVariableGroup',
	#classTraits : 'FASTFortranTVariableGroup classTrait',
	#instVars : [
		'#dataConstants => FMMany type: #FASTFortranAbstractExpression opposite: #parentDataStatement'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranDataGroup class >> annotation [

	<FMClass: #DataGroup super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTFortranDataGroup >> addDataConstant: anObject [
	<generated>
	^ self dataConstants add: anObject
]

{ #category : 'accessing' }
FASTFortranDataGroup >> dataConstants [
	"Relation named: #dataConstants type: #FASTFortranAbstractExpression opposite: #parentDataStatement"

	<generated>
	<derived>
	^ dataConstants
]

{ #category : 'accessing' }
FASTFortranDataGroup >> dataConstants: anObject [

	<generated>
	dataConstants value: anObject
]

{ #category : 'navigation' }
FASTFortranDataGroup >> dataConstantsGroup [
	<generated>
	<navigation: 'DataConstants'>
	^ MooseSpecializedGroup withAll: self dataConstants asSet
]
