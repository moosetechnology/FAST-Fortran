"
I represent Fortran Type statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentDeclaration` | `FASTFortranType` | `type` | `FASTFortranVariableDeclarationStatement` | Parent declaration|
| `parentImplicitRule` | `FASTFortranType` | `type` | `FASTFortranImplicitTypingRule` | |
| `typedFunctions` | `FASTFortranType` | `returnType` | `FASTFortranFunction` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `size` | `FASTFortranType` | `parentTypeSize` | `FASTTNumericalLiteral` | a data size in bytes|



"
Class {
	#name : #FASTFortranType,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#parentDeclaration => FMOne type: #FASTFortranVariableDeclarationStatement opposite: #type',
		'#typedFunctions => FMOne type: #FASTFortranFunction opposite: #returnType',
		'#parentImplicitRule => FMOne type: #FASTFortranImplicitTypingRule opposite: #type'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranType class >> annotation [

	<FMClass: #Type super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranType >> parentDeclaration [
	"Relation named: #parentDeclaration type: #FASTFortranVariableDeclarationStatement opposite: #type"

	<generated>
	<FMComment: 'Parent declaration'>
	<container>
	<derived>
	^ parentDeclaration
]

{ #category : #accessing }
FASTFortranType >> parentDeclaration: anObject [

	<generated>
	parentDeclaration := anObject
]

{ #category : #navigation }
FASTFortranType >> parentDeclarationGroup [
	<generated>
	<navigation: 'ParentDeclaration'>
	^ MooseSpecializedGroup with: self parentDeclaration
]

{ #category : #accessing }
FASTFortranType >> parentImplicitRule [
	"Relation named: #parentImplicitRule type: #FASTFortranImplicitTypingRule opposite: #type"

	<generated>
	<container>
	<derived>
	^ parentImplicitRule
]

{ #category : #accessing }
FASTFortranType >> parentImplicitRule: anObject [

	<generated>
	parentImplicitRule := anObject
]

{ #category : #navigation }
FASTFortranType >> parentImplicitRuleGroup [
	<generated>
	<navigation: 'ParentImplicitRule'>
	^ MooseSpecializedGroup with: self parentImplicitRule
]

{ #category : #accessing }
FASTFortranType >> size [
	"Relation named: #size type: #FASTTNumericalLiteral opposite: #parentTypeSize"

	<generated>
	<FMComment: 'a data size in bytes'>
	<FMProperty: #size type: #FASTTNumericalLiteral opposite: #parentTypeSize>
	^ self attributeAt: #size ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTFortranType >> size: anObject [

	<generated>
	(self attributeAt: #size ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self size.
		self attributeAt: #size put: anObject.
		otherSide parentTypeSize: nil ]
	ifNotNil: [ 
		self attributeAt: #size put: anObject.
		anObject parentTypeSize: self ]
]

{ #category : #navigation }
FASTFortranType >> sizeGroup [
	<generated>
	<navigation: 'Size'>
	^ MooseSpecializedGroup with: self size
]

{ #category : #accessing }
FASTFortranType >> typedFunctions [
	"Relation named: #typedFunctions type: #FASTFortranFunction opposite: #returnType"

	<generated>
	<container>
	<derived>
	^ typedFunctions
]

{ #category : #accessing }
FASTFortranType >> typedFunctions: anObject [

	<generated>
	typedFunctions := anObject
]

{ #category : #navigation }
FASTFortranType >> typedFunctionsGroup [
	<generated>
	<navigation: 'TypedFunctions'>
	^ MooseSpecializedGroup with: self typedFunctions
]
