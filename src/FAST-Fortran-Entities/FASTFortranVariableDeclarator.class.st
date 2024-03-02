"
Part of a variable declaration: name of the variable + optional initial value

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
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
| `variable` | `String` | nil | The name of the variable being declared|

"
Class {
	#name : #FASTFortranVariableDeclarator,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#variable => FMProperty',
		'#dimensions => FMMany type: #FASTFortranArrayRange opposite: #parentVariableDeclarator',
		'#parentDeclaration => FMOne type: #FASTFortranTWithDeclarators opposite: #declarators',
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

{ #category : #accessing }
FASTFortranVariableDeclarator >> variable [

	<FMProperty: #variable type: #String>
	<generated>
	<FMComment: 'The name of the variable being declared'>
	^ variable
]

{ #category : #accessing }
FASTFortranVariableDeclarator >> variable: anObject [
	<generated>
	variable := anObject
]
