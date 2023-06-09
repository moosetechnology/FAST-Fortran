Class {
	#name : #FASTFortranJsonVisitor,
	#superclass : #FortranAbstractJsonVisitor,
	#instVars : [
		'lineSizes'
	],
	#category : #'FAST-Fortran-JSON-Visitor-Visitor'
}

{ #category : #initialization }
FASTFortranJsonVisitor >> initLineSizes: fortranSource [

	lineSizes := fortranSource lines collect: #size
]

{ #category : #initialization }
FASTFortranJsonVisitor >> initialize [

	super initialize.

	lineSizes := #(  )
]

{ #category : #private }
FASTFortranJsonVisitor >> newEntity: aFASTFortranClass atPosition: aPoint [

	| node |
	node := aFASTFortranClass new.
	self set: node startEnd: aPoint.
	^ node
]

{ #category : #private }
FASTFortranJsonVisitor >> pointToPosition: lineColumn [

	| position |
	position := 0.
	1 to: lineColumn x - 1 do: [ :i |
	position := position + (lineSizes at: i) + 1 ].
	^ position + lineColumn y
]

{ #category : #private }
FASTFortranJsonVisitor >> set: aFASTFortranNode startEnd: aPoint [

	aFASTFortranNode
		startPos: (self pointToPosition: aPoint first);
		endPos: (self pointToPosition: aPoint second) - 1
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitAddition: anAdditionOperatorNode [

	^ FASTFortranBinaryExpression new
		  operator: (super visitAddition: anAdditionOperatorNode);
		  yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitArgument: anArgumentNode [
	"used for argument in subprogram calls and parameter in subprogram definition"

	| data |
	data := super visitArgument: anArgumentNode.

	data isCollection ifFalse: [ ^ data ].
	data size = 2 ifTrue: [ ^ data second ].
	^ data
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitAssign_expression: anAssignExpressionNode [
	"The assignment statement assigns a value to a variable, substring, array element, record, or record field"

	| data |
	data := super visitAssign_expression: anAssignExpressionNode.
	^ (self
		   newEntity: FASTFortranAssignmentStatement
		   atPosition: data first)
		  variable: data second;
		  expression: data third;
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitBinary: aBinaryExpressionNode [

	| data expr |
	data := super visitBinary: aBinaryExpressionNode.

	expr := data third.
	self set: expr startEnd: data first.
	expr
		left: data second;
		right: data fourth.
	^ expr
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitBlock_data: aBlockDataNode [

	| data |
	data := super visitBlock_data: aBlockDataNode.

	^ (self newEntity: FASTFortranBlockData atPosition: data first)
		  name: data second;
		  statementBlock: (FASTFortranStatementBlock new statements: data third);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitCallStatement: aCallNode [
	"The CALL statement branches to the specified subroutine, executes the subroutine, and returns to the calling program after finishing the subroutine.

CALL sub [([ar[, ar]])] where sub is a name of the subroutine to be called, ar is an actual argument to be passed to the subroutine "

	| data |
	data := super visitCallStatement: aCallNode.

	^ (self newEntity: FASTFortranCallStatement atPosition: data first)
		  name: data second;
		  arguments: data third;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitCharacterBaseType: aString [

	^ FASTFortranCharacterType new yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitComment: aCommentNode [

	^ FASTFortranComment new content:
		  (super visitComment: aCommentNode) second
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitCommonStatement: aCommonStatementNode [
	"creates common statement which defines a block of main memory storage so that different program units can share the same data without using arguments.

COMMON [/[cb]/] nlist [[,]/[cb]/ nlist] where 
cb: Common block name,
nlist: List of variable names, array names, and array declarators  "

	| data |
	data := super visitCommonStatement: aCommonStatementNode.
	^ self newEntity: FASTFortranCommonStatement atPosition: data first
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitConditions: aConditionList [
	"a list of {condition . thenPart}, each element being an elseif of the preceding element"

	| firstIf elseIf data |
	data := super visitConditions: aConditionList.

	data do: [ :each |
		| newIf |

		newIf := FASTFortranIfBlockStatement new
			         condition: each first;
			         thenStatementBlock: (FASTFortranStatementBlock new statements: each second);
			         yourself.

		firstIf
			ifNil: [ firstIf := newIf ]
			ifNotNil: [ elseIf elseStatementBlock: ( FASTFortranStatementBlock new statements: {newIf} ) ].
		elseIf := newIf ].

	^ firstIf
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitContinueStatement: aContinueStatementNode [

	| data |
	data := super visitContinueStatement: aContinueStatementNode.

	^ self newEntity: FASTFortranContinueStatement atPosition: data
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclarationStatement: aDeclarationStatementNode [

	| data |
	data := super visitDeclarationStatement: aDeclarationStatementNode.

	^ FASTFortranDeclarationStatement new
		  type: data second;
			"TODO clarify the need of attributes"
		  "attributes: data third;"
		  declarators: data fourth;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclarator: aDeclaratorNode [

	self flag: 'TODO: deal with the other keys in the map'.
	^ (super visitDeclarator: aDeclaratorNode) last
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclaratorVariable: aDeclaratorVariableNode [

	| data |
	data := super visitDeclaratorVariable: aDeclaratorVariableNode.
	^ FASTFortranScalarVariable new
		  name: data second;
		  yourself
	"sourceAnchor: (self makeIndexedAnchor: data first) ;"
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclarators: aDeclaratorsList [

	^ (super visitDeclarators: aDeclaratorsList) second
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitDivision: aDivisionOperatorNode [

	^ FASTFortranBinaryExpression new
		  operator: (super visitDivision: aDivisionOperatorNode);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDo: aDoNode [

	| data |
	data := super visitDo: aDoNode.

	^ (self newEntity: FASTFortranDoStatement atPosition: data first)
		  loopControl: data second;
		  statementBlock: (FASTFortranStatementBlock new statements: data third);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDo_spec: aDoSpecNode [

	| data |
	data := super visitDo_spec: aDoSpecNode.

	^ (self
		   newEntity: FASTFortranLoopControlExpression
		   atPosition: data first)
		  flag: 'TODO: separate "init" into "controlVar" and "initValue" ';
		  init: data second;
		  limit: data third;
		  increment: data fourth;
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitEq: anEqualtoOperatorNode [

	^ FASTFortranBinaryExpression new
		  operator: (super visitEq: anEqualtoOperatorNode);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitExitStatement: anExitNode [

	| data |
	self flag: 'TODO -- what about "var" attribute ?'.

	data := super visitExitStatement: anExitNode.
	^ self newEntity: FASTFortranExitStatement atPosition: data first
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitExponentiation: aExponentiationOperatorNode [

	^ FASTFortranBinaryExpression new
		  operator: (super visitExponentiation: aExponentiationOperatorNode);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitExternalStatement: anExternalStatementNode [

	| data |
	data := super visitExternalStatement: anExternalStatementNode.
	^ (self
		   newEntity: FASTFortranExternalStatement
		   atPosition: data first)
		  name: data second first name;
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitFunctionAsValue: aFunctionNode [

	^ (super visitFunctionAsValue: aFunctionNode) second
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitFunctionStatement: aFunctionStatementNode [

	| data |
	data := super visitFunctionStatement: aFunctionStatementNode.

	^ FASTFortranFunctionStatement new
		  name: data second;
		  arguments: data third;
		  expression: data fourth;
		  yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitFunctionWithBlocks: aFunctionNode [
	"^self visitJsonMap: aFunctionNode keys: #(span name type arguments blocks result subprograms)"

	| data |
	data := super visitFunctionWithBlocks: aFunctionNode.
	^ (self newEntity: FASTFortranFunction atPosition: data first)
		  name: data second;
		  flag: 'need to set return type';
		  parameters: data fourth;
		  statementBlock: (FASTFortranStatementBlock new statements: data fifth);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitGotoStatement: aGotoStatementNode [
	"so far only unconditional case is processed"

	| data |
	data := super visitGotoStatement: aGotoStatementNode.
	^ FASTFortranGoToStatement new
		  flag: 'TODO: target = data second';
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitGt: aGreaterthanOperatorNode [

	^ FASTFortranBinaryExpression new
		  operator: (super visitGt: aGreaterthanOperatorNode);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitIf: anIfNode [
	".blocks is an array with one block dedicated to else part of last if (in case of elseifs)
	.conditionals is an erray where each element represent if and if else consequently 
	.conditionals[_].[0] represents a condition
	.conditionals[_].[1] is an array containing all statements of the correpsonding then part"

	| data lastIf lastElse |
	data := super visitIf: anIfNode.
	lastIf := data third.
	lastElse := data fourth.

	lastElse isNotEmpty ifTrue: [
		[ lastIf elseStatementBlock isNil ] whileFalse: [
			lastIf := lastIf elseStatementBlock statements first ].
		lastIf elseStatementBlock:
			(FASTFortranStatementBlock new statements: lastElse) ].

	^ data third
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitImplicitStatement: anImplicitStatementNode [
	"If 'items' is nil, correspond to the statement 'implicit none'"

	| data |
	data := super visitImplicitStatement: anImplicitStatementNode.
	^ data second
		  ifNil: [ FASTFortranImplicitStatement new ]
		  ifNotNil: [ self notYetImplemented ]
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitIntegerBaseType: aString [

	^ FASTFortranIntegerType new
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitIntegerLiteralValue: anIntegerLiteralValueNode [

	^ FASTFortranIntegerLiteral new
		  primitiveValue: (super visitIntegerLiteralValue: anIntegerLiteralValueNode);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitLogicalBaseType: aString [

	^ FASTFortranLogicalType new yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitLogicalLiteralValue: aString [

	^ FASTFortranBooleanLiteral new value:
		  (super visitLogicalLiteralValue: aString)
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitLt: anLessthanOperatorNode [

	^ FASTFortranBinaryExpression new
		  operator: (super visitLt: anLessthanOperatorNode);
		  yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitMain: aMainProgramNode [

	| data |
	data := super visitMain: aMainProgramNode.

	^ FASTFortranProgramMain new
		  name: data second;
		  statementBlock: (FASTFortranStatementBlock new statements:
					   (data third reject: [ :each |
							    each isKindOf: FASTFortranComment ]));
		  comments:
			  (data third select: [ :each | each isKindOf: FASTFortranComment ])
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitMiFilename: aString [

	lineSizes ifEmpty: [
		self initLineSizes: aString asFileReference contents ].
	^ aString
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitMinus: aMinusOperatorNode [

	^ FASTFortranBinaryExpression new
		  operator: (super visitMinus: aMinusOperatorNode);
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitMultiplication: aMultiplicationOperatorNode [

	^FASTFortranBinaryExpression new
		operator: (super visitMultiplication: aMultiplicationOperatorNode) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitPrintStatement: aPrintStatementNode [

	| data |
	data := super visitPrintStatement: aPrintStatementNode.

	^ FASTFortranPrintStatement new
		  format: data second;
		  arguments: data third;
		  yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitProgramFile: aProgramFileNode [

	^ (super visitProgramFile: aProgramFileNode) second
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitRealBaseType: aString [

	^ FASTFortranRealType new yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitRealLiteralValue: aRealLiteralValueNode [

	| data |
	data := super visitRealLiteralValue: aRealLiteralValueNode.
	^ FASTFortranRealLiteral new
		  primitiveValue: data second;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitReturnStatement: aReturnStatementNode [

	| data |
	data := super visitReturnStatement: aReturnStatementNode.
	^ FASTFortranReturnStatement new yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitReturn_spec: aReturn_specNode [

	^ (super visitReturn_spec: aReturn_specNode) second
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitStar: anObject [

	^ FASTFortranAsterisk new
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitStatement: aStatementNode [

	| data |
	data := super visitStatement: aStatementNode.

	data second ifNotNil: [ data third label: data second ].
	^ data third
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitStatementBlock: anASTStatementBlock [

	^ anASTStatementBlock collect: [ :astStatement |
		  self visitJsonMap: astStatement ] "FASTFortranStatementBlock new statements:"
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitStopStatement: aStopStatementNode [

	| data |
	data := super visitStopStatement: aStopStatementNode.

	^ (self newEntity: FASTFortranStopStatement atPosition: data first)
		  displayArgument: data second;
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitStringLiteralValue: aString [

	^ FASTFortranCharacterLiteral new
		  primitiveValue: (super visitStringLiteralValue: aString);
		  yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitSubroutine: aSubroutineNode [

	| data |
	data := super visitSubroutine: aSubroutineNode.

	^ FASTFortranSubroutine new
		  name: data second;
		  parameters: data third;
		  statementBlock: (FASTFortranStatementBlock new statements: data fourth);
		  "sourceAnchor: (self makeIndexedAnchor: data first) ;"yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitSubscript: aSubscriptNode [

	| data |
	data := super visitSubscript: aSubscriptNode.

	^ FASTFortranArrayVariable new
		  name: data second name;
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitSubtraction: aSubtractionOperatorNode [

	^ FASTFortranBinaryExpression new
		  operator: (super visitSubtraction: aSubtractionOperatorNode);
		  yourself
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitType: aTypeNode [

	^ (super visitType: aTypeNode) second
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitValue: aValueNode [

	| data val |
	data := super visitValue: aValueNode.

	val := data second.
	self set: val startEnd: data first.
	^ val
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitVariable: aVariableNode [

	| data |
	data := super visitVariable: aVariableNode.

	^ FASTFortranScalarVariable new
		  name: data;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitWriteFormat: aWriteFormatNode [

	^ (super visitWriteFormat: aWriteFormatNode) second reject: #isNil
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitWriteStatement: aWriteStatementNode [
	"write statement. should follow the pattern: 
	WRITE([UNIT=] u [, [FMT=] f] [, IOSTAT=ios] [, REC=rn] [, ERR=s]) iolist
	WRITE([ UNIT=] u, [NML=] grname [, IOSTAT=ios] [, ERR=s])"

	| data |
	data := super visitWriteStatement: aWriteStatementNode.

	^ FASTFortranWriteStatement new
		  format: data second;
		  arguments: data third;
		  yourself
	"sourceAnchor: (self makeIndexedAnchor: data first) ;"
]
