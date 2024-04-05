"
An entity that can contain fortran program units and comments

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FASTTWithComments` | `container` | `FASTTComment` | list of comments defined in the entity|
| `programUnit` | `FASTFortranProgramFile` | `parentProgramFile` | `FASTFortranProgramUnit` | Program Units in a program file|



"
Class {
	#name : #FASTFortranProgramFile,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTTWithComments',
	#classTraits : 'FASTTWithComments classTrait',
	#instVars : [
		'#programUnit => FMMany type: #FASTFortranProgramUnit opposite: #parentProgramFile'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranProgramFile class >> annotation [

	<FMClass: #ProgramFile super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranProgramFile >> addProgramUnit: anObject [
	<generated>
	^ self programUnit add: anObject
]

{ #category : #accessing }
FASTFortranProgramFile >> programUnit [
	"Relation named: #programUnit type: #FASTFortranProgramUnit opposite: #parentProgramFile"

	<generated>
	<FMComment: 'Program Units in a program file'>
	<derived>
	^ programUnit
]

{ #category : #accessing }
FASTFortranProgramFile >> programUnit: anObject [

	<generated>
	programUnit value: anObject
]

{ #category : #navigation }
FASTFortranProgramFile >> programUnitGroup [
	<generated>
	<navigation: 'ProgramUnit'>
	^ MooseSpecializedGroup withAll: self programUnit asSet
]
