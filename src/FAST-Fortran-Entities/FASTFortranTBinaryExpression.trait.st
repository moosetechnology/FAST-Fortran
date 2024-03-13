"
A trait representing a binary expression of a node of a source code.

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
| `leftOperand` | `FASTFortranTBinaryExpression` | `parentExpressionLeft` | `FASTFortranTExpression` | left part of a binary expression|
| `rightOperand` | `FASTFortranTBinaryExpression` | `parentExpressionRight` | `FASTFortranTExpression` | left part of the expression|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `operator` | `String` | nil | Binary expression operator|
| `operator` | `String` | nil | Binary expression operator|
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTBinaryExpression,
	#instVars : [
		'#leftOperand => FMOne type: #FASTFortranTExpression opposite: #parentExpressionLeft',
		'#operator => FMProperty',
		'#rightOperand => FMOne type: #FASTFortranTExpression opposite: #parentExpressionRight'
	],
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTBinaryExpression classSide >> annotation [

	<FMClass: #TBinaryExpression super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> leftOperand [
	"Relation named: #leftOperand type: #FASTFortranTExpression opposite: #parentExpressionLeft"

	<generated>
	<FMComment: 'left part of a binary expression'>
	^ leftOperand
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> leftOperand: anObject [

	<generated>
	leftOperand := anObject
]

{ #category : #navigation }
FASTFortranTBinaryExpression >> leftOperandGroup [
	<generated>
	<navigation: 'LeftOperand'>
	^ MooseSpecializedGroup with: self leftOperand
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> operator [

	<FMProperty: #operator type: #String>
	<generated>
	<FMComment: 'Binary expression operator'>
	^ operator
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> operator: anObject [
	<generated>
	operator := anObject
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> rightOperand [
	"Relation named: #rightOperand type: #FASTFortranTExpression opposite: #parentExpressionRight"

	<generated>
	<FMComment: 'left part of the expression'>
	^ rightOperand
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> rightOperand: anObject [

	<generated>
	rightOperand := anObject
]

{ #category : #navigation }
FASTFortranTBinaryExpression >> rightOperandGroup [
	<generated>
	<navigation: 'RightOperand'>
	^ MooseSpecializedGroup with: self rightOperand
]
