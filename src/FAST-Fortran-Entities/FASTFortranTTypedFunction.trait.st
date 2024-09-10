"
I represent a function entity which is typed

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `returnType` | `FASTFortranTTypedFunction` | `typedFunctions` | `FASTFortranType` | |



"
Trait {
	#name : 'FASTFortranTTypedFunction',
	#instVars : [
		'#returnType => FMOne type: #FASTFortranType opposite: #typedFunctions'
	],
	#category : 'FAST-Fortran-Entities-Traits',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTFortranTTypedFunction classSide >> annotation [

	<FMClass: #TTypedFunction super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranTTypedFunction >> returnType [
	"Relation named: #returnType type: #FASTFortranType opposite: #typedFunctions"

	<generated>
	^ returnType
]

{ #category : 'accessing' }
FASTFortranTTypedFunction >> returnType: anObject [

	<generated>
	returnType := anObject
]

{ #category : 'navigation' }
FASTFortranTTypedFunction >> returnTypeGroup [
	<generated>
	<navigation: 'ReturnType'>
	^ MooseSpecializedGroup with: self returnType
]
