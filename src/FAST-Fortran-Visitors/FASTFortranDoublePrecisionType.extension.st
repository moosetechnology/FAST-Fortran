Extension { #name : 'FASTFortranDoublePrecisionType' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranDoublePrecisionType >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranDoublePrecisionType: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranDoublePrecisionType >> name [ 

	^'doublePrecision'
]
