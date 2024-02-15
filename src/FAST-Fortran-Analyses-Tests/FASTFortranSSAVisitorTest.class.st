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
FASTFortranSSAVisitorTest >> testSequencialAssignements [
	"
	SUBROUTINE something()
	INTEGER x, y
	x = 5
	y = x
	END
	"

	| varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x y)).
	self addStatement: (self assignementStatement: #x value: 5).
	self addStatement: (self assignementStatement: #y value: #x).

	self runVisitor.

	"x assignement"
	varAccess := [ :aNode | aNode statementBlock statements second variable].
	self assert: (varAccess value: ssa) name equals: 'x_1'.
	self assert: (varAccess value: ssa) localDeclaration variable equals: (varAccess value: ast) name.

	"y assignement"
	varAccess := [ :aNode | aNode statementBlock statements third variable].
	self assert: (varAccess value: ssa) name equals: 'y_1'.
	self assert: (varAccess value: ssa) localDeclaration variable equals: (varAccess value: ast) name.

	"x assigned (to y)"
	varAccess := [ :aNode | aNode statementBlock statements third expression].
	self assert: (varAccess value: ssa) name equals: 'x_1'.
	self assert: (varAccess value: ssa) localDeclaration variable equals: (varAccess value: ast) name.

]
