"
I represent a derived type

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `derivedTypeComponents` | `FASTFortran2kDerivedType` | `derivedType` | `FASTFortran2kDerivedTypeComponent` | |
| `typeBoundProcedures` | `FASTFortran2kDerivedType` | `derivedType` | `FASTFortran2kTypeBoundProcedure` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |
| `superType` | `String` | nil | I represent the name of the super type|

"
Class {
	#name : 'FASTFortran2kDerivedType',
	#superclass : 'FASTFortran2kAbstractStatement',
	#traits : 'FASTTNamedEntity',
	#classTraits : 'FASTTNamedEntity classTrait',
	#instVars : [
		'#superType => FMProperty',
		'#derivedTypeComponents => FMMany type: #FASTFortran2kDerivedTypeComponent opposite: #derivedType',
		'#typeBoundProcedures => FMMany type: #FASTFortran2kTypeBoundProcedure opposite: #derivedType'
	],
	#category : 'FAST-Fortran2k-Entities-Entities',
	#package : 'FAST-Fortran2k-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortran2kDerivedType class >> annotation [

	<FMClass: #DerivedType super: #FASTFortran2kAbstractStatement>
	<package: #'FAST-Fortran2k-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTFortran2kDerivedType >> addDerivedTypeComponent: anObject [
	<generated>
	^ self derivedTypeComponents add: anObject
]

{ #category : 'adding' }
FASTFortran2kDerivedType >> addTypeBoundProcedure: anObject [
	<generated>
	^ self typeBoundProcedures add: anObject
]

{ #category : 'accessing' }
FASTFortran2kDerivedType >> derivedTypeComponents [
	"Relation named: #derivedTypeComponents type: #FASTFortran2kDerivedTypeComponent opposite: #derivedType"

	<generated>
	<derived>
	^ derivedTypeComponents
]

{ #category : 'accessing' }
FASTFortran2kDerivedType >> derivedTypeComponents: anObject [

	<generated>
	derivedTypeComponents value: anObject
]

{ #category : 'navigation' }
FASTFortran2kDerivedType >> derivedTypeComponentsGroup [
	<generated>
	<navigation: 'DerivedTypeComponents'>
	^ MooseSpecializedGroup withAll: self derivedTypeComponents asSet
]

{ #category : 'accessing' }
FASTFortran2kDerivedType >> superType [

	<FMProperty: #superType type: #String>
	<generated>
	<FMComment: 'I represent the name of the super type'>
	^ superType
]

{ #category : 'accessing' }
FASTFortran2kDerivedType >> superType: anObject [
	<generated>
	superType := anObject
]

{ #category : 'accessing' }
FASTFortran2kDerivedType >> typeBoundProcedures [
	"Relation named: #typeBoundProcedures type: #FASTFortran2kTypeBoundProcedure opposite: #derivedType"

	<generated>
	<derived>
	^ typeBoundProcedures
]

{ #category : 'accessing' }
FASTFortran2kDerivedType >> typeBoundProcedures: anObject [

	<generated>
	typeBoundProcedures value: anObject
]

{ #category : 'navigation' }
FASTFortran2kDerivedType >> typeBoundProceduresGroup [
	<generated>
	<navigation: 'TypeBoundProcedures'>
	^ MooseSpecializedGroup withAll: self typeBoundProcedures asSet
]
