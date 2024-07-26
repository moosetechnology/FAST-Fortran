"
A fortran program unit is a sequence of statements, terminated by an END statement. Every program unit is either a main program or a subprogram. If a program is to be executable, it must have a main program

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `parentProgramFile` | `FASTFortranProgramUnit` | `programUnit` | `FASTFortranProgramFile` | Parent program file|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FASTTWithComments` | `container` | `FASTTComment` | list of comments defined in the entity|
| `parameters` | `FASTTWithParameters` | `parameterOwner` | `FASTTVariableEntity` | My parameters|
| `statementBlock` | `FASTTBehaviouralEntity` | `fastBehaviouralParent` | `FASTTStatementBlock` | Statements block of the behavioural entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranProgramUnit',
	#superclass : 'FASTFortranEntity',
	#traits : 'FASTTBehaviouralEntity + FASTTEntity + FASTTNamedEntity + FASTTWithComments',
	#classTraits : 'FASTTBehaviouralEntity classTrait + FASTTEntity classTrait + FASTTNamedEntity classTrait + FASTTWithComments classTrait',
	#instVars : [
		'#parentProgramFile => FMOne type: #FASTFortranProgramFile opposite: #programUnit'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranProgramUnit class >> annotation [

	<FMClass: #ProgramUnit super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranProgramUnit >> parentProgramFile [
	"Relation named: #parentProgramFile type: #FASTFortranProgramFile opposite: #programUnit"

	<generated>
	<FMComment: 'Parent program file'>
	<container>
	^ parentProgramFile
]

{ #category : 'accessing' }
FASTFortranProgramUnit >> parentProgramFile: anObject [

	<generated>
	parentProgramFile := anObject
]

{ #category : 'navigation' }
FASTFortranProgramUnit >> parentProgramFileGroup [
	<generated>
	<navigation: 'ParentProgramFile'>
	^ MooseSpecializedGroup with: self parentProgramFile
]
