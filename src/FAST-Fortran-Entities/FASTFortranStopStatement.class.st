"
I represent Fortran Stop statement
"
Class {
	#name : #FASTFortranStopStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTtFortranLabelledStatement',
	#classTraits : 'FASTFortranTtFortranLabelledStatement classTrait',
	#instVars : [
		'#displayArgument => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranStopStatement class >> annotation [

	<FMClass: #StopStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranStopStatement >> displayArgument [

	<FMProperty: #displayArgument type: #String>
	<generated>
	<FMComment: 'Optional. Displayed when the program stops. String of no more that 5 digits or a character constant'>
	^ displayArgument
]

{ #category : #accessing }
FASTFortranStopStatement >> displayArgument: anObject [
	<generated>
	displayArgument := anObject
]
