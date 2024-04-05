"
I represent an Asterisk Character Literal (Constant) that is often used as a format identifier

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `entryStatement` | `FASTFortranTEntryArgument` | `entryArguments` | `FASTFortranEntryStatement` | |
| `parentFormatedStatement` | `FASTFortranTFormat` | `format` | `FASTFortranTWithFormat` | A format description in a Format/Print/Read/Write statement|
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranAbstractIOStatement` | |



"
Class {
	#name : #FASTFortranAsterisk,
	#superclass : #FASTFortranIntegerLiteral,
	#traits : 'FASTFortranTEntryArgument + FASTFortranTFormat',
	#classTraits : 'FASTFortranTEntryArgument classTrait + FASTFortranTFormat classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAsterisk class >> annotation [

	<FMClass: #Asterisk super: #FASTFortranIntegerLiteral>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
