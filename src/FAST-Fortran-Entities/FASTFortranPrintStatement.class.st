"
I represent Fortran Print statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|
| `format` | `FASTFortranPrintStatement` | `parentFormatStatement` | `FASTFortranTFormat` | |



"
Class {
	#name : #FASTFortranPrintStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTTWithArguments',
	#classTraits : 'FASTTWithArguments classTrait',
	#instVars : [
		'#format => FMOne type: #FASTFortranTFormat opposite: #parentFormatStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranPrintStatement class >> annotation [

	<FMClass: #PrintStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranPrintStatement >> format [
	"Relation named: #format type: #FASTFortranTFormat opposite: #parentFormatStatement"

	<generated>
	^ format
]

{ #category : #accessing }
FASTFortranPrintStatement >> format: anObject [

	<generated>
	format := anObject
]

{ #category : #navigation }
FASTFortranPrintStatement >> formatGroup [
	<generated>
	<navigation: 'Format'>
	^ MooseSpecializedGroup with: self format
]
