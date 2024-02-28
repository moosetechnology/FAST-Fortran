"
I am the abstract superclass of all IO-statements (READ, WRITE, CLOSE, ENCODE...)

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `ioParameters` | `FASTFortranAbstractIOStatement` | `parentIOStatement` | `FASTFortranTIOParameter` | IO-Parameters of an IO-statement (READ, WRITE...)|



"
Class {
	#name : #FASTFortranAbstractIOStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
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
