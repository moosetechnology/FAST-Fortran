"
I represent a format description (eg. in Format or Print statement)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentFormatedStatement` | `FASTFortranTFormat` | `format` | `FASTFortranTWithFormat` | A format description in a Format/Print/Read/Write statement|
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranAbstractIOStatement` | |



"
Trait {
	#name : 'FASTFortranTFormat',
	#instVars : [
		'#parentFormatedStatement => FMOne type: #FASTFortranTWithFormat opposite: #format'
	],
	#traits : 'FASTFortranTIOParameter',
	#classTraits : 'FASTFortranTIOParameter classTrait',
	#category : 'FAST-Fortran-Entities-Traits',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTFortranTFormat classSide >> annotation [

	<FMClass: #TFormat super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranTFormat >> parentFormatedStatement [
	"Relation named: #parentFormatedStatement type: #FASTFortranTWithFormat opposite: #format"

	<generated>
	<FMComment: 'A format description in a Format/Print/Read/Write statement'>
	<container>
	<derived>
	^ parentFormatedStatement
]

{ #category : 'accessing' }
FASTFortranTFormat >> parentFormatedStatement: anObject [

	<generated>
	parentFormatedStatement := anObject
]

{ #category : 'navigation' }
FASTFortranTFormat >> parentFormatedStatementGroup [
	<generated>
	<navigation: 'ParentFormatedStatement'>
	^ MooseSpecializedGroup with: self parentFormatedStatement
]
