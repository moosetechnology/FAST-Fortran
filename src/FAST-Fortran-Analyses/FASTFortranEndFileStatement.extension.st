Extension { #name : #FASTFortranEndFileStatement }

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranEndFileStatement >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]
