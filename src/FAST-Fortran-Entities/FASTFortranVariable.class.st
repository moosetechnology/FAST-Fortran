"
an abstract Fortran Variable, could be an array or a scalar

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `entryStatement` | `FASTFortranTEntryStatement` | `entryArguments` | `FASTFortranEntryStatement` | |
| `parameterOwner` | `FASTTVariableEntity` | `parameters` | `FASTTWithParameters` | parameterOwner|
| `parentFormatedStatement` | `FASTFortranTFormat` | `format` | `FASTFortranTWithFormat` | A format description in a Format/Print/Read/Write statement|
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranTWithIOParameters` | |
| `parentImpliedExpression` | `FASTTVariableEntity` | `variables` | `FASTFortranImpliedDoExpression` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `parentAssignmentExpression` | `FASTTVariableEntity` | `variable` | `FASTTAssignment` | Optional assignment to the variable|
| `parentVariableGroup` | `FASTFortranVariable` | `variables` | `FASTFortranTVariableGroup` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranVariable,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTEntryStatement + FASTFortranTFormat + FASTTVariableEntity',
	#classTraits : 'FASTFortranTEntryStatement classTrait + FASTFortranTFormat classTrait + FASTTVariableEntity classTrait',
	#instVars : [
		'#parentVariableGroup => FMOne type: #FASTFortranTVariableGroup opposite: #variables'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariable class >> annotation [

	<FMClass: #Variable super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranVariable >> parentVariableGroup [
	"Relation named: #parentVariableGroup type: #FASTFortranTVariableGroup opposite: #variables"

	<generated>
	^ parentVariableGroup
]

{ #category : #accessing }
FASTFortranVariable >> parentVariableGroup: anObject [

	<generated>
	parentVariableGroup := anObject
]
