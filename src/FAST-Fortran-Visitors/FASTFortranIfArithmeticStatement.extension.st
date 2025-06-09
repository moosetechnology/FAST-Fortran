Extension { #name : 'FASTFortranIfArithmeticStatement' }

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfArithmeticStatement >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTFortranIfArithmeticStatement: self.

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfArithmeticStatement >> negativeBranch [
	"syntactic sugar"

	self mustHaveBranches: 3.
	^branches at: 1
]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfArithmeticStatement >> negativeBranch: aStatement [
	"syntactic sugar"

	self mustHaveBranches: 3.
	(branches at: 1) ifNotNil: [ :oldValue | oldValue parentBranchStatement: nil ].
	branches at: 1 put: aStatement.
	aStatement ifNotNil: [
		aStatement unsafeSet: #parentBranchStatement value: self ]

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfArithmeticStatement >> nullBranch [
	"syntactic sugar"

	self mustHaveBranches: 3.
	^branches at: 2
]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfArithmeticStatement >> nullBranch: aStatement [
	"syntactic sugar"

	self mustHaveBranches: 3.
	(branches at: 2) ifNotNil: [ :oldValue | oldValue parentBranchStatement: nil ].
	branches at: 2 put: aStatement.
	aStatement ifNotNil: [
		aStatement unsafeSet: #parentBranchStatement value: self ]

]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfArithmeticStatement >> positiveBranch [
	"syntactic sugar"

	self mustHaveBranches: 3.
	^branches at: 3
]

{ #category : '*FAST-Fortran-Visitors' }
FASTFortranIfArithmeticStatement >> positiveBranch: aStatement [
	"syntactic sugar"

	self mustHaveBranches: 3.
	(branches at: 3) ifNotNil: [ :oldValue | oldValue parentBranchStatement: nil ].
	branches at: 3 put: aStatement.
	aStatement ifNotNil: [
		aStatement unsafeSet: #parentBranchStatement value: self ]

]
