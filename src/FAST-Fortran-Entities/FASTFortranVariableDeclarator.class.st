"
Part of a variable declaration: name of the variable + optional initial value

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `parentDeclaration` | `FASTFortranVariableDeclarator` | `declarators` | `FASTFortranTWithDeclarators` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `dimensions` | `FASTFortranVariableDeclarator` | `parentVariableDeclarator` | `FASTFortranArrayRange` | Possible dimensions in case this is an array declaration|
| `expression` | `FASTFortranVariableDeclarator` | `variableDeclaratorOwner` | `FASTFortranAbstractExpression` | Expression assigned to the variable declared|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranVariableDeclarator,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTTNamedEntity',
	#classTraits : 'FASTTNamedEntity classTrait',
	#instVars : [
		'#parentDeclaration => FMOne type: #FASTFortranTWithDeclarators opposite: #declarators',
		'#dimensions => FMMany type: #FASTFortranArrayRange opposite: #parentVariableDeclarator',
		'#expression => FMOne type: #FASTFortranAbstractExpression opposite: #variableDeclaratorOwner'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariableDeclarator class >> annotation [

	<FMClass: #VariableDeclarator super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranVariableDeclarator >> addDimension: anObject [
	<generated>
	^ self dimensions add: anObject
]

{ #category : #accessing }
FASTFortranVariableDeclarator >> dimensions [
	"Relation named: #dimensions type: #FASTFortranArrayRange opposite: #parentVariableDeclarator"

	<generated>
	<FMComment: 'Possible dimensions in case this is an array declaration'>
	<derived>
	^ dimensions
]

{ #category : #accessing }
FASTFortranVariableDeclarator >> dimensions: anObject [

	<generated>
	dimensions value: anObject
]

{ #category : #navigation }
FASTFortranVariableDeclarator >> dimensionsGroup [
	<generated>
	<navigation: 'Dimensions'>
	^ MooseSpecializedGroup withAll: self dimensions asSet
]

{ #category : #accessing }
FASTFortranVariableDeclarator >> expression [
	"Relation named: #expression type: #FASTFortranAbstractExpression opposite: #variableDeclaratorOwner"

	<generated>
	<FMComment: 'Expression assigned to the variable declared'>
	^ expression
]

{ #category : #accessing }
FASTFortranVariableDeclarator >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranVariableDeclarator >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : #accessing }
FASTFortranVariableDeclarator >> parentDeclaration [
	"Relation named: #parentDeclaration type: #FASTFortranTWithDeclarators opposite: #declarators"

	<generated>
	<container>
	^ parentDeclaration
]

{ #category : #accessing }
FASTFortranVariableDeclarator >> parentDeclaration: anObject [

	<generated>
	parentDeclaration := anObject
]

{ #category : #navigation }
FASTFortranVariableDeclarator >> parentDeclarationGroup [
	<generated>
	<navigation: 'ParentDeclaration'>
	^ MooseSpecializedGroup with: self parentDeclaration
]
