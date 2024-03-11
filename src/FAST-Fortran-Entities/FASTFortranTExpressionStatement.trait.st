"
A node of a statement which is representing a single expression. 

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `statementContainer` | `FASTFortranTStatement` | `statements` | `FASTFortranTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTFortranTExpressionStatement` | `expressionStatementOwner` | `FASTFortranTExpression` | The expression of the statement|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTExpressionStatement,
	#instVars : [
		'#expression => FMOne type: #FASTFortranTExpression opposite: #expressionStatementOwner'
	],
	#traits : 'FASTFortranTStatement',
	#classTraits : 'FASTFortranTStatement classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTExpressionStatement classSide >> annotation [

	<FMClass: #TExpressionStatement super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTExpressionStatement >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #expressionStatementOwner"

	<generated>
	<FMComment: 'The expression of the statement'>
	^ expression
]

{ #category : #accessing }
FASTFortranTExpressionStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranTExpressionStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
