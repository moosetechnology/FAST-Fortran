"
a Fortran Unary Expression (arithmetic, logical, character)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTFortranTExpression` | `arguments` | `FASTFortranTWithArguments` | my owner|
| `assignedIn` | `FASTFortranTExpression` | `expression` | `FASTFortranTAssignment` | Optional assignment where this expression is used|
| `assignementExpressionOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranFunctionStatement` | The AssignementExpression owner (if possible)|
| `expressionStatementOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentArrayDimensionDeclarator` | `FASTFortranTExpression` | `upperBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentArrayDimensionDeclarator` | `FASTFortranTExpression` | `lowerBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentArrayExpression` | `FASTFortranTExpression` | `indices` | `FASTFortranArrayVariable` | an ArrayVariable expression of which I am an indice|
| `parentConditionalStatement` | `FASTFortranTExpression` | `condition` | `FASTFortranTConditionalStatement` | Parent conditional statement (if-block, if-logical, ...)|
| `parentDataStatement` | `FASTFortranTExpression` | `dataConstants` | `FASTFortranDataGroup` | |
| `parentExpression` | `FASTFortranTExpression` | `expression` | `FASTFortranTUnaryExpression` | Parent expression (if possible)|
| `parentExpressionLeft` | `FASTFortranTExpression` | `left` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTFortranTExpression` | `right` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentGotoAssignedStatement` | `FASTFortranTExpression` | `selectorExpression` | `FASTFortranGoToAssignedStatement` | |
| `parentGotoComputedStatement` | `FASTFortranTExpression` | `selectorExpression` | `FASTFortranGoToComputedStatement` | |
| `parentLoopControlIncrement` | `FASTFortranTExpression` | `increment` | `FASTFortranLoopControlExpression` | |
| `parentLoopControlLimit` | `FASTFortranTExpression` | `limit` | `FASTFortranLoopControlExpression` | |
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|
| `variableDeclaratorOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTVariableDeclarator` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTFortranTUnaryExpression` | `parentExpression` | `FASTFortranTExpression` | expression|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `operator` | `String` | nil | Unary expression operator|
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranUnaryExpression,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTUnaryExpression',
	#classTraits : 'FASTFortranTUnaryExpression classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranUnaryExpression class >> annotation [

	<FMClass: #UnaryExpression super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
