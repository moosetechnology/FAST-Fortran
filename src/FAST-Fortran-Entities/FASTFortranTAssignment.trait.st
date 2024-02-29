"
A node representing an assignment

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
| `expression` | `FASTFortranTAssignment` | `assignedIn` | `FASTFortranTExpression` | Assigned expression (rhs of assignment)|
| `variable` | `FASTFortranTAssignment` | `parentAssignmentExpression` | `FASTFortranTVariableEntity` | An assigned variable (lhs of assignment)|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTAssignment,
	#instVars : [
		'#variable => FMOne type: #FASTFortranTVariableEntity opposite: #parentAssignmentExpression',
		'#expression => FMOne type: #FASTFortranTExpression opposite: #assignedIn'
	],
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTAssignment classSide >> annotation [

	<FMClass: #TAssignment super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTAssignment >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #assignedIn"

	<generated>
	<FMComment: 'Assigned expression (rhs of assignment)'>
	^ expression
]

{ #category : #accessing }
FASTFortranTAssignment >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranTAssignment >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : #accessing }
FASTFortranTAssignment >> variable [
	"Relation named: #variable type: #FASTFortranTVariableEntity opposite: #parentAssignmentExpression"

	<generated>
	<FMComment: 'An assigned variable (lhs of assignment)'>
	^ variable
]

{ #category : #accessing }
FASTFortranTAssignment >> variable: anObject [

	<generated>
	variable := anObject
]

{ #category : #navigation }
FASTFortranTAssignment >> variableGroup [
	<generated>
	<navigation: 'Variable'>
	^ MooseSpecializedGroup with: self variable
]
