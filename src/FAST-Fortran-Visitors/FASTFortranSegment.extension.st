Extension { #name : 'FASTFortranSegment' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranSegment >> accept: aVisitor [

	^ aVisitor visitFASTFortranSegment: self
]
