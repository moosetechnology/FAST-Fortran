"
A FASTFortranLocalResolverVisitorTest is a test class for testing the behavior of FASTFortranLocalResolverVisitor
"
Class {
	#name : 'FASTFortranLocalResolverVisitorTest',
	#superclass : 'FASTFortranAbstractVisitorTest',
	#category : 'FAST-Fortran-Analyses-Tests-Resolver',
	#package : 'FAST-Fortran-Analyses-Tests',
	#tag : 'Resolver'
}

{ #category : 'running' }
FASTFortranLocalResolverVisitorTest >> newVisitor [

	^FASTFortranLocalResolverVisitor new
]

{ #category : 'tests' }
FASTFortranLocalResolverVisitorTest >> testIndiceInArray [
	"
	SUBROUTINE something()
	x(i) = 5
	END
	"

	| varAccess body |
	varAccess := FASTFortranArrayVariable new
		name: #x ;
		indices: { self scalarVariable: #i }.
	self subroutine: #something.
	self addStatement: (FASTFortranAssignmentStatement new
		variable: varAccess ;
		expression: (self makeSimpleExpression: 6) ).

	visitor on: ast.

	body := ast statementBlock statements.

	varAccess := body first variable.
	self assert: varAccess localDeclaration isImplicitDeclaration.
	self assert: varAccess localDeclaration name equals: 'x'.

	varAccess := varAccess indices anyOne.
	self assert: varAccess localDeclaration isImplicitDeclaration.
	self assert: varAccess localDeclaration name equals: 'i'.

]

{ #category : 'tests' }
FASTFortranLocalResolverVisitorTest >> testLinkToDeclaration [
	"
	SUBROUTINE something()
	INTEGER x
	x = 5
	END
	"

	| varAccess body |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self assignementStatement: #x value: 5).

	visitor on: ast.

	body := ast statementBlock statements.
	varAccess := body second variable.
	self deny: varAccess localDeclaration isImplicitDeclaration.
	self assert: varAccess localDeclaration name equals: 'x'.
	self assert: varAccess localDeclaration equals: body first declarators first
]

{ #category : 'tests' }
FASTFortranLocalResolverVisitorTest >> testLinkToImplicitDeclaration [
	"
	SUBROUTINE something()
	INTEGER x
	y = 5
	x = y
	END
	"

	| body varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self assignementStatement: #y value: 5).
	self addStatement: (self assignementStatement: #x value: #y).

	visitor on: ast.

	body := ast statementBlock statements.
	varAccess := body third expression.
	self assert: varAccess localDeclaration isImplicitDeclaration.
	self assert: varAccess localDeclaration name equals: 'y'.
	self assert: varAccess localDeclaration firstUse equals: body second variable
]
