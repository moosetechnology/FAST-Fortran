Class {
	#name : #FASTFortranSyntaxJsonVisitor,
	#superclass : #SyntaxAbstractJsonVisitor,
	#instVars : [
		'lineSizes',
		'model',
		'nestedDoEndLabel'
	],
	#category : #'FAST-Fortran-Visitors-Importer'
}

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> createPosition: start end: end [ 

	^ { start . end }
]

{ #category : #initialization }
FASTFortranSyntaxJsonVisitor >> initLineSizes: fortranSource [

	lineSizes := 0.
	lineSizes := fortranSource lines collect: #size
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> newEntity: aFASTFortranClass [

	| node |
	node := aFASTFortranClass new.
	node mooseModel: model.
	^ node
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> newEntity: aFASTFortranClass atPosition: aPoint [

	| node |
	node := aFASTFortranClass new.
	node mooseModel: model.
	self set: node startEnd: aPoint.
	^ node
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> pointToPosition: lineColumn [

	| position |
	position := 0.
	1 to: lineColumn x - 1 do: [ :i |
	position := position + (lineSizes at: i) + 1 ].
	^ position + lineColumn y
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> set: aFASTFortranNode startEnd: startEndPoints [

	aFASTFortranNode
		startPos: (self pointToPosition: startEndPoints first);
		endPos: (self pointToPosition: startEndPoints second) - 1
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> setBodyPosition: aProgramUnit fromProgramUnitPosition: startEndPoints [

	"sets a reasonnable start/end position for a statementBlock:
	 - startPos = first character of parent node second line (first line + 1)
	 - endPos = first character of parent node last line
	(note: set:startEnd: substract 1 to end position so we give it the 2nd character of this line)"

	| body bodyStartEnd |
	body := aProgramUnit statementBlock.
	
	body ifNil: [ ^nil ].
	
	bodyStartEnd := {
		startEndPoints first x +1 @ 1 .
		startEndPoints second x @ 2
	}.
	self set: body startEnd: bodyStartEnd

]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitArgumentWithReturnSpecifier: aNode [
			  		<generated>
					"start_pos tag return_specifier argument"
					
					| data |    
					data := super visitArgumentWithReturnSpecifier:aNode.
			      1 halt.
					^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitArguments: aNode [
			  		<generated>
					"no keys in data"
					
					| data |    
					data := super visitArguments:aNode.
			      1 halt.
					^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitArithmeticExpression: aNode [

	| data |
	data := super visitArithmeticExpression: aNode.

	^ data first
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitArithmeticIfStatement: aNode [
			  		<generated>
					"start_pos s1 s3 s2 expression tag"
					
					| data |    
					data := super visitArithmeticIfStatement:aNode.
			      1 halt.
					^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitArrayElementName: aNode [
	"name tag qualifiers_list"

	| data |
	data := super visitArrayElementName: aNode.

	^ (self newEntity: FASTFortranArrayVariable)
		  name: (data at: 'name');
		  indices: (data at: 'qualifiers_list');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitAssignmentStatement: aNode [
	"start_pos right left"

	| data variable |
	data := super visitAssignmentStatement: aNode.

	variable := (self newEntity: FASTFortranScalarVariable) name:
		            (data at: 'left').

	^ (self newEntity: FASTFortranAssignmentStatement)
		  expression: (data at: 'right');
		  variable: variable;
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitAsterisk: aNode [

	^ FASTFortranAsterisk new
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitBinaryExpression: aNode [
	"rhs lhs operator"

	| data |
	data := super visitBinaryExpression: aNode.
	^ (self newEntity: FASTFortranBinaryExpression)
		  left: (data at: 'lhs');
		  right: (data at: 'rhs');
		  operator: (data at: 'operator');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitBlockIfStatement: aNode [
	"start_pos then_statements else_block expression tag"

	| data |
	data := super visitBlockIfStatement: aNode.

	^ (self newEntity: FASTFortranIfBlockStatement)
		  elseStatementBlock: (data at: 'else_block' at: 'else_statements');
		  thenStatementBlock: (data at: 'then_statements');
		  condition: (data at: 'expression');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitCallStatement: aNode [
			  		<generated>
					"start_pos tag name arguments"
					
					| data |    
					data := super visitCallStatement:aNode.
			      1 halt.
					^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitCharacterConstant: aNode [
	"start_pos tag value"

	| data |
	data := super visitCharacterConstant: aNode.
	^ (self newEntity: FASTFortranCharacterLiteral)
		  primitiveValue: (data at: 'value');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitCharacterExpression: aNode [
	"tag expression"

	^ (super visitCharacterExpression: aNode) at: 'expression'
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitCharacterType: aNode [
			  		<generated>
					"name tag len_specification"
					
					| data |    
					data := super visitCharacterType:aNode.
			      1 halt.
					^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitConstant: aNode [

	^ super visitConstant: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitConstantSigned: aNode [
	"sign tag constant"

	| data constant sign |
	data := super visitConstantSigned: aNode.

	sign := data at: 'sign'.
	constant := data at: 'constant'.
	sign = '-'
		ifTrue: [
			| value |
			value := constant primitiveValue.
			constant primitiveValue: sign , value ]
		ifFalse: [ 1 halt ].
	^ constant
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitContinueStatement: aNode [
	"start_pos label tag"

	| data |
	data := super visitContinueStatement: aNode.

	^ (self newEntity: FASTFortranContinueStatement)
		  startPos: (data at: 'start_pos');
		  label: (data at: 'label');
		  yourself
]

{ #category : #'visit statement' }
FASTFortranSyntaxJsonVisitor >> visitContinue_statement: aContinueStatement [

	^ self newEntity: FASTFortranContinueStatement
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitDeclarators: aNode [
	"no keys in data"

	^ super visitDeclarators: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitDimensionDeclarators: aNode [
	"no keys in data"

	| data |
	data := super visitDimensionDeclarators: aNode.
	^ data collect: [ :declarator |
		  | arrayRange |
		  arrayRange := self newEntity: FASTFortranArrayRange.

		  "array dimension is a bound variable"
		  declarator isArray
			  ifFalse: [ arrayRange upperBound: declarator ]
			  ifTrue: [ "array dimension is an expression"
				  declarator size > 1 ifTrue: [
					  arrayRange lowerBound: declarator first ].
				  arrayRange upperBound: declarator last.
				  arrayRange ] ]
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitElseBlock: aNode [
	"else_statements end_if
	TODO: should return a dictionary containing results for both else_statements and end_if"

	^ super visitElseBlock: aNode.
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitElseStatements: aNode [
	"no keys in data"

	^ (self newEntity: FASTFortranStatementBlock)
		  statements: (super visitElseStatements: aNode);
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitEndIf: aNode [
	"label"

	^ super visitEndIf: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitExpression: aNode [

	| data |
	data := super visitExpression: aNode.

	^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitFunction: aNode [
	"start_pos parameters end_pos statement_list return_type name tag"

	| data |
	data := super visitFunction: aNode.
	^ (self newEntity: FASTFortranRealLiteral)
		  primitiveValue: (data at: 'value');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitFunctionReference: aNode [
	"name tag"

	^ (self newEntity: FASTFortranFunctionCall)
		  name: ((super visitFunctionReference: aNode) at: 'name');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitIntegerType: aNode [
	"comment"

	^ FASTFortranIntegerType new
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLabel: aNode [
	"no keys in data"

	^ super visitLabel: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLeft: aNode [

	| data |
	data := super visitLeft: aNode.

	^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLenSpecification: aNode [

	^ super visitLenSpecification: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLhs: aNode [
	"start_pos tag value"

	| data |
	data := super visitLhs: aNode.
	data isArray ifTrue: [ ^ data first ].
	^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLiteral: aNode [

	^ super visitLiteral: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLiteralExpression: aNode [

	^ (super visitLiteralExpression: aNode) first
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLogicalConstant: aNode [

	| data |

	data := super visitLogicalConstant: aNode.
	data = '.TRUE.'
		ifTrue: [
			^ (self newEntity: FASTFortranBooleanLiteral)
				  primitiveValue: true;
				  yourself ]
		ifFalse: [
			^ (self newEntity: FASTFortranBooleanLiteral)
				  primitiveValue: false;
				  yourself ]
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLogicalExpression: aNode [

	| data |
	data := super visitLogicalExpression: aNode.
"	1 halt."
	^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLogicalFactor: aNode [

	| data |
	data := super visitLogicalFactor: aNode.
"	1 halt."
	^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLogicalPrimary: aNode [

	^ super visitLogicalPrimary: aNode.
	
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLogicalType: aNode [

	^ FASTFortranLogicalType new
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLowerBound: aNode [
	"literal tag"

	^ super visitLowerBound: aNode
]

{ #category : #'visit statement' }
FASTFortranSyntaxJsonVisitor >> visitMain: aNode [
	"start_pos parameters end_pos statement_list name tag"

	<generated>
	| data main position |
	data := super visitMain: aNode.

	position := self
		            createPosition: (data at: 'start_pos')
		            end: (data at: 'end_pos').
	main := (self newEntity: FASTFortranProgramMain)
		        name: (data at: 'name');
		        statementBlock: (FASTFortranStatementBlock new
				         statements: (data at: 'statement_list');
				         yourself);
		        yourself.

	self setBodyPosition: main fromProgramUnitPosition: position.

	^ main
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitOperator: aNode [
	"no keys in data"

	^ super visitOperator: aNode
]

{ #category : #'visit statement' }
FASTFortranSyntaxJsonVisitor >> visitParameter: aParameter [

	^ (self newEntity: FASTFortranScalarVariable)
		  name: (aParameter at: 'name');
		  yourself
]

{ #category : #'visit statement' }
FASTFortranSyntaxJsonVisitor >> visitProgramFile: aProgramFile [
	
	model := FASTFortranModel new.
	^ (super visitProgramFile: aProgramFile) first.
	

]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitProgramUnits: aNode [

	^ super visitProgramUnits: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitQualifiersList: aNode [
	"no keys in data"

	^ super visitQualifiersList: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitRealType: aNode [

	^ FASTFortranRealType new
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitReturnSpecifier: aNode [
			  		<generated>
					"no keys in data"
					
					| data |    
					data := super visitReturnSpecifier:aNode.
			      1 halt.
					^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitReturnType: aNode [
	"name tag"

	^ super visitReturnType: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitRhs: aNode [
	"start_pos value"

	| data |
	data := super visitRhs: aNode.
	data isArray ifTrue: [ ^ data first ].
	^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitRight: aNode [

	| data |
	data := super visitRight: aNode.

	^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitSign: aNode [
	"no keys in data"

	^ super visitSign: aNode
]

{ #category : #'visit statement' }
FASTFortranSyntaxJsonVisitor >> visitSubroutine: aSubroutine [
	"#(start_pos parameters end_pos statement_list name)"

	| data subroutine position |
	data := super visitSubroutine: aSubroutine.
	position := self createPosition: data first end: data third.
	subroutine := (self
		               newEntity: FASTFortranSubroutine
		               atPosition: position)
		              name: data fifth;
		              statementBlock: (FASTFortranStatementBlock new
				               statements: data fourth;
				               yourself);
		              parameters: data second;
		              yourself.

	self setBodyPosition: subroutine fromProgramUnitPosition: position.

	^ subroutine
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitSymbolicName: aNode [

	^ (self newEntity: FASTFortranCharacterLiteral)
		  primitiveValue: (super visitSymbolicName: aNode);
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitTag: aNode [
			  		<generated>
					"no keys in data"
					
					| data |    
					data := super visitTag:aNode.
			      1 halt.
					^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitThenStatements: aNode [
	"no keys in data"

	^ (self newEntity: FASTFortranStatementBlock)
		  statements: (super visitThenStatements: aNode);
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitType: aNode [
	"name tag"

	^ super visitType: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitTypeReference: aNode [

	^ super visitTypeReference: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitTypeStatement: aNode [
	"start_pos tag declarators type"

	| data |
	data := super visitTypeStatement: aNode.

	^ (self newEntity: FASTFortranVariableDeclarationStatement)
		  type: (data at: 'type');
		  declarators: (data at: 'declarators');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitUnaryExpression: aNode [
	"tag expression operator"

	| data |
	data := super visitUnaryExpression: aNode.

	^ (self newEntity: FASTFortranUnaryExpression)
		  expression: (data at: 'expression');
		  operator: (data at: 'operator');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitUnsignedIntConstant: aNode [
	
	^ (self newEntity: FASTFortranIntegerLiteral)
		  primitiveValue:
			  ((super visitUnsignedIntConstant: aNode) at: 'value');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitUnsignedRealConstant: aNode [
	"start_pos tag value"

	| data |
	data := super visitUnsignedRealConstant: aNode.
	^ (self newEntity: FASTFortranRealLiteral)
		  primitiveValue: (data at: 'value');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitUpperBound: aNode [
	"rhs tag lhs operator"

	^ super visitUpperBound: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitValue: aNode [
	"comment"

	^ super visitValue: aNode 
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitVariable: aNode [
	"start_pos tag name"

	^ (self newEntity: FASTFortranVariable)
		  name: ((super visitVariable: aNode) at: 'name');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitVariableDeclarationStatement: aNode [
	"start_pos tag declarators type"

	| data |
	data := super visitVariableDeclarationStatement: aNode.

	^ (self newEntity: FASTFortranVariableDeclarationStatement)
		  type: (data at: 'type');
		  declarators: (data at: 'declarators');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitVariableDeclarator: aNode [
	"tag variable dimension_declarators"

	| data |
	data := super visitVariableDeclarator: aNode.

	^ (self newEntity: FASTFortranVariableDeclarator)
		  dimensions: (data at: 'dimension_declarators');
		  variable: (data at: 'variable');
		  yourself
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitVariableExpression: aNode [

	^ (super visitVariableExpression: aNode) at: 'variable'
]
