"
I represent an Asterisk Character Literal (Constant) that is often used as a format identifier
"
Class {
	#name : #FASTFortranAsterisk,
	#superclass : #FASTFortranCharacterLiteral,
	#traits : 'FASTFortranTFormatIdentifier + FASTFortranTParameter',
	#classTraits : 'FASTFortranTFormatIdentifier classTrait + FASTFortranTParameter classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAsterisk class >> annotation [

	<FMClass: #Asterisk super: #FASTFortranCharacterLiteral>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]