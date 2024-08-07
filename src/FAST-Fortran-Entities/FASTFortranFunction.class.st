"
I represent a Fortran Function

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `returnType` | `FASTFortranFunction` | `typedFunctions` | `FASTFortranType` | |



"
Class {
	#name : 'FASTFortranFunction',
	#superclass : 'FASTFortranProcedure',
	#instVars : [
		'#returnType => FMOne type: #FASTFortranType opposite: #typedFunctions'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranFunction class >> annotation [

	<FMClass: #Function super: #FASTFortranProcedure>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranFunction >> returnType [
	"Relation named: #returnType type: #FASTFortranType opposite: #typedFunctions"

	<generated>
	^ returnType
]

{ #category : 'accessing' }
FASTFortranFunction >> returnType: anObject [

	<generated>
	returnType := anObject
]

{ #category : 'navigation' }
FASTFortranFunction >> returnTypeGroup [
	<generated>
	<navigation: 'ReturnType'>
	^ MooseSpecializedGroup with: self returnType
]
