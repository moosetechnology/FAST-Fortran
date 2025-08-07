"
Parent program file

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `programFile` | `FASTFortranProgramUnit` | `programUnits` | `FASTFortranProgramFile` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FASTTWithComments` | `container` | `FASTTComment` | list of comments defined in the entity|
| `declarations` | `FASTFortranTWithDeclarations` | `fortranDeclarationOwner` | `FASTFortranTDeclaration` | The elements I declare|
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
	#traits : 'FASTFortranTWithDeclarations + FASTTBehaviouralEntity + FASTTEntity + FASTTNamedEntity + FASTTWithComments',
	#classTraits : 'FASTFortranTWithDeclarations classTrait + FASTTBehaviouralEntity classTrait + FASTTEntity classTrait + FASTTNamedEntity classTrait + FASTTWithComments classTrait',
	#instVars : [
		'#programFile => FMOne type: #FASTFortranProgramFile opposite: #programUnits'
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

{ #category : 'testing' }
FASTFortranProgramUnit >> isProgramUnit [ 

	^ true
]

{ #category : 'accessing' }
FASTFortranProgramUnit >> programFile [
	"Relation named: #programFile type: #FASTFortranProgramFile opposite: #programUnits"

	<generated>
	<container>
	^ programFile
]

{ #category : 'accessing' }
FASTFortranProgramUnit >> programFile: anObject [

	<generated>
	programFile := anObject
]

{ #category : 'navigation' }
FASTFortranProgramUnit >> programFileGroup [
	<generated>
	<navigation: 'ProgramFile'>
	^ MooseSpecializedGroup with: self programFile
]
