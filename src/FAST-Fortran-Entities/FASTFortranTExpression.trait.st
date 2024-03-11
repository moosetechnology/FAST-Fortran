"
An abstract superclass representing an expression node of a source code.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTFortranTExpression` | `arguments` | `FASTFortranTWithArguments` | my owner|
| `assignedIn` | `FASTFortranTExpression` | `expression` | `FASTFortranTAssignment` | Optional assignment where this expression is used|
| `expressionStatementOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTExpressionStatement` | The expression statement that own me (if it's the case|
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTExpression,
	#instVars : [
		'#expressionStatementOwner => FMOne type: #FASTFortranTExpressionStatement opposite: #expression',
		'#returnOwner => FMOne type: #FASTFortranTReturnStatement opposite: #expression',
		'#argumentOwner => FMOne type: #FASTFortranTWithArguments opposite: #arguments',
		'#assignedIn => FMOne type: #FASTFortranTAssignment opposite: #expression'
	],
	#traits : 'FASTFortranTEntity',
	#classTraits : 'FASTFortranTEntity classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTExpression classSide >> annotation [

	<FMClass: #TExpression super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTExpression >> argumentOwner [
	"Relation named: #argumentOwner type: #FASTFortranTWithArguments opposite: #arguments"

	<generated>
	<FMComment: 'my owner'>
	<container>
	^ argumentOwner
]

{ #category : #accessing }
FASTFortranTExpression >> argumentOwner: anObject [

	<generated>
	argumentOwner := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> argumentOwnerGroup [
	<generated>
	<navigation: 'ArgumentOwner'>
	^ MooseSpecializedGroup with: self argumentOwner
]

{ #category : #accessing }
FASTFortranTExpression >> assignedIn [
	"Relation named: #assignedIn type: #FASTFortranTAssignment opposite: #expression"

	<generated>
	<FMComment: 'Optional assignment where this expression is used'>
	<container>
	<derived>
	^ assignedIn
]

{ #category : #accessing }
FASTFortranTExpression >> assignedIn: anObject [

	<generated>
	assignedIn := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> assignedInGroup [
	<generated>
	<navigation: 'AssignedIn'>
	^ MooseSpecializedGroup with: self assignedIn
]

{ #category : #accessing }
FASTFortranTExpression >> expressionStatementOwner [
	"Relation named: #expressionStatementOwner type: #FASTFortranTExpressionStatement opposite: #expression"

	<generated>
	<FMComment: 'The expression statement that own me (if it''s the case'>
	<container>
	<derived>
	^ expressionStatementOwner
]

{ #category : #accessing }
FASTFortranTExpression >> expressionStatementOwner: anObject [

	<generated>
	expressionStatementOwner := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> expressionStatementOwnerGroup [
	<generated>
	<navigation: 'ExpressionStatementOwner'>
	^ MooseSpecializedGroup with: self expressionStatementOwner
]

{ #category : #accessing }
FASTFortranTExpression >> returnOwner [
	"Relation named: #returnOwner type: #FASTFortranTReturnStatement opposite: #expression"

	<generated>
	<FMComment: 'The return statement that own the expression (if it''s the case)'>
	<container>
	<derived>
	^ returnOwner
]

{ #category : #accessing }
FASTFortranTExpression >> returnOwner: anObject [

	<generated>
	returnOwner := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> returnOwnerGroup [
	<generated>
	<navigation: 'ReturnOwner'>
	^ MooseSpecializedGroup with: self returnOwner
]
