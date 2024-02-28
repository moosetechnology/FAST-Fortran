"
I represent a Fortran ""implied do"" expression

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
| `parentExpression` | `FASTFortranTExpression` | `expression` | `FASTFortranTUnaryExpression` | Parent expression (if possible)|
| `parentExpressionLeft` | `FASTFortranTExpression` | `left` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTFortranTExpression` | `right` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentGotoAssignedStatement` | `FASTFortranTExpression` | `selectorExpression` | `FASTFortranGoToAssignedStatement` | |
| `parentLoopControlIncrement` | `FASTFortranTExpression` | `increment` | `FASTFortranLoopControlExpression` | |
| `parentLoopControlLimit` | `FASTFortranTExpression` | `limit` | `FASTFortranLoopControlExpression` | |
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|
| `variableDeclaratorOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTVariableDeclarator` | |
| `withVariableGroups` | `FASTFortranTVariableGroup` | `variableGroups` | `FASTFortranTWithVariableGroups` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `loopControl` | `FASTFortranTWithLoopControl` | `parentLoop` | `FASTFortranLoopControlExpression` | loop control|
| `variables` | `FASTFortranImpliedDoExpression` | `parentImpliedExpression` | `FASTFortranTVariableEntity` | |
| `variables` | `FASTFortranTVariableGroup` | `parentVariableGroup` | `FASTFortranVariable` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentDataStatement` | `FASTFortranTExpression` | `dataConstants` | `FASTFortranDataGroup` | |
| `parentGotoComputedStatement` | `FASTFortranTExpression` | `selectorExpression` | `FASTFortranGoToComputedStatement` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranImpliedDoExpression,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTExpression + FASTFortranTVariableGroup + FASTFortranTWithLoopControl',
	#classTraits : 'FASTFortranTExpression classTrait + FASTFortranTVariableGroup classTrait + FASTFortranTWithLoopControl classTrait',
	#instVars : [
		'#variables => FMMany type: #FASTFortranTVariableEntity opposite: #parentImpliedExpression'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranImpliedDoExpression class >> annotation [

	<FMClass: #ImpliedDoExpression super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranImpliedDoExpression >> addVariable: anObject [
	<generated>
	^ self variables add: anObject
]

{ #category : #accessing }
FASTFortranImpliedDoExpression >> variables [
	"Relation named: #variables type: #FASTFortranTVariableEntity opposite: #parentImpliedExpression"

	<generated>
	<derived>
	^ variables
]

{ #category : #accessing }
FASTFortranImpliedDoExpression >> variables: anObject [

	<generated>
	variables value: anObject
]

{ #category : #navigation }
FASTFortranImpliedDoExpression >> variablesGroup [
	<generated>
	<navigation: 'Variables'>
	^ MooseSpecializedGroup withAll: self variables asSet
]
