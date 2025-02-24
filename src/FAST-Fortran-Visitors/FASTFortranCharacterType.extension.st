Extension { #name : 'FASTFortranCharacterType' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranCharacterType >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranCharacterType: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranCharacterType >> name [ 

	^'character'
]
