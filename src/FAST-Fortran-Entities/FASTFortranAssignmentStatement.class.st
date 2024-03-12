"
I represent Fortran assignment made without ASSIGN statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTFortranTExpression` | `arguments` | `FASTFortranTWithArguments` | my owner|
| `assignedIn` | `FASTFortranTExpression` | `expression` | `FASTFortranTAssignment` | Optional assignment where this expression is used|
| `expressionStatementOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentExpression` | `FASTFortranTExpression` | `expression` | `FASTFortranTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTFortranTExpression` | `left` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTFortranTExpression` | `right` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am right side|
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
	#name : #FASTFortranAssignmentStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTAssignment',
	#classTraits : 'FASTFortranTAssignment classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAssignmentStatement class >> annotation [

	<FMClass: #AssignmentStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
