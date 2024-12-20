Extension { #name : 'FASTFortranIOParameter' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIOParameter >> accept: aVisitor [
	^ aVisitor visitFASTFortranIOParameter: self
]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIOParameter >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]