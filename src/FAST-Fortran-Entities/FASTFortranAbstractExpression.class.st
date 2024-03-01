"
I am the super class of all Fortran expressions

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTFortranTExpression` | `arguments` | `FASTFortranTWithArguments` | my owner|
| `assignedIn` | `FASTFortranTExpression` | `expression` | `FASTFortranTAssignment` | Optional assignment where this expression is used|
| `assignementExpressionOwner` | `FASTFortranAbstractExpression` | `expression` | `FASTFortranFunctionStatement` | The AssignementExpression owner (if possible)|
| `expressionStatementOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentArrayDimensionDeclarator` | `FASTFortranAbstractExpression` | `upperBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentArrayDimensionDeclarator` | `FASTFortranAbstractExpression` | `lowerBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentArrayExpression` | `FASTFortranAbstractExpression` | `indices` | `FASTFortranArrayVariable` | an ArrayVariable expression of which I am an indice|
| `parentConditionalStatement` | `FASTFortranAbstractExpression` | `condition` | `FASTFortranConditionalStatement` | Parent conditional statement (if-block, if-logical, ...)|
| `parentDataStatement` | `FASTFortranAbstractExpression` | `dataConstants` | `FASTFortranDataGroup` | |
| `parentExpression` | `FASTFortranAbstractExpression` | `expression` | `FASTFortranTUnaryExpression` | Parent expression (if possible)|
| `parentExpressionLeft` | `FASTFortranAbstractExpression` | `left` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTFortranAbstractExpression` | `right` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentGotoAssignedStatement` | `FASTFortranAbstractExpression` | `selectorExpression` | `FASTFortranGoToAssignedStatement` | |
| `parentGotoComputedStatement` | `FASTFortranAbstractExpression` | `selectorExpression` | `FASTFortranGoToComputedStatement` | |
| `parentLoopControlIncrement` | `FASTFortranAbstractExpression` | `increment` | `FASTFortranLoopControlExpression` | |
| `parentLoopControlLimit` | `FASTFortranAbstractExpression` | `limit` | `FASTFortranLoopControlExpression` | |
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|
| `variableDeclaratorOwner` | `FASTFortranAbstractExpression` | `expression` | `FASTFortranTVariableDeclarator` | |


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
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#instVars : [
		'#parentArrayDimensionDeclarator => FMOne type: #FASTFortranArrayRange opposite: #upperBound',
		'#parentArrayExpression => FMOne type: #FASTFortranArrayVariable opposite: #indices',
		'#parentDataStatement => FMOne type: #FASTFortranDataGroup opposite: #dataConstants',
		'#variableDeclaratorOwner => FMOne type: #FASTFortranTVariableDeclarator opposite: #expression',
		'#assignementExpressionOwner => FMOne type: #FASTFortranFunctionStatement opposite: #expression',
		'#parentGotoComputedStatement => FMOne type: #FASTFortranGoToComputedStatement opposite: #selectorExpression',
		'#parentGotoAssignedStatement => FMOne type: #FASTFortranGoToAssignedStatement opposite: #selectorExpression',
		'#parentConditionalStatement => FMOne type: #FASTFortranConditionalStatement opposite: #condition',
		'#parentLoopControlIncrement => FMOne type: #FASTFortranLoopControlExpression opposite: #increment',
		'#parentLoopControlLimit => FMOne type: #FASTFortranLoopControlExpression opposite: #limit',
		'#parentExpressionLeft => FMOne type: #FASTFortranTBinaryExpression opposite: #left',
		'#parentExpressionRight => FMOne type: #FASTFortranTBinaryExpression opposite: #right',
		'#parentExpression => FMOne type: #FASTFortranTUnaryExpression opposite: #expression'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAbstractExpression class >> annotation [

	<FMClass: #AbstractExpression super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranAbstractExpression >> assignementExpressionOwner [
	"Relation named: #assignementExpressionOwner type: #FASTFortranFunctionStatement opposite: #expression"

	<generated>
	<FMComment: 'The AssignementExpression owner (if possible)'>
	<container>
	<derived>
	^ assignementExpressionOwner
]

{ #category : #accessing }
FASTFortranAbstractExpression >> assignementExpressionOwner: anObject [

	<generated>
	assignementExpressionOwner := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> assignementExpressionOwnerGroup [
	<generated>
	<navigation: 'AssignementExpressionOwner'>
	^ MooseSpecializedGroup with: self assignementExpressionOwner
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentArrayDimensionDeclarator [
	"Relation named: #parentArrayDimensionDeclarator type: #FASTFortranArrayRange opposite: #upperBound"

	<generated>
	<FMComment: 'Parent array dimension declarator'>
	<container>
	<derived>
	^ parentArrayDimensionDeclarator
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentArrayDimensionDeclarator: anObject [

	<generated>
	parentArrayDimensionDeclarator := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> parentArrayDimensionDeclaratorGroup [
	<generated>
	<navigation: 'ParentArrayDimensionDeclarator'>
	^ MooseSpecializedGroup with: self parentArrayDimensionDeclarator
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentArrayExpression [
	"Relation named: #parentArrayExpression type: #FASTFortranArrayVariable opposite: #indices"

	<generated>
	<FMComment: 'an ArrayVariable expression of which I am an indice'>
	<container>
	^ parentArrayExpression
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentArrayExpression: anObject [

	<generated>
	parentArrayExpression := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> parentArrayExpressionGroup [
	<generated>
	<navigation: 'ParentArrayExpression'>
	^ MooseSpecializedGroup with: self parentArrayExpression
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentConditionalStatement [
	"Relation named: #parentConditionalStatement type: #FASTFortranConditionalStatement opposite: #condition"

	<generated>
	<FMComment: 'Parent conditional statement (if-block, if-logical, ...)'>
	<container>
	<derived>
	^ parentConditionalStatement
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentConditionalStatement: anObject [

	<generated>
	parentConditionalStatement := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> parentConditionalStatementGroup [
	<generated>
	<navigation: 'ParentConditionalStatement'>
	^ MooseSpecializedGroup with: self parentConditionalStatement
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentDataStatement [
	"Relation named: #parentDataStatement type: #FASTFortranDataGroup opposite: #dataConstants"

	<generated>
	<container>
	^ parentDataStatement
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentDataStatement: anObject [

	<generated>
	parentDataStatement := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> parentDataStatementGroup [
	<generated>
	<navigation: 'ParentDataStatement'>
	^ MooseSpecializedGroup with: self parentDataStatement
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentExpression [
	"Relation named: #parentExpression type: #FASTFortranTUnaryExpression opposite: #expression"

	<generated>
	<FMComment: 'Parent expression (if possible)'>
	<container>
	<derived>
	^ parentExpression
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentExpression: anObject [

	<generated>
	parentExpression := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> parentExpressionGroup [
	<generated>
	<navigation: 'ParentExpression'>
	^ MooseSpecializedGroup with: self parentExpression
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentExpressionLeft [
	"Relation named: #parentExpressionLeft type: #FASTFortranTBinaryExpression opposite: #left"

	<generated>
	<FMComment: 'Parent (binary) expression of which I am left side'>
	<container>
	<derived>
	^ parentExpressionLeft
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentExpressionLeft: anObject [

	<generated>
	parentExpressionLeft := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> parentExpressionLeftGroup [
	<generated>
	<navigation: 'ParentExpressionLeft'>
	^ MooseSpecializedGroup with: self parentExpressionLeft
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentExpressionRight [
	"Relation named: #parentExpressionRight type: #FASTFortranTBinaryExpression opposite: #right"

	<generated>
	<FMComment: 'Parent (binary) expression of which I am right side'>
	<container>
	<derived>
	^ parentExpressionRight
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentExpressionRight: anObject [

	<generated>
	parentExpressionRight := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> parentExpressionRightGroup [
	<generated>
	<navigation: 'ParentExpressionRight'>
	^ MooseSpecializedGroup with: self parentExpressionRight
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentGotoAssignedStatement [
	"Relation named: #parentGotoAssignedStatement type: #FASTFortranGoToAssignedStatement opposite: #selectorExpression"

	<generated>
	<container>
	<derived>
	^ parentGotoAssignedStatement
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentGotoAssignedStatement: anObject [

	<generated>
	parentGotoAssignedStatement := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> parentGotoAssignedStatementGroup [
	<generated>
	<navigation: 'ParentGotoAssignedStatement'>
	^ MooseSpecializedGroup with: self parentGotoAssignedStatement
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentGotoComputedStatement [
	"Relation named: #parentGotoComputedStatement type: #FASTFortranGoToComputedStatement opposite: #selectorExpression"

	<generated>
	<container>
	<derived>
	^ parentGotoComputedStatement
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentGotoComputedStatement: anObject [

	<generated>
	parentGotoComputedStatement := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> parentGotoComputedStatementGroup [
	<generated>
	<navigation: 'ParentGotoComputedStatement'>
	^ MooseSpecializedGroup with: self parentGotoComputedStatement
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentLoopControlIncrement [
	"Relation named: #parentLoopControlIncrement type: #FASTFortranLoopControlExpression opposite: #increment"

	<generated>
	<container>
	<derived>
	^ parentLoopControlIncrement
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentLoopControlIncrement: anObject [

	<generated>
	parentLoopControlIncrement := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> parentLoopControlIncrementGroup [
	<generated>
	<navigation: 'ParentLoopControlIncrement'>
	^ MooseSpecializedGroup with: self parentLoopControlIncrement
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentLoopControlLimit [
	"Relation named: #parentLoopControlLimit type: #FASTFortranLoopControlExpression opposite: #limit"

	<generated>
	<container>
	<derived>
	^ parentLoopControlLimit
]

{ #category : #accessing }
FASTFortranAbstractExpression >> parentLoopControlLimit: anObject [

	<generated>
	parentLoopControlLimit := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> parentLoopControlLimitGroup [
	<generated>
	<navigation: 'ParentLoopControlLimit'>
	^ MooseSpecializedGroup with: self parentLoopControlLimit
]

{ #category : #accessing }
FASTFortranAbstractExpression >> variableDeclaratorOwner [
	"Relation named: #variableDeclaratorOwner type: #FASTFortranTVariableDeclarator opposite: #expression"

	<generated>
	<container>
	<derived>
	^ variableDeclaratorOwner
]

{ #category : #accessing }
FASTFortranAbstractExpression >> variableDeclaratorOwner: anObject [

	<generated>
	variableDeclaratorOwner := anObject
]

{ #category : #navigation }
FASTFortranAbstractExpression >> variableDeclaratorOwnerGroup [
	<generated>
	<navigation: 'VariableDeclaratorOwner'>
	^ MooseSpecializedGroup with: self variableDeclaratorOwner
]
