Extension { #name : 'FASTFortranExternalFunctionDeclarationStatement' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranExternalFunctionDeclarationStatement >> accept: aVisitor [
	^ aVisitor visitFASTFortranExternalFunctionDeclarationStatement: self
]
