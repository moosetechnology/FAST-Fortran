"
I represent Fortran If (BLock) statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `condition` | `FASTFortranTConditionalStatement` | `parentConditionalStatement` | `FASTTExpression` | Condition|
| `elseStatementBlock` | `FASTFortranIfBlockStatement` | `parentIfBlock` | `FASTTStatementBlock` | Statement block containing statements of else branch |
| `thenStatementBlock` | `FASTFortranIfBlockStatement` | `parentIfBlock` | `FASTTStatementBlock` | Statement block containing statements of then branch |



"
Class {
	#name : #FASTFortranIfBlockStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTConditionalStatement',
	#classTraits : 'FASTFortranTConditionalStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIfBlockStatement class >> annotation [

	<FMClass: #IfBlockStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> elseStatementBlock [
	"Relation named: #elseStatementBlock type: #FASTTStatementBlock opposite: #parentIfBlock"

	<generated>
	<FMComment: 'Statement block containing statements of else branch '>
	<FMProperty: #elseStatementBlock type: #FASTTStatementBlock opposite: #parentIfBlock>
	^ self attributeAt: #elseStatementBlock ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> elseStatementBlock: anObject [

	<generated>
	(self attributeAt: #elseStatementBlock ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self elseStatementBlock.
		self attributeAt: #elseStatementBlock put: anObject.
		otherSide parentIfBlock: nil ]
	ifNotNil: [ 
		self attributeAt: #elseStatementBlock put: anObject.
		anObject parentIfBlock: self ]
]

{ #category : #navigation }
FASTFortranIfBlockStatement >> elseStatementBlockGroup [
	<generated>
	<navigation: 'ElseStatementBlock'>
	^ MooseSpecializedGroup with: self elseStatementBlock
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> thenStatementBlock [
	"Relation named: #thenStatementBlock type: #FASTTStatementBlock opposite: #parentIfBlock"

	<generated>
	<FMComment: 'Statement block containing statements of then branch '>
	<FMProperty: #thenStatementBlock type: #FASTTStatementBlock opposite: #parentIfBlock>
	^ self attributeAt: #thenStatementBlock ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> thenStatementBlock: anObject [

	<generated>
	(self attributeAt: #thenStatementBlock ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self thenStatementBlock.
		self attributeAt: #thenStatementBlock put: anObject.
		otherSide parentIfBlock: nil ]
	ifNotNil: [ 
		self attributeAt: #thenStatementBlock put: anObject.
		anObject parentIfBlock: self ]
]

{ #category : #navigation }
FASTFortranIfBlockStatement >> thenStatementBlockGroup [
	<generated>
	<navigation: 'ThenStatementBlock'>
	^ MooseSpecializedGroup with: self thenStatementBlock
]
