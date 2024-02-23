"
I represent a Fortran ""implied do"" expression

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
| `withVariableGroups` | `FASTFortranTVariableGroup` | `variableGroups` | `FASTFortranTWithVariableGroups` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `loopControl` | `FASTFortranTWithLoopControl` | `parentLoop` | `FASTFortranLoopControlExpression` | loop control|
| `variables` | `FASTFortranImpliedDoExpression` | `parentImpliedExpression` | `FASTTVariableEntity` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `parentArrayExpression` | `FASTTExpression` | `indices` | `FASTFortranArrayVariable` | an ArrayVariable expression of which I am an indice|
| `parentDataStatement` | `FASTTExpression` | `dataConstants` | `FASTFortranDataGroup` | |
| `parentGotoAssignedStatement` | `FASTTExpression` | `selectorExpression` | `FASTFortranGoToAssignedStatement` | |
| `parentGotoComputedStatement` | `FASTTExpression` | `selectorExpression` | `FASTFortranGoToComputedStatement` | |
| `variables` | `FASTFortranTVariableGroup` | `parentVariableGroup` | `FASTFortranVariable` | |


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
	#traits : 'FASTFortranTVariableGroup + FASTFortranTWithLoopControl + FASTTExpression',
	#classTraits : 'FASTFortranTVariableGroup classTrait + FASTFortranTWithLoopControl classTrait + FASTTExpression classTrait',
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
	"Relation named: #variables type: #FASTTVariableEntity opposite: #parentImpliedExpression"

	<generated>
	<derived>
	<FMProperty: #variables type: #FASTTVariableEntity opposite: #parentImpliedExpression>
	^ self attributeAt: #variables ifAbsentPut: [ FMMultivalueLink on: self opposite: #parentImpliedExpression: ]
]

{ #category : #accessing }
FASTFortranImpliedDoExpression >> variables: anObject [

	<generated>
	self variables value: anObject
]

{ #category : #navigation }
FASTFortranImpliedDoExpression >> variablesGroup [
	<generated>
	<navigation: 'Variables'>
	^ MooseSpecializedGroup withAll: self variables asSet
]
