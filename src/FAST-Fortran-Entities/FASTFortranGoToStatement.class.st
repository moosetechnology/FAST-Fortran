"
I represent Fortran Go To (unconditional) statement

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `label` | `String` | nil | |

"
Class {
	#name : 'FASTFortranGoToStatement',
	#superclass : 'FASTFortranEntity',
	#traits : 'FASTTGotoStatement',
	#classTraits : 'FASTTGotoStatement classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranGoToStatement class >> annotation [

	<FMClass: #GoToStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
