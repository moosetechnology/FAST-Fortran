"
I represent an assignment expression as a part of assignment statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTFortranTExpression` | `arguments` | `FASTFortranTWithArguments` | my owner|
| `assignedIn` | `FASTFortranTExpression` | `expression` | `FASTFortranTAssignment` | Optional assignment where this expression is used|
| `expressionStatementOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranAbstractIOStatement` | |
| `parentLoopControlInitialization` | `FASTFortranAssignmentExpression` | `init` | `FASTFortranLoopControlExpression` | |
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTFortranTAssignment` | `assignedIn` | `FASTFortranTExpression` | Assigned expression (rhs of assignment)|
| `variable` | `FASTFortranTAssignment` | `parentAssignmentExpression` | `FASTFortranTVariableEntity` | An assigned variable (lhs of assignment)|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranAssignmentExpression,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTAssignment + FASTFortranTIOParameter',
	#classTraits : 'FASTFortranTAssignment classTrait + FASTFortranTIOParameter classTrait',
	#instVars : [
		'#parentLoopControlInitialization => FMOne type: #FASTFortranLoopControlExpression opposite: #init'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAssignmentExpression class >> annotation [

	<FMClass: #AssignmentExpression super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranAssignmentExpression >> parentLoopControlInitialization [
	"Relation named: #parentLoopControlInitialization type: #FASTFortranLoopControlExpression opposite: #init"

	<generated>
	<container>
	<derived>
	^ parentLoopControlInitialization
]

{ #category : #accessing }
FASTFortranAssignmentExpression >> parentLoopControlInitialization: anObject [

	<generated>
	parentLoopControlInitialization := anObject
]

{ #category : #navigation }
FASTFortranAssignmentExpression >> parentLoopControlInitializationGroup [
	<generated>
	<navigation: 'ParentLoopControlInitialization'>
	^ MooseSpecializedGroup with: self parentLoopControlInitialization
]
