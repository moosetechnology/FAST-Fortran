"
I represent Fortran External statement
"
Class {
	#name : #FASTFortranExternalStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTtFortranLabelledStatement',
	#classTraits : 'FASTFortranTtFortranLabelledStatement classTrait',
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranExternalStatement class >> annotation [

	<FMClass: #ExternalStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranExternalStatement >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Name of external procedure, dummy procedure, or block data routine'>
	^ name
]

{ #category : #accessing }
FASTFortranExternalStatement >> name: anObject [
	<generated>
	name := anObject
]
