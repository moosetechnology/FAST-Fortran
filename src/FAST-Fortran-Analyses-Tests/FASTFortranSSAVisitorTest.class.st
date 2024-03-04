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
FASTFortranSSAVisitorTest >> testIfLogicalAssignedBeforeAndAfter [
	"
	SUBROUTINE something()
	INTEGER x, y
	x = 5
	IF (x) y = x
	x = 6
	END
	"

	| varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x y)).
	self addStatement: (self assignementStatement: #x value: 5).
	self addStatement: (self logicalIf: #x statement: (self assignementStatement: #y value: #x)).
	self addStatement: (self assignementStatement: #x value: 5).

	self runVisitor.

	varAccess := ssa statementBlock statements second variable.
	self assert: varAccess ssaName equals: 'x_1'.

	varAccess := ssa statementBlock statements third condition.
	self assert: varAccess ssaName equals: 'x_1'.

	varAccess := ssa statementBlock statements fourth variable.
	self assert: varAccess ssaName equals: 'x_2'.

	self assert: varAccess localDeclaration activeVersion name equals: 'x_2'.
	self assert: varAccess localDeclaration newVersionNumber equals: 3

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testIfLogicalAssignedBeforeAndInside [
	"
	SUBROUTINE something()
	INTEGER x
	x = 5
	IF (bool) x = 6
	END
	"

	| varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self assignementStatement: #x value: 5).
	self addStatement: (self logicalIf: #x statement: (self assignementStatement: #x value: 6)).

	self runVisitor.

	varAccess := ssa statementBlock statements second variable.
	self assert: varAccess ssaName equals: 'x_1'.

	varAccess := ssa statementBlock statements third condition.
	self assert: varAccess ssaName equals: 'x_1'.

	varAccess := ssa statementBlock statements third statement variable.
	self assert: varAccess ssaName equals: 'x_2'.

	self assert: varAccess localDeclaration activeVersion name equals: 'phi(x_1,x_2)'.
	self assert: varAccess localDeclaration newVersionNumber equals: 3

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testIfLogicalAssignedInsideOnly [
	"
	SUBROUTINE something()
	INTEGER x
	IF (x) x = 5
	END
	"

	| varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self logicalIf: #x statement: (self assignementStatement: #x value: 5)).

	self runVisitor.

	varAccess := ssa statementBlock statements second statement variable.
	self assert: varAccess ssaName equals: 'x_1'.

	self assert: varAccess localDeclaration activeVersion name equals: 'phi(x_1)'.
	self assert: varAccess localDeclaration newVersionNumber equals: 2

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testIfLogicalNotAssignedInside [
	"
	SUBROUTINE something()
	INTEGER x, y
	x = 5
	IF (x) y = x
	END
	"

	| varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x y)).
	self addStatement: (self assignementStatement: #x value: 5).
	self addStatement: (self logicalIf: #x statement: (self assignementStatement: #y value: #x)).

	self runVisitor.

	varAccess := ssa statementBlock statements second variable.
	self assert: varAccess ssaName equals: 'x_1'.

	varAccess := ssa statementBlock statements third condition.
	self assert: varAccess ssaName equals: 'x_1'.

	self assert: varAccess localDeclaration activeVersion name equals: 'x_1'.
	self assert: varAccess localDeclaration newVersionNumber equals: 2

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testSingleAssignement [
	"
	SUBROUTINE something()
	INTEGER x
	x = 5
	END
	"

	| varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self assignementStatement: #x value: 5).

	self runVisitor.

	varAccess := ssa statementBlock statements second variable.

	self assert: varAccess ssaVersion class equals: FASTFortranSSAVariableVersion.
	self assert: varAccess ssaVersion version equals: 1.
	self assert: varAccess ssaName equals: 'x_1'.

	self assert: varAccess localDeclaration newVersionNumber equals: 2

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

	| varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self assignementStatement: #x value: 5).
	self addStatement: (self assignementStatement: #x value: 6).

	self runVisitor.

	varAccess := ssa statementBlock statements second variable.	
	self assert: varAccess ssaName equals: 'x_1'.

	varAccess := ssa statementBlock statements third variable.
	self assert: varAccess ssaName equals: 'x_2'.
	
	self assert: varAccess localDeclaration newVersionNumber equals: 3.
	self
		assert: ssa statementBlock statements second variable ssaVersion localDeclaration
		equals: ssa statementBlock statements third  variable ssaVersion localDeclaration
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

	| varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x y)).
	self addStatement: (self assignementStatement: #x value: 5).
	self addStatement: (self assignementStatement: #y value: #x).

	self runVisitor.

	varAccess := ssa statementBlock statements second variable.	
	self assert: varAccess ssaName equals: 'x_1'.

	varAccess := ssa statementBlock statements third variable.
	self assert: varAccess ssaName equals: 'y_1'.

	self
		deny:   ssa statementBlock statements second variable ssaVersion localDeclaration
		equals: ssa statementBlock statements third  variable ssaVersion localDeclaration
]
