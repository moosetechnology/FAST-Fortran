"
a Fortran Binary Expression (arithmetic, logical)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTFortranTExpression` | `arguments` | `FASTFortranTWithArguments` | my owner|
| `assignedIn` | `FASTFortranTExpression` | `expression` | `FASTFortranTAssignment` | Optional assignment where this expression is used|
| `expressionStatementOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTExpressionStatement` | The expression statement that own me (if it's the case|
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `left` | `FASTFortranTBinaryExpression` | `parentExpressionLeft` | `FASTFortranAbstractExpression` | left part of a binary expression|
| `right` | `FASTFortranTBinaryExpression` | `parentExpressionRight` | `FASTFortranAbstractExpression` | left part of the expression|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `operator` | `String` | nil | Binary expression operator|
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranBinaryExpression,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTBinaryExpression',
	#classTraits : 'FASTFortranTBinaryExpression classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranBinaryExpression class >> annotation [

	<FMClass: #BinaryExpression super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
