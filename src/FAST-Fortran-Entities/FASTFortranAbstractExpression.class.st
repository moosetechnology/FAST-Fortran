"
I am the super class of all Fortran expressions

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
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `variableDeclaratorOwner` | `FASTTExpression` | `expression` | `FASTFortranTVariableDeclarator` | |

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
	#name : #FASTFortranAbstractExpression,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAbstractExpression class >> annotation [

	<FMClass: #AbstractExpression super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
