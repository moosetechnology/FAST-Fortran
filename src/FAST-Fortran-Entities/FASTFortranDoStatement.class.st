"
I represent Fortran Do statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `labelReferences` | `FASTFortranTWithLabelReferences` | `referencer` | `FASTFortranLabelReference` | the label(s) referenced|
| `loopControl` | `FASTFortranTWithLoopControl` | `parentLoop` | `FASTFortranLoopControlExpression` | loop control|
| `statementBlock` | `FASTFortranDoStatement` | `parentDoStatement` | `FASTTStatementBlock` | Statement block containing statements of the do body |



"
Class {
	#name : #FASTFortranDoStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithLabelReferences + FASTFortranTWithLoopControl',
	#classTraits : 'FASTFortranTWithLabelReferences classTrait + FASTFortranTWithLoopControl classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDoStatement class >> annotation [

	<FMClass: #DoStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranDoStatement >> statementBlock [
	"Relation named: #statementBlock type: #FASTTStatementBlock opposite: #parentDoStatement"

	<generated>
	<FMComment: 'Statement block containing statements of the do body '>
	<FMProperty: #statementBlock type: #FASTTStatementBlock opposite: #parentDoStatement>
	^ self attributeAt: #statementBlock ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTFortranDoStatement >> statementBlock: anObject [

	<generated>
	(self attributeAt: #statementBlock ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self statementBlock.
		self attributeAt: #statementBlock put: anObject.
		otherSide parentDoStatement: nil ]
	ifNotNil: [ 
		self attributeAt: #statementBlock put: anObject.
		anObject parentDoStatement: self ]
]

{ #category : #navigation }
FASTFortranDoStatement >> statementBlockGroup [
	<generated>
	<navigation: 'StatementBlock'>
	^ MooseSpecializedGroup with: self statementBlock
]
