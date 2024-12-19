"
I represent an assignment expression as a part of assignment statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `ioSpecifier` | `FASTTExpression` | `expression` | `FASTFortranIOParameter` | name of the parameter (keyword argument)|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranAbstractIOStatement` | |
| `parentLoopControlInitialization` | `FASTFortranAssignmentExpression` | `init` | `FASTFortranLoopControlExpression` | |
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTTAssignment` | `assignedIn` | `FASTTExpression` | Assigned expression (rhs of assignment)|
| `variable` | `FASTTAssignment` | `parentAssignmentExpression` | `FASTTVariableEntity` | An assigned variable (lhs of assignment)|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranAssignmentExpression',
	#superclass : 'FASTFortranAbstractExpression',
	#traits : 'FASTFortranTIOParameter + FASTTAssignment',
	#classTraits : 'FASTFortranTIOParameter classTrait + FASTTAssignment classTrait',
	#instVars : [
		'#parentLoopControlInitialization => FMOne type: #FASTFortranLoopControlExpression opposite: #init'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranAssignmentExpression class >> annotation [

	<FMClass: #AssignmentExpression super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranAssignmentExpression >> parentLoopControlInitialization [
	"Relation named: #parentLoopControlInitialization type: #FASTFortranLoopControlExpression opposite: #init"

	<generated>
	<container>
	<derived>
	^ parentLoopControlInitialization
]

{ #category : 'accessing' }
FASTFortranAssignmentExpression >> parentLoopControlInitialization: anObject [

	<generated>
	parentLoopControlInitialization := anObject
]

{ #category : 'navigation' }
FASTFortranAssignmentExpression >> parentLoopControlInitializationGroup [
	<generated>
	<navigation: 'ParentLoopControlInitialization'>
	^ MooseSpecializedGroup with: self parentLoopControlInitialization
]
