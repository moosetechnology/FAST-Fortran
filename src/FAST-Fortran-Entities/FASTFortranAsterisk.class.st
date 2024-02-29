"
I represent an Asterisk Character Literal (Constant) that is often used as a format identifier

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `entryStatement` | `FASTFortranTEntryStatement` | `entryArguments` | `FASTFortranEntryStatement` | |
| `parentFormatedStatement` | `FASTFortranTFormat` | `format` | `FASTFortranTWithFormat` | A format description in a Format/Print/Read/Write statement|
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranAbstractIOStatement` | |



"
Class {
	#name : #FASTFortranAsterisk,
	#superclass : #FASTFortranNumericalConstant,
	#traits : 'FASTFortranTEntryStatement + FASTFortranTFormat',
	#classTraits : 'FASTFortranTEntryStatement classTrait + FASTFortranTFormat classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAsterisk class >> annotation [

	<FMClass: #Asterisk super: #FASTFortranNumericalConstant>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
