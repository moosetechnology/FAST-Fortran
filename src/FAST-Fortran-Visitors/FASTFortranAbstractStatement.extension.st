Extension { #name : 'FASTFortranAbstractStatement' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranAbstractStatement >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranAbstractStatement: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranAbstractStatement >> exportForCFG [
	"exporter puts a carriageReturn after each statement
	 CFG visualizer does not expect that, so we remove it"
	^super exportForCFG allButLast 
]
