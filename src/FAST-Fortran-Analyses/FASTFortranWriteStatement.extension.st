Extension { #name : #FASTFortranWriteStatement }

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranWriteStatement >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]
