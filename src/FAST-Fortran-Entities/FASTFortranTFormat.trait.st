"
I represent a format description (eg. in Format or Print statement)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentFormatStatement` | `FASTFortranTFormat` | `format` | `FASTFortranPrintStatement` | |
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranAbstractIOStatement` | |



"
Trait {
	#name : #FASTFortranTFormat,
	#instVars : [
		'#parentFormatStatement => FMOne type: #FASTFortranPrintStatement opposite: #format'
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
FASTFortranTFormat >> parentFormatStatement [
	"Relation named: #parentFormatStatement type: #FASTFortranPrintStatement opposite: #format"

	<generated>
	<container>
	<derived>
	^ parentFormatStatement
]

{ #category : #accessing }
FASTFortranTFormat >> parentFormatStatement: anObject [

	<generated>
	parentFormatStatement := anObject
]

{ #category : #navigation }
FASTFortranTFormat >> parentFormatStatementGroup [
	<generated>
	<navigation: 'ParentFormatStatement'>
	^ MooseSpecializedGroup with: self parentFormatStatement
]
