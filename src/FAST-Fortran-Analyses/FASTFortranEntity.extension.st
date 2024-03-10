Extension { #name : #FASTFortranEntity }

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranEntity >> isImplicitDeclaration [

	^false
]

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranEntity >> newVersionNumber [

	^self activeVersion
		ifNil: [ 1 ]
		ifNotNil: [ :active | active version + 1 ]

]
