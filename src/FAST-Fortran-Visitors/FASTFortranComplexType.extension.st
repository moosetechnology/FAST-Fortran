Extension { #name : 'FASTFortranComplexType' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranComplexType >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranComplexType: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranComplexType >> name [ 

	^'complex'
]
