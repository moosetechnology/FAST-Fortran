"
Represents a generic behavioural entity which has parameters and local variables, as well as statements. 

Can represent a SmalltalkBlock, or a JavaLambda
Subclassed for NamedBehavioural as methods/functions

Has parameters , and a body (StatementBlock).
Local variables are intended to be stored in the local entities of the body

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parameters` | `FASTFortranTWithParameters` | `parameterOwner` | `FASTFortranTVariableEntity` | My parameters|
| `statementBlock` | `FASTFortranTBehaviouralEntity` | `fastBehaviouralParent` | `FASTFortranTStatementBlock` | Statements block of the behavioural entity|


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
	#name : #FASTFortranTBehaviouralEntity,
	#instVars : [
		'#statementBlock => FMOne type: #FASTFortranTStatementBlock opposite: #fastBehaviouralParent'
	],
	#traits : 'FASTFortranTScopableEntity + FASTFortranTWithParameters',
	#classTraits : 'FASTFortranTScopableEntity classTrait + FASTFortranTWithParameters classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTBehaviouralEntity classSide >> annotation [

	<FMClass: #TBehaviouralEntity super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTBehaviouralEntity >> statementBlock [
	"Relation named: #statementBlock type: #FASTFortranTStatementBlock opposite: #fastBehaviouralParent"

	<generated>
	<FMComment: 'Statements block of the behavioural entity'>
	^ statementBlock
]

{ #category : #accessing }
FASTFortranTBehaviouralEntity >> statementBlock: anObject [

	<generated>
	statementBlock := anObject
]

{ #category : #navigation }
FASTFortranTBehaviouralEntity >> statementBlockGroup [
	<generated>
	<navigation: 'StatementBlock'>
	^ MooseSpecializedGroup with: self statementBlock
]
