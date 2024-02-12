Class {
	#name : #FASTFortranSSAVisitor,
	#superclass : #FASTFortranVisitor,
	#category : #'FAST-Fortran-Analyses-SSA'
}

{ #category : #private }
FASTFortranSSAVisitor >> currentVariableVersion: aFASTFortranVariable [

	^aFASTFortranVariable
]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [

	^self visitFASTFortranVariable: aFASTFortranArrayVariable
]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [

	^super visitFASTFortranDoStatement: aFASTFortranDoStatement

]

{ #category : #visiting }
FASTFortranSSAVisitor >> visitFASTFortranEntity: aFASTFortranEntity [

	^aFASTFortranEntity copy
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

{ #category : #'visiting - programUnits' }
FASTFortranSSAVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [

	^aFASTFortranProgramUnit copy
		parameters: (aFASTFortranProgramUnit parameters accept: self) ;
		body: (aFASTFortranProgramUnit body accept: self) ;
		yourself
]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [

	^self visitFASTFortranVariable: aFASTFortranScalarVariable
]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatement [

	super visitFASTFortranStatementBlock: aFASTFortranStatement.

]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranVariable: aFASTFortranVariable [

	^self currentVariableVersion: aFASTFortranVariable
]
