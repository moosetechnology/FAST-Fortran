"
A numerical literal

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTFortranTExpression` | `arguments` | `FASTFortranTWithArguments` | my owner|
| `assignedIn` | `FASTFortranTExpression` | `expression` | `FASTFortranTAssignment` | Optional assignment where this expression is used|
| `expressionStatementOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTExpressionStatement` | The expression statement that own me (if it's the case|
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `primitiveValue` | `String` | nil | The literal itself as found in the source code. We use primitiveValue in order to override value from Object|
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTNumericalLiteral,
	#traits : 'FASTFortranTLiteral',
	#classTraits : 'FASTFortranTLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTNumericalLiteral classSide >> annotation [

	<FMClass: #TNumericalLiteral super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
