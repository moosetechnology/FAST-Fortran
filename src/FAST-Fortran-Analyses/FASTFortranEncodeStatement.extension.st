Extension { #name : #FASTFortranEncodeStatement }

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranEncodeStatement >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]
