Extension { #name : #FASTFortranExternalProcedure }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranExternalProcedure >> accept: aVisitor [
	^ aVisitor visitFASTFortranExternalProcedure: self
]
