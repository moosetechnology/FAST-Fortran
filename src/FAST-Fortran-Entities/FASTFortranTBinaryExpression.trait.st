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
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `left` | `FASTFortranTBinaryExpression` | `parentExpressionLeft` | `FASTFortranAbstractExpression` | left part of a binary expression|
| `right` | `FASTFortranTBinaryExpression` | `parentExpressionRight` | `FASTFortranAbstractExpression` | left part of the expression|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `operator` | `String` | nil | Binary expression operator|
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTBinaryExpression,
	#instVars : [
		'#operator => FMProperty',
		'#left => FMOne type: #FASTFortranAbstractExpression opposite: #parentExpressionLeft',
		'#right => FMOne type: #FASTFortranAbstractExpression opposite: #parentExpressionRight'
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
FASTFortranTBinaryExpression >> left [
	"Relation named: #left type: #FASTFortranAbstractExpression opposite: #parentExpressionLeft"

	<generated>
	<FMComment: 'left part of a binary expression'>
	^ left
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> left: anObject [

	<generated>
	left := anObject
]

{ #category : #navigation }
FASTFortranTBinaryExpression >> leftGroup [
	<generated>
	<navigation: 'Left'>
	^ MooseSpecializedGroup with: self left
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
FASTFortranTBinaryExpression >> right [
	"Relation named: #right type: #FASTFortranAbstractExpression opposite: #parentExpressionRight"

	<generated>
	<FMComment: 'left part of the expression'>
	^ right
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> right: anObject [

	<generated>
	right := anObject
]

{ #category : #navigation }
FASTFortranTBinaryExpression >> rightGroup [
	<generated>
	<navigation: 'Right'>
	^ MooseSpecializedGroup with: self right
]
