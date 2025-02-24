Extension { #name : 'FASTFortranByteType' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranByteType >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranByteType: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranByteType >> name [ 

	^'byte'
]
