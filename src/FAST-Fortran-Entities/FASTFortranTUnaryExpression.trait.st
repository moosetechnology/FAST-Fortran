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
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTFortranTUnaryExpression` | `parentExpression` | `FASTFortranAbstractExpression` | expression|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `operator` | `String` | nil | Unary expression operator|
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTUnaryExpression,
	#instVars : [
		'#operator => FMProperty',
		'#expression => FMOne type: #FASTFortranAbstractExpression opposite: #parentExpression'
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
	"Relation named: #expression type: #FASTFortranAbstractExpression opposite: #parentExpression"

	<generated>
	<FMComment: 'expression'>
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
