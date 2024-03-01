"
I represent Fortran Do statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `labelReferences` | `FASTFortranTWithLabelReferences` | `referencer` | `FASTFortranLabelReference` | the label(s) referenced|
| `loopControl` | `FASTFortranTWithLoopControl` | `parentLoop` | `FASTFortranLoopControlExpression` | loop control|
| `statementBlock` | `FASTFortranDoStatement` | `parentDoStatement` | `FASTFortranStatementBlock` | Statement block containing statements of the do body |



"
Class {
	#name : #FASTFortranDoStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithLabelReferences + FASTFortranTWithLoopControl',
	#classTraits : 'FASTFortranTWithLabelReferences classTrait + FASTFortranTWithLoopControl classTrait',
	#instVars : [
		'#statementBlock => FMOne type: #FASTFortranStatementBlock opposite: #parentDoStatement'
	],
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
	"Relation named: #statementBlock type: #FASTFortranStatementBlock opposite: #parentDoStatement"

	<generated>
	<FMComment: 'Statement block containing statements of the do body '>
	^ statementBlock
]

{ #category : #accessing }
FASTFortranDoStatement >> statementBlock: anObject [

	<generated>
	statementBlock := anObject
]

{ #category : #navigation }
FASTFortranDoStatement >> statementBlockGroup [
	<generated>
	<navigation: 'StatementBlock'>
	^ MooseSpecializedGroup with: self statementBlock
]
