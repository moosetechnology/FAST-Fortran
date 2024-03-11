Extension { #name : #FASTFortranCloseStatement }

{ #category : #'*FAST-Fortran-Analyses' }
FASTFortranCloseStatement >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]
