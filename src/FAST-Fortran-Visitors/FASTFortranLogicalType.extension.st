Extension { #name : 'FASTFortranLogicalType' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranLogicalType >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranLogicalType: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranLogicalType >> name [ 

	^'logical'
]
