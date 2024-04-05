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

{ #category : #testing }
FASTFortranTStatementBlock >> isEmpty [

	^statements isEmpty
]
