Extension { #name : 'FASTFortranIfBlockStatement' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfBlockStatement >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranIfBlockStatement: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfBlockStatement >> elseStatementBlock [
	"syntactic sugar"
 
	^self falseBranch
]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfBlockStatement >> elseStatementBlock: aFASTFortranStatementBlock [
	"syntactic sugar"
 
	self falseBranch: aFASTFortranStatementBlock 
]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfBlockStatement >> thenStatementBlock [
	"syntactic sugar"

	^self trueBranch
]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfBlockStatement >> thenStatementBlock: aFASTFortranStatementBlock [
	"syntactic sugar"

	self trueBranch: aFASTFortranStatementBlock 
]
