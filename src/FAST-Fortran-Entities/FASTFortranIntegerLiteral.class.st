"
I represent Fortran Arithmetic Integer Literal (Constant)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentFormatedStatement` | `FASTFortranTFormat` | `format` | `FASTFortranTWithFormat` | A format description in a Format/Print/Read/Write statement|
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranAbstractIOStatement` | |
| `parentTypeSize` | `FASTFortranIntegerLiteral` | `size` | `FASTFortranType` | |



"
Class {
	#name : #FASTFortranIntegerLiteral,
	#superclass : #FASTFortranNumericalConstant,
	#traits : 'FASTFortranTFormat',
	#classTraits : 'FASTFortranTFormat classTrait',
	#instVars : [
		'#parentTypeSize => FMOne type: #FASTFortranType opposite: #size'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIntegerLiteral class >> annotation [

	<FMClass: #IntegerLiteral super: #FASTFortranNumericalConstant>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranIntegerLiteral >> parentTypeSize [
	"Relation named: #parentTypeSize type: #FASTFortranType opposite: #size"

	<generated>
	<container>
	<derived>
	^ parentTypeSize
]

{ #category : #accessing }
FASTFortranIntegerLiteral >> parentTypeSize: anObject [

	<generated>
	parentTypeSize := anObject
]

{ #category : #navigation }
FASTFortranIntegerLiteral >> parentTypeSizeGroup [
	<generated>
	<navigation: 'ParentTypeSize'>
	^ MooseSpecializedGroup with: self parentTypeSize
]
