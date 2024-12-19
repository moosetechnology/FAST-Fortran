Extension { #name : 'FASTFortranIOParameter' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIOParameter >> exportForCFG [

	^FASTFortranExporterVisitor export: self
]
