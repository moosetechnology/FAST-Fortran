"
A FASTFortranSSAVisitorTest is a test class for testing the behavior of FASTFortranSSAVisitor
"
Class {
	#name : #FASTFortranSSAVisitorTest,
	#superclass : #FASTFortranAbstractVisitorTest,
	#instVars : [
		'ssa'
	],
	#category : #'FAST-Fortran-Analyses-Tests-SSA'
}

{ #category : #running }
FASTFortranSSAVisitorTest >> newVisitor [

	^FASTFortranSSAVisitor new
]

{ #category : #running }
FASTFortranSSAVisitorTest >> runVisitor [

	^ssa := visitor visit: ast
]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testFirstAssignement [
	"
	SUBROUTINE something()
	INTEGER x
	x = 5
	END
	"

	| varAccessBlock |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self assignementStatement: #x value: 5).

	self runVisitor.

	varAccessBlock := [ :aNode | aNode statementBlock statements second variable].
	self
		assert: (varAccessBlock value: ssa) name
		equals: 'x_1'.
	self
		assert: (varAccessBlock value: ssa) localDeclaration variable
		equals: (varAccessBlock value: ast) name.

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testVariableAssignedTwice [
	"
	SUBROUTINE something()
	INTEGER x
	x = 5
	x = 6
	END
	"

	| varAccessBlock |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self assignementStatement: #x value: 5).
	self addStatement: (self assignementStatement: #x value: 6).

	self runVisitor.

	"first assignement"
	varAccessBlock := [ :aNode | aNode statementBlock statements second variable].
	self
		assert: (varAccessBlock value: ssa) name
		equals: 'x_1'.
	self
		assert: (varAccessBlock value: ssa) localDeclaration variable
		equals: (varAccessBlock value: ast) name.

	"second assignement"
	varAccessBlock := [ :aNode | aNode statementBlock statements third variable].
	self
		assert: (varAccessBlock value: ssa) name
		equals: 'x_2'.
	self
		assert: (varAccessBlock value: ssa) localDeclaration variable
		equals: (varAccessBlock value: ast) name.

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testVariableReassigned [
	"
	SUBROUTINE something()
	INTEGER x, y
	x = 5
	y = x
	END
	"

	| varAccessBlock |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x y)).
	self addStatement: (self assignementStatement: #x value: 5).
	self addStatement: (self assignementStatement: #y value: #x).

	self runVisitor.

	"x assigned (to y)"
	varAccessBlock := [ :aNode | aNode statementBlock statements third expression].
	self
		assert: (varAccessBlock value: ssa) name
		equals: 'x_1'.
	self
		assert: (varAccessBlock value: ssa) localDeclaration variable
		equals: (varAccessBlock value: ast) name.

]
