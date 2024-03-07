Class {
	#name : #FASTFortranLocalResolverVisitor,
	#superclass : #FASTFortranVisitor,
	#instVars : [
		'scoper'
	],
	#category : #'FAST-Fortran-Analyses-Resolver'
}

{ #category : #'instance creation' }
FASTFortranLocalResolverVisitor class >> on: aFASTNode [

	^self new
		on: aFASTNode
]

{ #category : #'instance creation' }
FASTFortranLocalResolverVisitor >> on: aFASTFortranProgramUnit [

	scoper := FASTFortranLocalResolverScoping new.

	aFASTFortranProgramUnit accept: self.

	^aFASTFortranProgramUnit 
]

{ #category : #'visiting - expressions' }
FASTFortranLocalResolverVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [

	self visitFASTFortranVariable: aFASTFortranArrayVariable
]

{ #category : #'visiting - programUnits' }
FASTFortranLocalResolverVisitor >> visitFASTFortranProcedure: aFASTFortranProcedure [
	"do not call #visitFASTFortranProgramUnit:"

	self visitFASTFortranSubprogram: aFASTFortranProcedure
]

{ #category : #'visiting - expressions' }
FASTFortranLocalResolverVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [
	"reference to an identifier in the AST"

	self visitFASTFortranVariable: aFASTFortranScalarVariable
]

{ #category : #'visiting - statements' }
FASTFortranLocalResolverVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [
	scoper pushScope.

	"visit order is important to ensure declarations are visited before statements"
	(aFASTFortranStatementBlock statements sorted: [:a :b | a startPos < b startPos])
		do: [ :node | node accept: self ].

	^scoper popScope
]

{ #category : #'visiting - traits' }
FASTFortranLocalResolverVisitor >> visitFASTFortranTBehaviouralEntity: aFASTFortranTBehaviouralEntity [

	aFASTFortranTBehaviouralEntity statementBlock accept: self

]

{ #category : #'visiting - expressions' }
FASTFortranLocalResolverVisitor >> visitFASTFortranVariable: aFASTFortranVariable [
	"reference to an identifier in the AST"

	self visitFASTIdentifierExpression: aFASTFortranVariable
]

{ #category : #'visiting - statements' }
FASTFortranLocalResolverVisitor >> visitFASTFortranVariableDeclarationStatement: aFASTFortranVariableDeclarationStatement [

	aFASTFortranVariableDeclarationStatement declarators do: [:decl | decl accept: self]
]

{ #category : #visiting }
FASTFortranLocalResolverVisitor >> visitFASTFortranVariableDeclarator: aFASTVariableDeclaration [
	"register a variable (structuralEntity) declaration into the current scope"

	scoper
		scopeAdd: aFASTVariableDeclaration variable
		declaration: aFASTVariableDeclaration.

	aFASTVariableDeclaration localDeclaration: aFASTVariableDeclaration.

]

{ #category : #'visiting - expressions' }
FASTFortranLocalResolverVisitor >> visitFASTIdentifierExpression: aFASTIdentifier [
	"reference to an identifier in the AST
	 - the identifier refers to a variable (structuralEntity)
	 - look for a definition of this identifier in the hierarchy of scopes
	 - if not found, creates a NonLocalDeclaration for it
	 - binds this reference to the declaration"

	scoper bind: aFASTIdentifier toLocalDeclaration: aFASTIdentifier name

]
