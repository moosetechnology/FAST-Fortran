"
I represent an array lower/upper bounds

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assignementExpressionOwner` | `FASTTExpression` | `expression` | `FASTFortranFunctionStatement` | The AssignementExpression owner (if possible)|
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentArrayDimensionDeclarator` | `FASTTExpression` | `upperBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentArrayDimensionDeclarator` | `FASTTExpression` | `lowerBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentConditionalStatement` | `FASTTExpression` | `condition` | `FASTFortranTConditionalStatement` | Parent conditional statement (if-block, if-logical, ...)|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent expression (if possible)|
| `parentExpressionLeft` | `FASTTExpression` | `left` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `right` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentLoopControlIncrement` | `FASTTExpression` | `increment` | `FASTFortranLoopControlExpression` | |
| `parentLoopControlLimit` | `FASTTExpression` | `limit` | `FASTFortranLoopControlExpression` | |
| `parentVariableDeclarator` | `FASTFortranArrayRange` | `dimensions` | `FASTFortranVariableDeclarator` | The variable declarator I am part of|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `variableDeclaratorOwner` | `FASTTExpression` | `expression` | `FASTFortranTVariableDeclarator` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `lowerBound` | `FASTFortranArrayRange` | `parentArrayDimensionDeclarator` | `FASTTExpression` | A lower bound of an array dimension|
| `upperBound` | `FASTFortranArrayRange` | `parentArrayDimensionDeclarator` | `FASTTExpression` | An upper bound of an array dimension|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `parentArrayExpression` | `FASTTExpression` | `indices` | `FASTFortranArrayVariable` | an ArrayVariable expression of which I am an indice|
| `parentDataStatement` | `FASTTExpression` | `dataConstants` | `FASTFortranDataGroup` | |
| `parentGotoAssignedStatement` | `FASTTExpression` | `selectorExpression` | `FASTFortranGoToAssignedStatement` | |
| `parentGotoComputedStatement` | `FASTTExpression` | `selectorExpression` | `FASTFortranGoToComputedStatement` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranArrayRange,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#instVars : [
		'#parentVariableDeclarator => FMOne type: #FASTFortranVariableDeclarator opposite: #dimensions'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranArrayRange class >> annotation [

	<FMClass: #ArrayRange super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranArrayRange >> lowerBound [
	"Relation named: #lowerBound type: #FASTTExpression opposite: #parentArrayDimensionDeclarator"

	<generated>
	<FMComment: 'A lower bound of an array dimension'>
	<FMProperty: #lowerBound type: #FASTTExpression opposite: #parentArrayDimensionDeclarator>
	^ self attributeAt: #lowerBound ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTFortranArrayRange >> lowerBound: anObject [

	<generated>
	(self attributeAt: #lowerBound ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self lowerBound.
		self attributeAt: #lowerBound put: anObject.
		otherSide parentArrayDimensionDeclarator: nil ]
	ifNotNil: [ 
		self attributeAt: #lowerBound put: anObject.
		anObject parentArrayDimensionDeclarator: self ]
]

{ #category : #navigation }
FASTFortranArrayRange >> lowerBoundGroup [
	<generated>
	<navigation: 'LowerBound'>
	^ MooseSpecializedGroup with: self lowerBound
]

{ #category : #accessing }
FASTFortranArrayRange >> parentVariableDeclarator [
	"Relation named: #parentVariableDeclarator type: #FASTFortranVariableDeclarator opposite: #dimensions"

	<generated>
	<FMComment: 'The variable declarator I am part of'>
	<container>
	^ parentVariableDeclarator
]

{ #category : #accessing }
FASTFortranArrayRange >> parentVariableDeclarator: anObject [

	<generated>
	parentVariableDeclarator := anObject
]

{ #category : #navigation }
FASTFortranArrayRange >> parentVariableDeclaratorGroup [
	<generated>
	<navigation: 'ParentVariableDeclarator'>
	^ MooseSpecializedGroup with: self parentVariableDeclarator
]

{ #category : #accessing }
FASTFortranArrayRange >> upperBound [
	"Relation named: #upperBound type: #FASTTExpression opposite: #parentArrayDimensionDeclarator"

	<generated>
	<FMComment: 'An upper bound of an array dimension'>
	<FMProperty: #upperBound type: #FASTTExpression opposite: #parentArrayDimensionDeclarator>
	^ self attributeAt: #upperBound ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTFortranArrayRange >> upperBound: anObject [

	<generated>
	(self attributeAt: #upperBound ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self upperBound.
		self attributeAt: #upperBound put: anObject.
		otherSide parentArrayDimensionDeclarator: nil ]
	ifNotNil: [ 
		self attributeAt: #upperBound put: anObject.
		anObject parentArrayDimensionDeclarator: self ]
]

{ #category : #navigation }
FASTFortranArrayRange >> upperBoundGroup [
	<generated>
	<navigation: 'UpperBound'>
	^ MooseSpecializedGroup with: self upperBound
]
