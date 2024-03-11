Extension { #name : #FASTFortranDecodeStatement }

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranDecodeStatement >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]
