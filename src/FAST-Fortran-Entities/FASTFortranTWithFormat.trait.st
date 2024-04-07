"
I represent a statement with a Format (PRINT or IOStatements)

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `format` | `FASTFortranTWithFormat` | `parentStatement` | `FASTFortranTFormat` | |



"
Trait {
	#name : #FASTFortranTWithFormat,
	#instVars : [
		'#format => FMOne type: #FASTFortranTFormat opposite: #parentStatement'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithFormat classSide >> annotation [

	<FMClass: #TWithFormat super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTWithFormat >> format [
	"Relation named: #format type: #FASTFortranTFormat opposite: #parentStatement"

	<generated>
	^ format
]

{ #category : #accessing }
FASTFortranTWithFormat >> format: anObject [

	<generated>
	format := anObject
]

{ #category : #navigation }
FASTFortranTWithFormat >> formatGroup [
	<generated>
	<navigation: 'Format'>
	^ MooseSpecializedGroup with: self format
]
