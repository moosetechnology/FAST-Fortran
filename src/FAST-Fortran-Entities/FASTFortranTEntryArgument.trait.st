"
I represent an argument in an entry statement: it can be a variable name, array name, formal procedure name, or an asterisk

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `entryStatement` | `FASTFortranTEntryArgument` | `entryArguments` | `FASTFortranEntryStatement` | |



"
Trait {
	#name : 'FASTFortranTEntryArgument',
	#instVars : [
		'#entryStatement => FMOne type: #FASTFortranEntryStatement opposite: #entryArguments'
	],
	#category : 'FAST-Fortran-Entities-Traits',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTFortranTEntryArgument classSide >> annotation [

	<FMClass: #TEntryArgument super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranTEntryArgument >> entryStatement [
	"Relation named: #entryStatement type: #FASTFortranEntryStatement opposite: #entryArguments"

	<generated>
	<container>
	^ entryStatement
]

{ #category : 'accessing' }
FASTFortranTEntryArgument >> entryStatement: anObject [

	<generated>
	entryStatement := anObject
]

{ #category : 'navigation' }
FASTFortranTEntryArgument >> entryStatementGroup [
	<generated>
	<navigation: 'EntryStatement'>
	^ MooseSpecializedGroup with: self entryStatement
]
