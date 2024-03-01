"
I represent Fortran If (BLock) statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `elseStatementBlock` | `FASTFortranIfBlockStatement` | `parentIfBlock` | `FASTFortranTStatementBlock` | Statement block containing statements of else branch |
| `thenStatementBlock` | `FASTFortranIfBlockStatement` | `parentIfBlock` | `FASTFortranTStatementBlock` | Statement block containing statements of then branch |



"
Class {
	#name : #FASTFortranIfBlockStatement,
	#superclass : #FASTFortranConditionalStatement,
	#instVars : [
		'#thenStatementBlock => FMOne type: #FASTFortranTStatementBlock opposite: #parentIfBlock',
		'#elseStatementBlock => FMOne type: #FASTFortranTStatementBlock opposite: #parentIfBlock'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIfBlockStatement class >> annotation [

	<FMClass: #IfBlockStatement super: #FASTFortranConditionalStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> elseStatementBlock [
	"Relation named: #elseStatementBlock type: #FASTFortranTStatementBlock opposite: #parentIfBlock"

	<generated>
	<FMComment: 'Statement block containing statements of else branch '>
	^ elseStatementBlock
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> elseStatementBlock: anObject [

	<generated>
	elseStatementBlock := anObject
]

{ #category : #navigation }
FASTFortranIfBlockStatement >> elseStatementBlockGroup [
	<generated>
	<navigation: 'ElseStatementBlock'>
	^ MooseSpecializedGroup with: self elseStatementBlock
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> thenStatementBlock [
	"Relation named: #thenStatementBlock type: #FASTFortranTStatementBlock opposite: #parentIfBlock"

	<generated>
	<FMComment: 'Statement block containing statements of then branch '>
	^ thenStatementBlock
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> thenStatementBlock: anObject [

	<generated>
	thenStatementBlock := anObject
]

{ #category : #navigation }
FASTFortranIfBlockStatement >> thenStatementBlockGroup [
	<generated>
	<navigation: 'ThenStatementBlock'>
	^ MooseSpecializedGroup with: self thenStatementBlock
]
