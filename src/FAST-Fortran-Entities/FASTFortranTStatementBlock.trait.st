"
A block of statements as ones in C-like langs with {}

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTFortranTStatementBlock` | `statementBlock` | `FASTFortranTBehaviouralEntity` | Behavioural entity containing the statement block.|
| `statementContainer` | `FASTFortranTStatement` | `statements` | `FASTFortranTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `statements` | `FASTFortranTStatementBlock` | `statementContainer` | `FASTFortranTStatement` | Statements enclosed in this block|


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
	#name : #FASTFortranTStatementBlock,
	#instVars : [
		'#fastBehaviouralParent => FMOne type: #FASTFortranTBehaviouralEntity opposite: #statementBlock',
		'#statements => FMMany type: #FASTFortranTStatement opposite: #statementContainer'
	],
	#traits : 'FASTFortranTStatement',
	#classTraits : 'FASTFortranTStatement classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTStatementBlock classSide >> annotation [

	<FMClass: #TStatementBlock super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranTStatementBlock >> addStatement: anObject [
	<generated>
	^ self statements add: anObject
]

{ #category : #accessing }
FASTFortranTStatementBlock >> fastBehaviouralParent [
	"Relation named: #fastBehaviouralParent type: #FASTFortranTBehaviouralEntity opposite: #statementBlock"

	<generated>
	<FMComment: 'Behavioural entity containing the statement block.'>
	<container>
	<derived>
	^ fastBehaviouralParent
]

{ #category : #accessing }
FASTFortranTStatementBlock >> fastBehaviouralParent: anObject [

	<generated>
	fastBehaviouralParent := anObject
]

{ #category : #navigation }
FASTFortranTStatementBlock >> fastBehaviouralParentGroup [
	<generated>
	<navigation: 'FastBehaviouralParent'>
	^ MooseSpecializedGroup with: self fastBehaviouralParent
]

{ #category : #testing }
FASTFortranTStatementBlock >> isEmpty [

	^statements isEmpty
]

{ #category : #accessing }
FASTFortranTStatementBlock >> statements [
	"Relation named: #statements type: #FASTFortranTStatement opposite: #statementContainer"

	<generated>
	<FMComment: 'Statements enclosed in this block'>
	<derived>
	^ statements
]

{ #category : #accessing }
FASTFortranTStatementBlock >> statements: anObject [

	<generated>
	statements value: anObject
]

{ #category : #navigation }
FASTFortranTStatementBlock >> statementsGroup [
	<generated>
	<navigation: 'Statements'>
	^ MooseSpecializedGroup withAll: self statements asSet
]
