"
I represent Fortran Format statement

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `formatDescription` | `String` | nil | The description of the format|

"
Class {
	#name : #FASTFortranFormatStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#formatDescription => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranFormatStatement class >> annotation [

	<FMClass: #FormatStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranFormatStatement >> formatDescription [

	<FMProperty: #formatDescription type: #String>
	<generated>
	<FMComment: 'The description of the format'>
	^ formatDescription
]

{ #category : #accessing }
FASTFortranFormatStatement >> formatDescription: anObject [
	<generated>
	formatDescription := anObject
]
