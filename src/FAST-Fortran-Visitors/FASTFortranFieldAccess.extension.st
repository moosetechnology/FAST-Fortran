Extension { #name : 'FASTFortranFieldAccess' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranFieldAccess >> accept: aVisitor [

	^aVisitor visitFASTFortranFieldAccess: self
]
