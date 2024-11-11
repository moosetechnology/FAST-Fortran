Extension { #name : 'FASTFortranIfBlockStatement' }

{ #category : '*FAST-Fortran-Analyses' }
FASTFortranIfBlockStatement >> exportForCFG [

	^'if (' , (FASTFortranExporterVisitor export: self condition) , ')'
]
