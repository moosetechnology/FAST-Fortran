Class {
	#name : #FASTFortranSSAVisitor,
	#superclass : #FASTFortranVisitor,
	#category : #'FAST-Fortran-Analyses-SSA'
}

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [

]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [

]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [

]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [

]

{ #category : #'visiting - programUnits' }
FASTFortranSSAVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [

	super visitFASTFortranProgramUnit: aFASTFortranProgramUnit
]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatement [

	super visitFASTFortranStatementBlock: aFASTFortranStatement.

]
