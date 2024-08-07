"
The logical IF statement executes one single statement, or does not execute it, depending on the value of a logical expression.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `statement` | `FASTFortranIfLogicalStatement` | `parentIfStatement` | `FASTFortranAbstractStatement` | Statement of the logical if|



"
Class {
	#name : 'FASTFortranIfLogicalStatement',
	#superclass : 'FASTFortranConditionalStatement',
	#instVars : [
		'#statement => FMOne type: #FASTFortranAbstractStatement opposite: #parentIfStatement'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranIfLogicalStatement class >> annotation [

	<FMClass: #IfLogicalStatement super: #FASTFortranConditionalStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranIfLogicalStatement >> statement [
	"Relation named: #statement type: #FASTFortranAbstractStatement opposite: #parentIfStatement"

	<generated>
	<FMComment: 'Statement of the logical if'>
	^ statement
]

{ #category : 'accessing' }
FASTFortranIfLogicalStatement >> statement: anObject [

	<generated>
	statement := anObject
]

{ #category : 'navigation' }
FASTFortranIfLogicalStatement >> statementGroup [
	<generated>
	<navigation: 'Statement'>
	^ MooseSpecializedGroup with: self statement
]
