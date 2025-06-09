Extension { #name : 'FASTFortranIfLogicalStatement' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfLogicalStatement >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranIfLogicalStatement: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfLogicalStatement >> falseBranch [
	"IfLogicalStatement has only a 'true' branch"

	^nil
]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfLogicalStatement >> falseBranch: aStatement [
	"IfLogicalStatement has only a 'true' branch"

	self shouldNotImplement 
]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfLogicalStatement >> statement [
	"IfLogicalStatement has only a 'true' branch"

	self mustHaveBranches: 1.
	^self trueBranch
]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfLogicalStatement >> statement: aStatement [
	"IfLogicalStatement has only a 'true' branch"

	self mustHaveBranches: 1.
	self trueBranch: aStatement
]
