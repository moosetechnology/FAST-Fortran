Class {
	#name : 'FASTFortranLocalResolverVisitor',
	#superclass : 'FASTFortranVisitor',
	#instVars : [
		'scoper'
	],
	#category : 'FAST-Fortran-Analyses-Resolver',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'Resolver'
}

{ #category : 'instance creation' }
FASTFortranLocalResolverVisitor class >> on: aFASTNode [

	^self new
		on: aFASTNode
]

{ #category : 'instance creation' }
FASTFortranLocalResolverVisitor >> on: aFASTFortranProgramUnit [

	scoper := FASTFortranLocalResolverScoping new.

	aFASTFortranProgramUnit accept: self.

	^aFASTFortranProgramUnit 
]

{ #category : 'visiting - expressions' }
FASTFortranLocalResolverVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [

	self visitFASTFortranVariable: aFASTFortranArrayVariable.
	aFASTFortranArrayVariable indices do: [ :indice |
		indice accept: self ]
]

{ #category : 'visiting - programUnits' }
FASTFortranLocalResolverVisitor >> visitFASTFortranProcedure: aFASTFortranProcedure [
	"overriden because we want to visit the parameters before visiting the statements
	 (with possible parameter declaration)"

	self visitFASTFortranTWithParameters: aFASTFortranProcedure.
	self visitFASTFortranSubprogram: aFASTFortranProcedure.
]

{ #category : 'visiting - expressions' }
FASTFortranLocalResolverVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [
	"reference to an identifier in the AST"

	self visitFASTFortranVariable: aFASTFortranScalarVariable
]

{ #category : 'visiting - statements' }
FASTFortranLocalResolverVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [

	"visit order is important to ensure declarations are visited before statements"
	(aFASTFortranStatementBlock statements sorted: [ :a :b |
		 a startPos < b startPos ]) do: [ :node | node accept: self ].

]

{ #category : 'visiting - expressions' }
FASTFortranLocalResolverVisitor >> visitFASTFortranVariable: aFASTFortranVariable [
	"reference to an identifier in the AST"

	self visitFASTIdentifierExpression: aFASTFortranVariable
]

{ #category : 'visiting - statements' }
FASTFortranLocalResolverVisitor >> visitFASTFortranVariableDeclarationStatement: aFASTFortranVariableDeclarationStatement [

	aFASTFortranVariableDeclarationStatement declarators do: [ :decl |
		decl accept: self ]
]

{ #category : 'visiting' }
FASTFortranLocalResolverVisitor >> visitFASTFortranVariableDeclarator: aFASTVariableDeclaration [
	"register a variable (structuralEntity) declaration into the current scope"

	scoper
		scopeAdd: aFASTVariableDeclaration name
		declaration: aFASTVariableDeclaration.

	aFASTVariableDeclaration localDeclaration: aFASTVariableDeclaration
]

{ #category : 'visiting - expressions' }
FASTFortranLocalResolverVisitor >> visitFASTIdentifierExpression: aFASTIdentifier [
	"reference to an identifier in the AST
	 - the identifier refers to a variable (structuralEntity)
	 - look for a declaration of this identifier in the hierarchy of scopes
	 - binds the reference (aFASTIdentifier) to this declaration"

	scoper bind: aFASTIdentifier toLocalDeclaration: aFASTIdentifier name
]

{ #category : 'generated' }
FASTFortranLocalResolverVisitor >> visitFASTTEntity: aFASTTEntity [
	"overriding to not do anything
	 because visiting children is already taken care of in each individual visit method"
]

{ #category : 'visiting - programUnits' }
FASTFortranLocalResolverVisitor >> visitParameter: aFASTFortranScalarVariable [
	"parameters are considered as a 'use' of the parameter-variable
	 this is because in Fortran the declaration is in the body of the sub-program"

	scoper
		scopeAdd: aFASTFortranScalarVariable name
		declaration: (FASTFortranParameterLocalDefinition new).

	scoper bind: aFASTFortranScalarVariable toLocalDeclaration: aFASTFortranScalarVariable name
]
