Class {
	#name : 'CountSubtreeVisitor',
	#superclass : 'FASTFortranVisitor',
	#category : 'FAST-Fortran-Visitors-Visitor',
	#package : 'FAST-Fortran-Visitors',
	#tag : 'Visitor'
}

{ #category : 'visiting' }
CountSubtreeVisitor >> visit: aCollection [ 
	
	
	^ (aCollection select: [ :elem | elem isProgramUnit ]) sum: [: pu | self visitFASTFortranProgramUnit: pu]
		
]

{ #category : 'visiting - programUnits' }
CountSubtreeVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [

	^ 1 + (aFASTFortranProgramUnit accept: self).
]

{ #category : 'visiting - statements' }
CountSubtreeVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [
	
	^ 1 + (aFASTFortranStatementBlock statements sum: [: st | st accept: self ])
	
]

{ #category : 'visiting - programUnits' }
CountSubtreeVisitor >> visitFASTFortranSubroutine: aFASTFortranSubroutine [

	^ (self visitFASTFortranStatementBlock: (aFASTFortranSubroutine statementBlock)) +	
	aFASTFortranSubroutine parameters size.
	
]
