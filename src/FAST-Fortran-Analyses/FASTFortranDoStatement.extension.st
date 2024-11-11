Extension { #name : 'FASTFortranDoStatement' }

{ #category : '*FAST-Fortran-Analyses' }
FASTFortranDoStatement >> exportForCFG [

	^'do ' , (FASTFortranExporterVisitor export: self loopControl)
]
