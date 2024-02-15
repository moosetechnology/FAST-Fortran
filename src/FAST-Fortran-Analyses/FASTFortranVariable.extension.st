Extension { #name : #FASTFortranVariable }

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariable >> activeVersion [

	self name: self localDeclaration activeVersion
]

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariable >> activeVersion: aVersion [

	^self localDeclaration activeVersion: aVersion
]

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariable >> newVersion [

	self name: (self name , '_' , (self localDeclaration newVersionNumber asString)).
	self localDeclaration activeVersion: self name
]
