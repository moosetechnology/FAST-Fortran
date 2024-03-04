Extension { #name : #FASTFortranVariable }

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariable >> sameVariableAs: otherFASTFortranVariable [

	^self localDeclaration = otherFASTFortranVariable localDeclaration 
]

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariable >> ssaName [

	^self ssaVersion name

]

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariable >> ssaVersion [

	^self attributeAt: #ssaVersion ifAbsent: [ nil ]

]

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranVariable >> ssaVersion: aSSAVersion [

	self attributeAt: #ssaVersion put: aSSAVersion

]
