Extension { #name : 'FASTFortranFieldAccess' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranFieldAccess >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranFieldAccess: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranFieldAccess >> isFieldAccess [

	^ true
]
