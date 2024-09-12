"
I represent Fortran Arithmetic Integer Literal (Constant)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentFormatedStatement` | `FASTFortran2kTFormat` | `format` | `FASTFortran2kTWithFormat` | A format description in a Format/Print/Read/Write statement|
| `parentIOStatement` | `FASTFortran2kTIOParameter` | `ioParameters` | `FASTFortran2kAbstractIOStatement` | |
| `parentTypeSize` | `FASTFortran2kIntegerLiteral` | `size` | `FASTFortran2kType` | |



"
Class {
	#name : 'FASTFortran2kIntegerLiteral',
	#superclass : 'FASTFortran2kNumericalConstant',
	#traits : 'FASTFortran2kTFormat',
	#classTraits : 'FASTFortran2kTFormat classTrait',
	#instVars : [
		'#parentTypeSize => FMOne type: #FASTFortran2kType opposite: #size'
	],
	#category : 'FAST-Fortran2k-Entities-Entities',
	#package : 'FAST-Fortran2k-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortran2kIntegerLiteral class >> annotation [

	<FMClass: #IntegerLiteral super: #FASTFortran2kNumericalConstant>
	<package: #'FAST-Fortran2k-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortran2kIntegerLiteral >> parentTypeSize [
	"Relation named: #parentTypeSize type: #FASTFortran2kType opposite: #size"

	<generated>
	<container>
	<derived>
	^ parentTypeSize
]

{ #category : 'accessing' }
FASTFortran2kIntegerLiteral >> parentTypeSize: anObject [

	<generated>
	parentTypeSize := anObject
]

{ #category : 'navigation' }
FASTFortran2kIntegerLiteral >> parentTypeSizeGroup [
	<generated>
	<navigation: 'ParentTypeSize'>
	^ MooseSpecializedGroup with: self parentTypeSize
]
