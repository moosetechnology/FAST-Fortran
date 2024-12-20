"
I am the declared type of a function or variable

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaredType` | `FASTFortranTDeclaredType` | `parentDeclaration` | `FASTFortranType` | type|



"
Trait {
	#name : 'FASTFortranTDeclaredType',
	#instVars : [
		'#declaredType => FMOne type: #FASTFortranType opposite: #parentDeclaration'
	],
	#category : 'FAST-Fortran-Entities-Traits',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTFortranTDeclaredType classSide >> annotation [

	<FMClass: #TDeclaredType super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranTDeclaredType >> declaredType [
	"Relation named: #declaredType type: #FASTFortranType opposite: #parentDeclaration"

	<generated>
	<FMComment: 'type'>
	^ declaredType
]

{ #category : 'accessing' }
FASTFortranTDeclaredType >> declaredType: anObject [

	<generated>
	declaredType := anObject
]

{ #category : 'navigation' }
FASTFortranTDeclaredType >> declaredTypeGroup [
	<generated>
	<navigation: 'DeclaredType'>
	^ MooseSpecializedGroup with: self declaredType
]
