Extension { #name : 'FASTFortranEntity' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranEntity >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranEntity: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranEntity >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]
