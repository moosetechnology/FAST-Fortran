Extension { #name : 'FASTFortranGoToComputedStatement' }

{ #category : '*FAST-Fortran-Analyses' }
FASTFortranGoToComputedStatement >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]
