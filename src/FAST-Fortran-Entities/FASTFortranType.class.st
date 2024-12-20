"
I represent Fortran Type statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentDeclaration` | `FASTFortranType` | `declaredType` | `FASTFortranTDeclaredType` | Parent declaration|
| `parentImplicitRule` | `FASTFortranType` | `type` | `FASTFortranImplicitTypingRule` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `size` | `FASTFortranType` | `parentTypeSize` | `FASTFortranAbstractExpression` | a data size in bytes|



"
Class {
	#name : 'FASTFortranType',
	#superclass : 'FASTFortranEntity',
	#instVars : [
		'#parentDeclaration => FMOne type: #FASTFortranTDeclaredType opposite: #declaredType',
		'#parentImplicitRule => FMOne type: #FASTFortranImplicitTypingRule opposite: #type',
		'#size => FMOne type: #FASTFortranAbstractExpression opposite: #parentTypeSize'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranType class >> annotation [

	<FMClass: #Type super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranType >> parentDeclaration [
	"Relation named: #parentDeclaration type: #FASTFortranTDeclaredType opposite: #declaredType"

	<generated>
	<FMComment: 'Parent declaration'>
	<container>
	<derived>
	^ parentDeclaration
]

{ #category : 'accessing' }
FASTFortranType >> parentDeclaration: anObject [

	<generated>
	parentDeclaration := anObject
]

{ #category : 'navigation' }
FASTFortranType >> parentDeclarationGroup [
	<generated>
	<navigation: 'ParentDeclaration'>
	^ MooseSpecializedGroup with: self parentDeclaration
]

{ #category : 'accessing' }
FASTFortranType >> parentImplicitRule [
	"Relation named: #parentImplicitRule type: #FASTFortranImplicitTypingRule opposite: #type"

	<generated>
	<container>
	<derived>
	^ parentImplicitRule
]

{ #category : 'accessing' }
FASTFortranType >> parentImplicitRule: anObject [

	<generated>
	parentImplicitRule := anObject
]

{ #category : 'navigation' }
FASTFortranType >> parentImplicitRuleGroup [
	<generated>
	<navigation: 'ParentImplicitRule'>
	^ MooseSpecializedGroup with: self parentImplicitRule
]

{ #category : 'accessing' }
FASTFortranType >> size [
	"Relation named: #size type: #FASTFortranAbstractExpression opposite: #parentTypeSize"

	<generated>
	<FMComment: 'a data size in bytes'>
	^ size
]

{ #category : 'accessing' }
FASTFortranType >> size: anObject [

	<generated>
	size := anObject
]

{ #category : 'navigation' }
FASTFortranType >> sizeGroup [
	<generated>
	<navigation: 'Size'>
	^ MooseSpecializedGroup with: self size
]
