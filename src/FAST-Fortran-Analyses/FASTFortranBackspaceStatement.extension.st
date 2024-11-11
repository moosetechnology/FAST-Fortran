Extension { #name : 'FASTFortranBackspaceStatement' }

{ #category : '*FAST-Fortran-Analyses' }
FASTFortranBackspaceStatement >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]
