"
I represent Fortran numerical Literals (Integer, Real, Complex)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTFortranTExpression` | `arguments` | `FASTFortranTWithArguments` | my owner|
| `assignedIn` | `FASTFortranTExpression` | `expression` | `FASTFortranTAssignment` | Optional assignment where this expression is used|
| `expressionStatementOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentTypeSize` | `FASTFortranNumericalConstant` | `size` | `FASTFortranType` | |
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `primitiveValue` | `String` | nil | The literal itself as found in the source code. We use primitiveValue in order to override value from Object|
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranNumericalConstant,
	#superclass : #FASTFortranAbstractLiteral,
	#traits : 'FASTFortranTNumericalLiteral',
	#classTraits : 'FASTFortranTNumericalLiteral classTrait',
	#instVars : [
		'#parentTypeSize => FMOne type: #FASTFortranType opposite: #size'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranNumericalConstant class >> annotation [

	<FMClass: #NumericalConstant super: #FASTFortranAbstractLiteral>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranNumericalConstant >> parentTypeSize [
	"Relation named: #parentTypeSize type: #FASTFortranType opposite: #size"

	<generated>
	<container>
	<derived>
	^ parentTypeSize
]

{ #category : #accessing }
FASTFortranNumericalConstant >> parentTypeSize: anObject [

	<generated>
	parentTypeSize := anObject
]

{ #category : #navigation }
FASTFortranNumericalConstant >> parentTypeSizeGroup [
	<generated>
	<navigation: 'ParentTypeSize'>
	^ MooseSpecializedGroup with: self parentTypeSize
]
