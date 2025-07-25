"
a Fortran Binary Expression (arithmetic, logical)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `ioSpecifier` | `FASTTExpression` | `expression` | `FASTFortranIOParameter` | name of the parameter (keyword argument)|
| `parentConditionalStatement` | `FASTTExpression` | `condition` | `FASTTConditionalStatement` | Optional condition statement where this expression is used|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `leftOperand` | `FASTTBinaryExpression` | `parentExpressionLeft` | `FASTTExpression` | left part of a binary expression|
| `rightOperand` | `FASTTBinaryExpression` | `parentExpressionRight` | `FASTTExpression` | left part of the expression|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `operator` | `String` | nil | Binary expression operator|
| `operator` | `String` | nil | Binary expression operator|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranBinaryExpression',
	#superclass : 'FASTFortranAbstractExpression',
	#traits : 'FASTTBinaryExpression',
	#classTraits : 'FASTTBinaryExpression classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranBinaryExpression class >> annotation [

	<FMClass: #BinaryExpression super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
