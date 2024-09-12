"
Im a derived type component

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `derivedType` | `FASTFortran2kDerivedTypeComponent` | `derivedTypeComponents` | `FASTFortran2kDerivedType` | |



"
Class {
	#name : 'FASTFortran2kDerivedTypeComponent',
	#superclass : 'FASTFortran2kVariableDeclarationStatement',
	#instVars : [
		'#derivedType => FMOne type: #FASTFortran2kDerivedType opposite: #derivedTypeComponents'
	],
	#category : 'FAST-Fortran2k-Entities-Entities',
	#package : 'FAST-Fortran2k-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortran2kDerivedTypeComponent class >> annotation [

	<FMClass: #DerivedTypeComponent super: #FASTFortran2kVariableDeclarationStatement>
	<package: #'FAST-Fortran2k-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortran2kDerivedTypeComponent >> derivedType [
	"Relation named: #derivedType type: #FASTFortran2kDerivedType opposite: #derivedTypeComponents"

	<generated>
	<container>
	^ derivedType
]

{ #category : 'accessing' }
FASTFortran2kDerivedTypeComponent >> derivedType: anObject [

	<generated>
	derivedType := anObject
]

{ #category : 'navigation' }
FASTFortran2kDerivedTypeComponent >> derivedTypeGroup [
	<generated>
	<navigation: 'DerivedType'>
	^ MooseSpecializedGroup with: self derivedType
]
