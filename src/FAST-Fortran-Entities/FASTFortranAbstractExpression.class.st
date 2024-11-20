"
I am the super class of all Fortran expressions

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `assignementExpressionOwner` | `FASTFortranAbstractExpression` | `expression` | `FASTFortranFunctionStatement` | The AssignementExpression owner (if possible)|
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentArrayDimensionDeclarator` | `FASTFortranAbstractExpression` | `upperBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentArrayDimensionDeclarator` | `FASTFortranAbstractExpression` | `lowerBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentArrayExpression` | `FASTFortranAbstractExpression` | `indices` | `FASTFortranArrayVariable` | an ArrayVariable expression of which I am an indice|
| `parentConditionalStatement` | `FASTFortranAbstractExpression` | `condition` | `FASTFortranConditionalStatement` | Parent conditional statement (if-block, if-logical, ...)|
| `parentDataStatement` | `FASTFortranAbstractExpression` | `dataConstants` | `FASTFortranDataGroup` | |
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentGotoAssignedStatement` | `FASTFortranAbstractExpression` | `selectorExpression` | `FASTFortranGoToAssignedStatement` | |
| `parentGotoComputedStatement` | `FASTFortranAbstractExpression` | `selectorExpression` | `FASTFortranGoToComputedStatement` | |
| `parentLoopControlIncrement` | `FASTFortranAbstractExpression` | `increment` | `FASTFortranLoopControlExpression` | |
| `parentLoopControlLimit` | `FASTFortranAbstractExpression` | `limit` | `FASTFortranLoopControlExpression` | |
| `parentTypeSize` | `FASTFortranAbstractExpression` | `size` | `FASTFortranType` | |
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `variableDeclaratorOwner` | `FASTFortranAbstractExpression` | `expression` | `FASTFortranVariableDeclarator` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranAbstractExpression',
	#superclass : 'FASTFortranEntity',
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#instVars : [
		'#assignementExpressionOwner => FMOne type: #FASTFortranFunctionStatement opposite: #expression',
		'#parentArrayDimensionDeclarator => FMOne type: #FASTFortranArrayRange opposite: #upperBound',
		'#parentArrayExpression => FMOne type: #FASTFortranArrayVariable opposite: #indices',
		'#parentConditionalStatement => FMOne type: #FASTFortranConditionalStatement opposite: #condition',
		'#parentDataStatement => FMOne type: #FASTFortranDataGroup opposite: #dataConstants',
		'#parentGotoAssignedStatement => FMOne type: #FASTFortranGoToAssignedStatement opposite: #selectorExpression',
		'#parentGotoComputedStatement => FMOne type: #FASTFortranGoToComputedStatement opposite: #selectorExpression',
		'#parentLoopControlIncrement => FMOne type: #FASTFortranLoopControlExpression opposite: #increment',
		'#parentLoopControlLimit => FMOne type: #FASTFortranLoopControlExpression opposite: #limit',
		'#parentTypeSize => FMOne type: #FASTFortranType opposite: #size',
		'#variableDeclaratorOwner => FMOne type: #FASTFortranVariableDeclarator opposite: #expression'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranAbstractExpression class >> annotation [

	<FMClass: #AbstractExpression super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> assignementExpressionOwner [
	"Relation named: #assignementExpressionOwner type: #FASTFortranFunctionStatement opposite: #expression"

	<generated>
	<FMComment: 'The AssignementExpression owner (if possible)'>
	<container>
	<derived>
	^ assignementExpressionOwner
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> assignementExpressionOwner: anObject [

	<generated>
	assignementExpressionOwner := anObject
]

{ #category : 'navigation' }
FASTFortranAbstractExpression >> assignementExpressionOwnerGroup [
	<generated>
	<navigation: 'AssignementExpressionOwner'>
	^ MooseSpecializedGroup with: self assignementExpressionOwner
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentArrayDimensionDeclarator [
	"Relation named: #parentArrayDimensionDeclarator type: #FASTFortranArrayRange opposite: #upperBound"

	<generated>
	<FMComment: 'Parent array dimension declarator'>
	<container>
	<derived>
	^ parentArrayDimensionDeclarator
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentArrayDimensionDeclarator: anObject [

	<generated>
	parentArrayDimensionDeclarator := anObject
]

{ #category : 'navigation' }
FASTFortranAbstractExpression >> parentArrayDimensionDeclaratorGroup [
	<generated>
	<navigation: 'ParentArrayDimensionDeclarator'>
	^ MooseSpecializedGroup with: self parentArrayDimensionDeclarator
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentArrayExpression [
	"Relation named: #parentArrayExpression type: #FASTFortranArrayVariable opposite: #indices"

	<generated>
	<FMComment: 'an ArrayVariable expression of which I am an indice'>
	<container>
	^ parentArrayExpression
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentArrayExpression: anObject [

	<generated>
	parentArrayExpression := anObject
]

{ #category : 'navigation' }
FASTFortranAbstractExpression >> parentArrayExpressionGroup [
	<generated>
	<navigation: 'ParentArrayExpression'>
	^ MooseSpecializedGroup with: self parentArrayExpression
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentConditionalStatement [
	"Relation named: #parentConditionalStatement type: #FASTFortranConditionalStatement opposite: #condition"

	<generated>
	<FMComment: 'Parent conditional statement (if-block, if-logical, ...)'>
	<container>
	<derived>
	^ parentConditionalStatement
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentConditionalStatement: anObject [

	<generated>
	parentConditionalStatement := anObject
]

{ #category : 'navigation' }
FASTFortranAbstractExpression >> parentConditionalStatementGroup [
	<generated>
	<navigation: 'ParentConditionalStatement'>
	^ MooseSpecializedGroup with: self parentConditionalStatement
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentDataStatement [
	"Relation named: #parentDataStatement type: #FASTFortranDataGroup opposite: #dataConstants"

	<generated>
	<container>
	^ parentDataStatement
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentDataStatement: anObject [

	<generated>
	parentDataStatement := anObject
]

{ #category : 'navigation' }
FASTFortranAbstractExpression >> parentDataStatementGroup [
	<generated>
	<navigation: 'ParentDataStatement'>
	^ MooseSpecializedGroup with: self parentDataStatement
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentGotoAssignedStatement [
	"Relation named: #parentGotoAssignedStatement type: #FASTFortranGoToAssignedStatement opposite: #selectorExpression"

	<generated>
	<container>
	<derived>
	^ parentGotoAssignedStatement
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentGotoAssignedStatement: anObject [

	<generated>
	parentGotoAssignedStatement := anObject
]

{ #category : 'navigation' }
FASTFortranAbstractExpression >> parentGotoAssignedStatementGroup [
	<generated>
	<navigation: 'ParentGotoAssignedStatement'>
	^ MooseSpecializedGroup with: self parentGotoAssignedStatement
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentGotoComputedStatement [
	"Relation named: #parentGotoComputedStatement type: #FASTFortranGoToComputedStatement opposite: #selectorExpression"

	<generated>
	<container>
	<derived>
	^ parentGotoComputedStatement
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentGotoComputedStatement: anObject [

	<generated>
	parentGotoComputedStatement := anObject
]

{ #category : 'navigation' }
FASTFortranAbstractExpression >> parentGotoComputedStatementGroup [
	<generated>
	<navigation: 'ParentGotoComputedStatement'>
	^ MooseSpecializedGroup with: self parentGotoComputedStatement
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentLoopControlIncrement [
	"Relation named: #parentLoopControlIncrement type: #FASTFortranLoopControlExpression opposite: #increment"

	<generated>
	<container>
	<derived>
	^ parentLoopControlIncrement
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentLoopControlIncrement: anObject [

	<generated>
	parentLoopControlIncrement := anObject
]

{ #category : 'navigation' }
FASTFortranAbstractExpression >> parentLoopControlIncrementGroup [
	<generated>
	<navigation: 'ParentLoopControlIncrement'>
	^ MooseSpecializedGroup with: self parentLoopControlIncrement
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentLoopControlLimit [
	"Relation named: #parentLoopControlLimit type: #FASTFortranLoopControlExpression opposite: #limit"

	<generated>
	<container>
	<derived>
	^ parentLoopControlLimit
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentLoopControlLimit: anObject [

	<generated>
	parentLoopControlLimit := anObject
]

{ #category : 'navigation' }
FASTFortranAbstractExpression >> parentLoopControlLimitGroup [
	<generated>
	<navigation: 'ParentLoopControlLimit'>
	^ MooseSpecializedGroup with: self parentLoopControlLimit
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentTypeSize [
	"Relation named: #parentTypeSize type: #FASTFortranType opposite: #size"

	<generated>
	<container>
	<derived>
	^ parentTypeSize
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> parentTypeSize: anObject [

	<generated>
	parentTypeSize := anObject
]

{ #category : 'navigation' }
FASTFortranAbstractExpression >> parentTypeSizeGroup [
	<generated>
	<navigation: 'ParentTypeSize'>
	^ MooseSpecializedGroup with: self parentTypeSize
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> variableDeclaratorOwner [
	"Relation named: #variableDeclaratorOwner type: #FASTFortranVariableDeclarator opposite: #expression"

	<generated>
	<container>
	<derived>
	^ variableDeclaratorOwner
]

{ #category : 'accessing' }
FASTFortranAbstractExpression >> variableDeclaratorOwner: anObject [

	<generated>
	variableDeclaratorOwner := anObject
]

{ #category : 'navigation' }
FASTFortranAbstractExpression >> variableDeclaratorOwnerGroup [
	<generated>
	<navigation: 'VariableDeclaratorOwner'>
	^ MooseSpecializedGroup with: self variableDeclaratorOwner
]
