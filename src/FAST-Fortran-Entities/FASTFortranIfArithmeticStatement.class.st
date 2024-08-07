"
I represent Fortran If (Arithmetic) statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `equalLabel` | `FASTFortranIfArithmeticStatement` | `parentIfArithmeticEqualBranch` | `FASTFortranLabelReference` | |
| `greaterLabel` | `FASTFortranIfArithmeticStatement` | `parentIfArithmeticMoreBranch` | `FASTFortranLabelReference` | |
| `lessLabel` | `FASTFortranIfArithmeticStatement` | `parentIfArithmeticLessBranch` | `FASTFortranLabelReference` | |



"
Class {
	#name : 'FASTFortranIfArithmeticStatement',
	#superclass : 'FASTFortranConditionalStatement',
	#instVars : [
		'#lessLabel => FMOne type: #FASTFortranLabelReference opposite: #parentIfArithmeticLessBranch',
		'#equalLabel => FMOne type: #FASTFortranLabelReference opposite: #parentIfArithmeticEqualBranch',
		'#greaterLabel => FMOne type: #FASTFortranLabelReference opposite: #parentIfArithmeticMoreBranch'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranIfArithmeticStatement class >> annotation [

	<FMClass: #IfArithmeticStatement super: #FASTFortranConditionalStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> equalLabel [
	"Relation named: #equalLabel type: #FASTFortranLabelReference opposite: #parentIfArithmeticEqualBranch"

	<generated>
	^ equalLabel
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> equalLabel: anObject [

	<generated>
	equalLabel := anObject
]

{ #category : 'navigation' }
FASTFortranIfArithmeticStatement >> equalLabelGroup [
	<generated>
	<navigation: 'EqualLabel'>
	^ MooseSpecializedGroup with: self equalLabel
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> greaterLabel [
	"Relation named: #greaterLabel type: #FASTFortranLabelReference opposite: #parentIfArithmeticMoreBranch"

	<generated>
	^ greaterLabel
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> greaterLabel: anObject [

	<generated>
	greaterLabel := anObject
]

{ #category : 'navigation' }
FASTFortranIfArithmeticStatement >> greaterLabelGroup [
	<generated>
	<navigation: 'GreaterLabel'>
	^ MooseSpecializedGroup with: self greaterLabel
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> lessLabel [
	"Relation named: #lessLabel type: #FASTFortranLabelReference opposite: #parentIfArithmeticLessBranch"

	<generated>
	^ lessLabel
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> lessLabel: anObject [

	<generated>
	lessLabel := anObject
]

{ #category : 'navigation' }
FASTFortranIfArithmeticStatement >> lessLabelGroup [
	<generated>
	<navigation: 'LessLabel'>
	^ MooseSpecializedGroup with: self lessLabel
]
