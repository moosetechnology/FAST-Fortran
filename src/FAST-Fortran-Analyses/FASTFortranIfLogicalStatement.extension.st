Extension { #name : 'FASTFortranIfLogicalStatement' }

{ #category : '*FAST-Fortran-Analyses' }
FASTFortranIfLogicalStatement >> exportForCFG [

	^'if (' , (FASTFortranExporterVisitor export: self condition) , ')'
]
