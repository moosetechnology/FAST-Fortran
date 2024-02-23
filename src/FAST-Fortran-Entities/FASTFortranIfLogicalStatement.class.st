"
The logical IF statement executes one single statement, or does not execute it, depending on the value of a logical expression.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `condition` | `FASTFortranTConditionalStatement` | `parentConditionalStatement` | `FASTTExpression` | Condition|
| `statement` | `FASTFortranIfLogicalStatement` | `parentIfStatement` | `FASTTStatement` | Statement of the logical if|



"
Class {
	#name : #FASTFortranIfLogicalStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTConditionalStatement',
	#classTraits : 'FASTFortranTConditionalStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIfLogicalStatement class >> annotation [

	<FMClass: #IfLogicalStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranIfLogicalStatement >> statement [
	"Relation named: #statement type: #FASTTStatement opposite: #parentIfStatement"

	<generated>
	<FMComment: 'Statement of the logical if'>
	<FMProperty: #statement type: #FASTTStatement opposite: #parentIfStatement>
	^ self attributeAt: #statement ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTFortranIfLogicalStatement >> statement: anObject [

	<generated>
	(self attributeAt: #statement ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self statement.
		self attributeAt: #statement put: anObject.
		otherSide parentIfStatement: nil ]
	ifNotNil: [ 
		self attributeAt: #statement put: anObject.
		anObject parentIfStatement: self ]
]

{ #category : #navigation }
FASTFortranIfLogicalStatement >> statementGroup [
	<generated>
	<navigation: 'Statement'>
	^ MooseSpecializedGroup with: self statement
]
