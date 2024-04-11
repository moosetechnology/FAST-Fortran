"
I am the abstract superclass of all IO-statements (READ, WRITE, CLOSE, ENCODE...)

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `format` | `FASTFortranAbstractIOStatement` | `parentStatement` | `FASTFortranTFormat` | |
| `format` | `FASTFortranTWithFormat` | `parentStatement` | `FASTFortranTFormat` | |
| `ioParameters` | `FASTFortranAbstractIOStatement` | `parentIOStatement` | `FASTFortranTIOParameter` | IO-Parameters of an IO-statement (READ, WRITE...)|



"
Class {
	#name : #FASTFortranAbstractIOStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithFormat',
	#classTraits : 'FASTFortranTWithFormat classTrait',
	#instVars : [
		'#format => FMOne type: #FASTFortranTFormat opposite: #parentStatement',
		'#ioParameters => FMMany type: #FASTFortranTIOParameter opposite: #parentIOStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAbstractIOStatement class >> annotation [

	<FMClass: #AbstractIOStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranAbstractIOStatement >> addIoParameter: anObject [
	<generated>
	^ self ioParameters add: anObject
]

{ #category : #accessing }
FASTFortranAbstractIOStatement >> format [
	"Relation named: #format type: #FASTFortranTFormat opposite: #parentStatement"

	<generated>
	^ format
]

{ #category : #accessing }
FASTFortranAbstractIOStatement >> format: anObject [

	<generated>
	format := anObject
]

{ #category : #navigation }
FASTFortranAbstractIOStatement >> formatGroup [
	<generated>
	<navigation: 'Format'>
	^ MooseSpecializedGroup with: self format
]

{ #category : #accessing }
FASTFortranAbstractIOStatement >> ioParameters [
	"Relation named: #ioParameters type: #FASTFortranTIOParameter opposite: #parentIOStatement"

	<generated>
	<FMComment: 'IO-Parameters of an IO-statement (READ, WRITE...)'>
	<derived>
	^ ioParameters
]

{ #category : #accessing }
FASTFortranAbstractIOStatement >> ioParameters: anObject [

	<generated>
	ioParameters value: anObject
]

{ #category : #navigation }
FASTFortranAbstractIOStatement >> ioParametersGroup [
	<generated>
	<navigation: 'IoParameters'>
	^ MooseSpecializedGroup withAll: self ioParameters asSet
]
