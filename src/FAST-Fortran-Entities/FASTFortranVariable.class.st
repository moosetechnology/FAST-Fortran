"
an abstract Fortran Variable, could be an array or a scalar

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `entryStatement` | `FASTFortranTEntryArgument` | `entryArguments` | `FASTFortranEntryStatement` | |
| `fieldIn` | `FASTFortranVariable` | `field` | `FASTFortranFieldAccess` | Parent FieldAccess in which receiver is a field|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `parameterOwner` | `FASTTVariableEntity` | `parameters` | `FASTTWithParameters` | parameterOwner|
| `parentAssignmentExpression` | `FASTTVariableEntity` | `variable` | `FASTTAssignment` | Optional assignment to the variable|
| `parentFormatedStatement` | `FASTFortranTFormat` | `format` | `FASTFortranTWithFormat` | A format description in a Format/Print/Read/Write statement|
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranAbstractIOStatement` | |
| `parentImpliedExpression` | `FASTTVariableEntity` | `variables` | `FASTFortranImpliedDoExpression` | |
| `parentVariableGroup` | `FASTFortranVariable` | `variables` | `FASTFortranTVariableGroup` | |
| `pointerIn` | `FASTFortranVariable` | `pointer` | `FASTFortranFieldAccess` | Parent FieldAccess in which receiver is a pointer|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranVariable',
	#superclass : 'FASTFortranAbstractExpression',
	#traits : 'FASTFortranTEntryArgument + FASTFortranTFormat + FASTTVariableEntity',
	#classTraits : 'FASTFortranTEntryArgument classTrait + FASTFortranTFormat classTrait + FASTTVariableEntity classTrait',
	#instVars : [
		'#fieldIn => FMOne type: #FASTFortranFieldAccess opposite: #field',
		'#parentVariableGroup => FMOne type: #FASTFortranTVariableGroup opposite: #variables',
		'#pointerIn => FMOne type: #FASTFortranFieldAccess opposite: #pointer'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranVariable class >> annotation [

	<FMClass: #Variable super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranVariable >> fieldIn [
	"Relation named: #fieldIn type: #FASTFortranFieldAccess opposite: #field"

	<generated>
	<FMComment: 'Parent FieldAccess in which receiver is a field'>
	<container>
	<derived>
	^ fieldIn
]

{ #category : 'accessing' }
FASTFortranVariable >> fieldIn: anObject [

	<generated>
	fieldIn := anObject
]

{ #category : 'navigation' }
FASTFortranVariable >> fieldInGroup [
	<generated>
	<navigation: 'FieldIn'>
	^ MooseSpecializedGroup with: self fieldIn
]

{ #category : 'accessing' }
FASTFortranVariable >> parentVariableGroup [
	"Relation named: #parentVariableGroup type: #FASTFortranTVariableGroup opposite: #variables"

	<generated>
	<container>
	^ parentVariableGroup
]

{ #category : 'accessing' }
FASTFortranVariable >> parentVariableGroup: anObject [

	<generated>
	parentVariableGroup := anObject
]

{ #category : 'navigation' }
FASTFortranVariable >> parentVariableGroupGroup [
	<generated>
	<navigation: 'ParentVariableGroup'>
	^ MooseSpecializedGroup with: self parentVariableGroup
]

{ #category : 'accessing' }
FASTFortranVariable >> pointerIn [
	"Relation named: #pointerIn type: #FASTFortranFieldAccess opposite: #pointer"

	<generated>
	<FMComment: 'Parent FieldAccess in which receiver is a pointer'>
	<container>
	<derived>
	^ pointerIn
]

{ #category : 'accessing' }
FASTFortranVariable >> pointerIn: anObject [

	<generated>
	pointerIn := anObject
]

{ #category : 'navigation' }
FASTFortranVariable >> pointerInGroup [
	<generated>
	<navigation: 'PointerIn'>
	^ MooseSpecializedGroup with: self pointerIn
]
