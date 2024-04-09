"
I represent a format description (eg. in Format or Print statement)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranAbstractIOStatement` | |
| `parentStatement` | `FASTFortranTFormat` | `format` | `FASTFortranAbstractIOStatement` | |
| `parentStatement` | `FASTFortranTFormat` | `format` | `FASTFortranTWithFormat` | Formatted statement (PRINT or IOStatement)|



"
Trait {
	#name : #FASTFortranTFormat,
	#instVars : [
		'#parentStatement => FMOne type: #FASTFortranAbstractIOStatement opposite: #format'
	],
	#traits : 'FASTFortranTIOParameter',
	#classTraits : 'FASTFortranTIOParameter classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTFormat classSide >> annotation [

	<FMClass: #TFormat super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTFormat >> parentStatement [
	"Relation named: #parentStatement type: #FASTFortranAbstractIOStatement opposite: #format"

	<generated>
	<container>
	<derived>
	^ parentStatement
]

{ #category : #accessing }
FASTFortranTFormat >> parentStatement: anObject [

	<generated>
	parentStatement := anObject
]

{ #category : #navigation }
FASTFortranTFormat >> parentStatementGroup [
	<generated>
	<navigation: 'ParentStatement'>
	^ MooseSpecializedGroup with: self parentStatement
]
