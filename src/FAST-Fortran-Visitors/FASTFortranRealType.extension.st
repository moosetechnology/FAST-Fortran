Extension { #name : 'FASTFortranRealType' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranRealType >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranRealType: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranRealType >> name [ 

	^'real'
]
