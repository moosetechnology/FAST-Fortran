Extension { #name : #FASTFortranReadStatement }

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranReadStatement >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]
