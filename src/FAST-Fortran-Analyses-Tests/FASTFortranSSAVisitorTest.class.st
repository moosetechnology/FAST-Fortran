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
FASTFortranSSAVisitorTest >> testDoLoopCreatesConditionalBlock [

	| loopStmt varAccess |
	"
	SUBROUTINE something()
	INTEGER x
	DO i=1, x, 1
	END DO	
	END
	"
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self doStatement: #(i 1 x 1)  statements: #()).

	self runVisitor.

	loopStmt := ssa statementBlock statements second.
	varAccess := loopStmt loopControl init variable.
	self assert: varAccess ssaName equals: 'i_1'.

	varAccess := loopStmt loopControl limit.
	self assert: varAccess ssaName equals: 'x_1'.

	self assert: varAccess localDeclaration activeVersion name equals: 'phi(x_1)'.
	self assert: varAccess localDeclaration newVersionNumber equals: 2

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testIfBlockAssignedAndUsedInThenOnly [
	"
	SUBROUTINE something()
	INTEGER x, y
	IF (bool) THEN
	  x = 5
	  y = x
	END IF
	END
	"

	| ifStmt varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x y)).
	self addStatement: (self
		ifBlock: #bool
		then: {
			self assignementStatement: #x value: 5 .
			self assignementStatement: #y value: #x
		}
		else: nil).

	self runVisitor.

	ifStmt := ssa statementBlock statements second.
	varAccess := ifStmt thenStatementBlock statements first variable.
	self assert: varAccess ssaName equals: 'x_1'.

	varAccess := ifStmt thenStatementBlock statements second expression.
	self assert: varAccess ssaName equals: 'x_1'.

	self assert: varAccess localDeclaration activeVersion name equals: 'phi(x_1)'.
	self assert: varAccess localDeclaration newVersionNumber equals: 2

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testIfBlockAssignedBeforeInElse [
	"
	SUBROUTINE something()
	INTEGER x
	x = 5
	IF (x) THEN
	ELSE
	  x = 6
	END IF
	END
	"

	| ifStmt varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self assignementStatement: #x value: 5).
	self addStatement: (self ifBlock: #x then: #() else: {self assignementStatement: #x value: 6}).

	self runVisitor.

	varAccess := ssa statementBlock statements second variable.
	self assert: varAccess ssaName equals: 'x_1'.

	ifStmt := ssa statementBlock statements third.
	varAccess := ifStmt elseStatementBlock statements first variable.
	self assert: varAccess ssaName equals: 'x_2'.

	self assert: varAccess localDeclaration activeVersion name equals: 'phi(x_1,x_2)'.
	self assert: varAccess localDeclaration newVersionNumber equals: 3

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testIfBlockAssignedBeforeInThen [
	"
	SUBROUTINE something()
	INTEGER x
	x = 5
	IF (x) THEN
	  x = 6
	END IF
	END
	"

	| ifStmt varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self assignementStatement: #x value: 5).
	self addStatement: (self ifBlock: #x then: {self assignementStatement: #x value: 6} else: nil).

	self runVisitor.

	varAccess := ssa statementBlock statements second variable.
	self assert: varAccess ssaName equals: 'x_1'.

	ifStmt := ssa statementBlock statements third.
	varAccess := ifStmt thenStatementBlock statements first variable.
	self assert: varAccess ssaName equals: 'x_2'.

	self assert: varAccess localDeclaration activeVersion name equals: 'phi(x_1,x_2)'.
	self assert: varAccess localDeclaration newVersionNumber equals: 3

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testIfBlockAssignedBeforeInThenInElse [
	"
	SUBROUTINE something()
	INTEGER x
	x = 5
	IF (x) THEN
	  x = 6
	ELSE
	  x = 7
	END IF
	END
	"

	| ifStmt varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self assignementStatement: #x value: 5).
	self addStatement: (self
		ifBlock: #x
		then: {self assignementStatement: #x value: 6}
		else: {self assignementStatement: #x value: 7} ).

	self runVisitor.

	varAccess := ssa statementBlock statements second variable.
	self assert: varAccess ssaName equals: 'x_1'.

	ifStmt := ssa statementBlock statements third.
	varAccess := ifStmt thenStatementBlock statements first variable.
	self assert: varAccess ssaName equals: 'x_2'.

	varAccess := ifStmt elseStatementBlock statements first variable.
	self assert: varAccess ssaName equals: 'x_3'.

	self assert: varAccess localDeclaration activeVersion name equals: 'phi(x_2,x_3)'.
	self assert: varAccess localDeclaration newVersionNumber equals: 4

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testIfBlockAssignedInElseOnly [
	"
	SUBROUTINE something()
	INTEGER x
	IF (bool) THEN
	ELSE
	  x = 5
	END IF
	END
	"

	| ifStmt varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self ifBlock: #bool then: #() else: {self assignementStatement: #x value: 5}).

	self runVisitor.

	ifStmt := ssa statementBlock statements second.
	varAccess := ifStmt elseStatementBlock statements first variable.
	self assert: varAccess ssaName equals: 'x_1'.

	self assert: varAccess localDeclaration activeVersion name equals: 'phi(x_1)'.
	self assert: varAccess localDeclaration newVersionNumber equals: 2

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testIfBlockAssignedInThenOnly [
	"
	SUBROUTINE something()
	INTEGER x
	IF (bool) THEN
	  x = 5
	END IF
	END
	"

	| ifStmt varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self ifBlock: #bool then: {self assignementStatement: #x value: 5} else: nil).

	self runVisitor.

	ifStmt := ssa statementBlock statements second.
	varAccess := ifStmt thenStatementBlock statements first variable.
	self assert: varAccess ssaName equals: 'x_1'.

	self assert: varAccess localDeclaration activeVersion name equals: 'phi(x_1)'.
	self assert: varAccess localDeclaration newVersionNumber equals: 2

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testIfBlockFourBranches [
	"
	SUBROUTINE something()
	INTEGER x, y, z
	IF (z) THEN
	  IF (y) THEN
	    x = 5
	  ELSE
	    x = 6
	  END IF
	ELSE
	  IF (y) THEN
	    x = 7
	  ELSE
	    x = 8
	  END IF
	END IF
	END
	"

	| ifStmt ifStmt2 varAccess |

	ifStmt := self
		ifBlock: #y
		then: {self assignementStatement: #x value: 5}
		else: {self assignementStatement: #x value: 6}.

	ifStmt2 := self
		ifBlock: #y
		then: {self assignementStatement: #x value: 7}
		else: {self assignementStatement: #x value: 8}.

	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x y z)).
	self addStatement: (self ifBlock: #z then: { ifStmt } else: { ifStmt2 }).

	self runVisitor.

	ifStmt := ssa statementBlock statements second thenStatementBlock statements first.
	varAccess := ifStmt thenStatementBlock statements first variable.
	self assert: varAccess ssaName equals: 'x_1'.
	varAccess := ifStmt elseStatementBlock statements first variable.
	self assert: varAccess ssaName equals: 'x_2'.

	ifStmt := ssa statementBlock statements second elseStatementBlock statements first.
	varAccess := ifStmt thenStatementBlock statements first variable.
	self assert: varAccess ssaName equals: 'x_3'.
	varAccess := ifStmt elseStatementBlock statements first variable.
	self assert: varAccess ssaName equals: 'x_4'.

	self assert: varAccess localDeclaration activeVersion name equals: 'phi(x_1,x_2,x_3,x_4)'.
	self assert: varAccess localDeclaration newVersionNumber equals: 5

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
FASTFortranSSAVisitorTest >> testIfLogicalAssignedBeforeAndInsideAndUsedAfter [
	"
	SUBROUTINE something()
	INTEGER x, y
	x = 5
	IF (bool) x = 6
	y = x
	END
	"

	| varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x y)).
	self addStatement: (self assignementStatement: #x value: 5).
	self addStatement: (self logicalIf: #x statement: (self assignementStatement: #x value: 6)).
	self addStatement: (self assignementStatement: #y value: #x).

	self runVisitor.

	varAccess := ssa statementBlock statements fourth expression.
	self assert: varAccess ssaName equals: 'phi(x_1,x_2)'.

	self assert: varAccess localDeclaration activeVersion name equals: 'phi(x_1,x_2)'.
	self assert: varAccess localDeclaration newVersionNumber equals: 3

]

{ #category : #tests }
FASTFortranSSAVisitorTest >> testIfLogicalAssignedInsideOnly [
	"
	SUBROUTINE something()
	INTEGER x
	IF (bool) x = 5
	END
	"

	| varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self logicalIf: #bool statement: (self assignementStatement: #x value: 5)).

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
FASTFortranSSAVisitorTest >> testUnAssigned [
	"
	SUBROUTINE something()
	INTEGER x
	if (x) print 5
	END
	"

	| varAccess |
	self subroutine: #something.
	self addStatement: (self declarationStatement: #integer variables: #(x)).
	self addStatement: (self logicalIf: #x statement: (self printStatement: #(5) )).

	self runVisitor.

	varAccess := ssa statementBlock statements second condition.

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

	varAccess := ssa statementBlock statements third expression.
	self assert: varAccess ssaName equals: 'x_1'.

	self
		deny:   ssa statementBlock statements second variable ssaVersion localDeclaration
		equals: ssa statementBlock statements third  variable ssaVersion localDeclaration
]
