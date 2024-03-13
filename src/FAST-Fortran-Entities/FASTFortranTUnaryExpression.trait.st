"
A trait representing an unary expression of a node of a source code.

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

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTFortranTUnaryExpression` | `parentExpression` | `FASTFortranTExpression` | (sub-)expression in the unary expression|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `operator` | `String` | nil | Unary expression operator|
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTUnaryExpression,
	#instVars : [
		'#expression => FMOne type: #FASTFortranTExpression opposite: #parentExpression',
		'#operator => FMProperty'
	],
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTUnaryExpression classSide >> annotation [

	<FMClass: #TUnaryExpression super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTUnaryExpression >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #parentExpression"

	<generated>
	<FMComment: '(sub-)expression in the unary expression'>
	^ expression
]

{ #category : #accessing }
FASTFortranTUnaryExpression >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranTUnaryExpression >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : #accessing }
FASTFortranTUnaryExpression >> operator [

	<FMProperty: #operator type: #String>
	<generated>
	<FMComment: 'Unary expression operator'>
	^ operator
]

{ #category : #accessing }
FASTFortranTUnaryExpression >> operator: anObject [
	<generated>
	operator := anObject
]
