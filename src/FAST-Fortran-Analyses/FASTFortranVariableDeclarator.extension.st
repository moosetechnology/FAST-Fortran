Extension { #name : #FASTFortranVariableDeclarator }

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariableDeclarator >> activeVersion [

	^self attributeAt: #activeVersion ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariableDeclarator >> activeVersion: aSSAVersion [

	^self attributeAt: #activeVersion put: aSSAVersion
]
