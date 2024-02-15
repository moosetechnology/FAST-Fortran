Class {
	#name : #FASTFortranSSAVisitor,
	#superclass : #FASTFortranVisitor,
	#category : #'FAST-Fortran-Analyses-SSA'
}

{ #category : #visiting }
FASTFortranSSAVisitor class >> visit: anAST [

	^self new
		visit: anAST 
]

{ #category : #api }
FASTFortranSSAVisitor >> visit: anAST [

	| copy |
	copy := FASTFortranCopyVisitor visit: anAST.
	copy accept: FASTFortranLocalResolverVisitor new.
	copy accept: self.
	^copy
]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [

	^self visitFASTFortranVariable: aFASTFortranArrayVariable
]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement [

	aFASTFortranAssignmentStatement variable newVersion.
	aFASTFortranAssignmentStatement expression accept: self.
]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [

	^super visitFASTFortranDoStatement: aFASTFortranDoStatement

]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [

	^super visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement

]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [

	^super visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement

]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [

	^super visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement

]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [

	^self visitFASTFortranVariable: aFASTFortranScalarVariable
]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [

	self visitFASTFortranTStatementBlock: aFASTFortranStatementBlock.

]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranVariable: aFASTFortranVariable [

	aFASTFortranVariable activeVersion
]
