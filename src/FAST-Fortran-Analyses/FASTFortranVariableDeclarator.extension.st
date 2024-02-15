Extension { #name : #FASTFortranVariableDeclarator }

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariableDeclarator >> activeVersion [

	^self attributeAt: #activeVersion ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariableDeclarator >> activeVersion: aVersion [

	^self attributeAt: #activeVersion put: aVersion
]

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariableDeclarator >> lastVersionNumber [

	^self attributeAt: #version ifAbsent: [ 0 ].

]

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariableDeclarator >> lastVersionNumber: aNumber [

	^self attributeAt: #version put: aNumber

]

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariableDeclarator >> newVersionNumber [

	| n |
	n := self lastVersionNumber + 1.
	self lastVersionNumber: n.

	^n
	
]
