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
| `parentExpression` | `FASTFortranTExpression` | `expression` | `FASTFortranTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTFortranTExpression` | `leftOperand` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTFortranTExpression` | `rightOperand` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am right side|
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
		'#argumentOwner => FMOne type: #FASTFortranTWithArguments opposite: #arguments',
		'#assignedIn => FMOne type: #FASTFortranTAssignment opposite: #expression',
		'#expressionStatementOwner => FMOne type: #FASTFortranTExpressionStatement opposite: #expression',
		'#parentExpression => FMOne type: #FASTFortranTUnaryExpression opposite: #expression',
		'#parentExpressionLeft => FMOne type: #FASTFortranTBinaryExpression opposite: #leftOperand',
		'#parentExpressionRight => FMOne type: #FASTFortranTBinaryExpression opposite: #rightOperand',
		'#returnOwner => FMOne type: #FASTFortranTReturnStatement opposite: #expression'
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
FASTFortranTExpression >> parentExpression [
	"Relation named: #parentExpression type: #FASTFortranTUnaryExpression opposite: #expression"

	<generated>
	<FMComment: 'Parent (unary) expression'>
	<container>
	<derived>
	^ parentExpression
]

{ #category : #accessing }
FASTFortranTExpression >> parentExpression: anObject [

	<generated>
	parentExpression := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> parentExpressionGroup [
	<generated>
	<navigation: 'ParentExpression'>
	^ MooseSpecializedGroup with: self parentExpression
]

{ #category : #accessing }
FASTFortranTExpression >> parentExpressionLeft [
	"Relation named: #parentExpressionLeft type: #FASTFortranTBinaryExpression opposite: #leftOperand"

	<generated>
	<FMComment: 'Parent (binary) expression of which I am left side'>
	<container>
	<derived>
	^ parentExpressionLeft
]

{ #category : #accessing }
FASTFortranTExpression >> parentExpressionLeft: anObject [

	<generated>
	parentExpressionLeft := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> parentExpressionLeftGroup [
	<generated>
	<navigation: 'ParentExpressionLeft'>
	^ MooseSpecializedGroup with: self parentExpressionLeft
]

{ #category : #accessing }
FASTFortranTExpression >> parentExpressionRight [
	"Relation named: #parentExpressionRight type: #FASTFortranTBinaryExpression opposite: #rightOperand"

	<generated>
	<FMComment: 'Parent (binary) expression of which I am right side'>
	<container>
	<derived>
	^ parentExpressionRight
]

{ #category : #accessing }
FASTFortranTExpression >> parentExpressionRight: anObject [

	<generated>
	parentExpressionRight := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> parentExpressionRightGroup [
	<generated>
	<navigation: 'ParentExpressionRight'>
	^ MooseSpecializedGroup with: self parentExpressionRight
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
