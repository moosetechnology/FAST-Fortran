"
I represent a Fortran Data group in a Data statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `withVariableGroups` | `FASTFortranTVariableGroup` | `variableGroups` | `FASTFortranTWithVariableGroups` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `dataConstants` | `FASTFortranDataGroup` | `parentDataStatement` | `FASTTExpression` | |
| `variables` | `FASTFortranTVariableGroup` | `parentVariableGroup` | `FASTFortranVariable` | |



"
Class {
	#name : #FASTFortranDataGroup,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTVariableGroup',
	#classTraits : 'FASTFortranTVariableGroup classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDataGroup class >> annotation [

	<FMClass: #DataGroup super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranDataGroup >> addDataConstant: anObject [
	<generated>
	^ self dataConstants add: anObject
]

{ #category : #accessing }
FASTFortranDataGroup >> dataConstants [
	"Relation named: #dataConstants type: #FASTTExpression opposite: #parentDataStatement"

	<generated>
	<derived>
	<FMProperty: #dataConstants type: #FASTTExpression opposite: #parentDataStatement>
	^ self attributeAt: #dataConstants ifAbsentPut: [ FMMultivalueLink on: self opposite: #parentDataStatement: ]
]

{ #category : #accessing }
FASTFortranDataGroup >> dataConstants: anObject [

	<generated>
	self dataConstants value: anObject
]
