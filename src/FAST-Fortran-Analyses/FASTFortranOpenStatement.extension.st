Extension { #name : 'FASTFortranOpenStatement' }

{ #category : '*FAST-Fortran-Analyses' }
FASTFortranOpenStatement >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]
