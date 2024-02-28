"
A invocation of a behavioural entity

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTFortranTExpression` | `arguments` | `FASTFortranTWithArguments` | my owner|
| `assignedIn` | `FASTFortranTExpression` | `expression` | `FASTFortranTAssignment` | Optional assignment where this expression is used|
| `assignementExpressionOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranFunctionStatement` | The AssignementExpression owner (if possible)|
| `expressionStatementOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentArrayDimensionDeclarator` | `FASTFortranTExpression` | `upperBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentArrayDimensionDeclarator` | `FASTFortranTExpression` | `lowerBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentArrayExpression` | `FASTFortranTExpression` | `indices` | `FASTFortranArrayVariable` | an ArrayVariable expression of which I am an indice|
| `parentConditionalStatement` | `FASTFortranTExpression` | `condition` | `FASTFortranTConditionalStatement` | Parent conditional statement (if-block, if-logical, ...)|
| `parentExpression` | `FASTFortranTExpression` | `expression` | `FASTFortranTUnaryExpression` | Parent expression (if possible)|
| `parentExpressionLeft` | `FASTFortranTExpression` | `left` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTFortranTExpression` | `right` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentGotoAssignedStatement` | `FASTFortranTExpression` | `selectorExpression` | `FASTFortranGoToAssignedStatement` | |
| `parentLoopControlIncrement` | `FASTFortranTExpression` | `increment` | `FASTFortranLoopControlExpression` | |
| `parentLoopControlLimit` | `FASTFortranTExpression` | `limit` | `FASTFortranLoopControlExpression` | |
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|
| `variableDeclaratorOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTVariableDeclarator` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTFortranTWithArguments` | `argumentOwner` | `FASTFortranTExpression` | My arguments|
| `invoked` | `FASTFortranTInvocation` | `invokedIn` | `FASTFortranTNamedEntity` | The name of the behavioural invoked|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentDataStatement` | `FASTFortranTExpression` | `dataConstants` | `FASTFortranDataGroup` | |
| `parentGotoComputedStatement` | `FASTFortranTExpression` | `selectorExpression` | `FASTFortranGoToComputedStatement` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTInvocation,
	#instVars : [
		'#invoked => FMOne type: #FASTFortranTNamedEntity opposite: #invokedIn'
	],
	#traits : 'FASTFortranTExpression + FASTFortranTWithArguments',
	#classTraits : 'FASTFortranTExpression classTrait + FASTFortranTWithArguments classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTInvocation classSide >> annotation [

	<FMClass: #TInvocation super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTInvocation >> invoked [
	"Relation named: #invoked type: #FASTFortranTNamedEntity opposite: #invokedIn"

	<generated>
	<FMComment: 'The name of the behavioural invoked'>
	^ invoked
]

{ #category : #accessing }
FASTFortranTInvocation >> invoked: anObject [

	<generated>
	invoked := anObject
]

{ #category : #navigation }
FASTFortranTInvocation >> invokedGroup [
	<generated>
	<navigation: 'Invoked'>
	^ MooseSpecializedGroup with: self invoked
]
