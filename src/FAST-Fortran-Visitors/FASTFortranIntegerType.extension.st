Extension { #name : 'FASTFortranIntegerType' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIntegerType >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranIntegerType: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIntegerType >> name [ 

	^'integer'
]
