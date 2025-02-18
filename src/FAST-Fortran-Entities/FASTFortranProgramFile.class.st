"
Program Units in a program file

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FASTTWithComments` | `container` | `FASTTComment` | list of comments defined in the entity|
| `declarations` | `FASTFortranTWithDeclarations` | `fortranDeclarationOwner` | `FASTFortranTDeclaration` | The elements I declare|
| `programUnits` | `FASTFortranProgramFile` | `programFile` | `FASTFortranProgramUnit` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `filename` | `String` | nil | |

"
Class {
	#name : 'FASTFortranProgramFile',
	#superclass : 'FASTFortranEntity',
	#traits : 'FASTFortranTWithDeclarations + FASTTWithComments',
	#classTraits : 'FASTFortranTWithDeclarations classTrait + FASTTWithComments classTrait',
	#instVars : [
		'#filename => FMProperty',
		'#programUnits => FMMany type: #FASTFortranProgramUnit opposite: #programFile'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranProgramFile class >> annotation [

	<FMClass: #ProgramFile super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTFortranProgramFile >> addProgramUnit: anObject [
	<generated>
	^ self programUnits add: anObject
]

{ #category : 'accessing' }
FASTFortranProgramFile >> filename [

	<FMProperty: #filename type: #String>
	<generated>
	^ filename
]

{ #category : 'accessing' }
FASTFortranProgramFile >> filename: anObject [
	<generated>
	filename := anObject
]

{ #category : 'accessing' }
FASTFortranProgramFile >> programUnits [
	"Relation named: #programUnits type: #FASTFortranProgramUnit opposite: #programFile"

	<generated>
	<derived>
	^ programUnits
]

{ #category : 'accessing' }
FASTFortranProgramFile >> programUnits: anObject [

	<generated>
	programUnits value: anObject
]

{ #category : 'navigation' }
FASTFortranProgramFile >> programUnitsGroup [
	<generated>
	<navigation: 'ProgramUnits'>
	^ MooseSpecializedGroup withAll: self programUnits asSet
]
