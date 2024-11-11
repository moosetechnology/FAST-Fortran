Extension { #name : 'FASTFortranRewindStatement' }

{ #category : '*FAST-Fortran-Analyses' }
FASTFortranRewindStatement >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]
