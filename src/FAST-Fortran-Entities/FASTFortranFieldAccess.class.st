"
I represent an access to pointer.field in Esope (therefore an expression)

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `field` | `FASTFortranFieldAccess` | `fieldIn` | `FASTFortranVariable` | |
| `pointer` | `FASTFortranFieldAccess` | `pointerIn` | `FASTFortranVariable` | |



"
Class {
	#name : 'FASTFortranFieldAccess',
	#superclass : 'FASTFortranVariable',
	#instVars : [
		'#pointer => FMOne type: #FASTFortranVariable opposite: #pointerIn',
		'#field => FMOne type: #FASTFortranVariable opposite: #fieldIn'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranFieldAccess class >> annotation [

	<FMClass: #FieldAccess super: #FASTFortranVariable>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranFieldAccess >> field [
	"Relation named: #field type: #FASTFortranVariable opposite: #fieldIn"

	<generated>
	^ field
]

{ #category : 'accessing' }
FASTFortranFieldAccess >> field: anObject [

	<generated>
	field := anObject
]

{ #category : 'navigation' }
FASTFortranFieldAccess >> fieldGroup [
	<generated>
	<navigation: 'Field'>
	^ MooseSpecializedGroup with: self field
]

{ #category : 'accessing' }
FASTFortranFieldAccess >> pointer [
	"Relation named: #pointer type: #FASTFortranVariable opposite: #pointerIn"

	<generated>
	^ pointer
]

{ #category : 'accessing' }
FASTFortranFieldAccess >> pointer: anObject [

	<generated>
	pointer := anObject
]

{ #category : 'navigation' }
FASTFortranFieldAccess >> pointerGroup [
	<generated>
	<navigation: 'Pointer'>
	^ MooseSpecializedGroup with: self pointer
]
