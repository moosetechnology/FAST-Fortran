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
FASTFortranSyntaxJsonVisitor >> visitArithmeticExpression: aNode [

	| data |
	data := super visitArithmeticExpression: aNode.

	^ data first
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

{ #category : #'visit statement' }
FASTFortranSyntaxJsonVisitor >> visitContinue_statement: aContinueStatement [

	^ self newEntity: FASTFortranContinueStatement
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitDeclarators: aNode [
			  		
					| data |    
					data := super visitDeclarators:aNode.
			      1 halt.
					^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitDimensionDeclarators: aNode [
			  		
					| data |    
					data := super visitDimensionDeclarators:aNode.
			      1 halt.
					^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitExpression: aNode [

	| data |
	data := super visitExpression: aNode.

	^ data
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
FASTFortranSyntaxJsonVisitor >> visitLeft: aNode [

	| data |
	data := super visitLeft: aNode.

	^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLiteral: aNode [
			  		
					| data |    
					data := super visitLiteral:aNode.
			      1 halt.
					^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitLiteralExpression: aNode [
	
	^ super visitLiteralExpression: aNode.

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

{ #category : #'visit statement' }
FASTFortranSyntaxJsonVisitor >> visitMain: aMain [
	"#(start_pos parameters end_pos statement_list name)"

	| data main position |
	data := super visitMain: aMain.

	position := self createPosition: data first end: data third.
	main := (self newEntity: FASTFortranProgramMain)
		        name: data fourth;
		        statementBlock: (FASTFortranStatementBlock new
				         statements: data second;
				         yourself);
		        yourself. "atPosition: position)  - TODO something is wrong going on with this part"

	self setBodyPosition: main fromProgramUnitPosition: position.

	^ main
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

	| data |
	data := super visitProgramUnits: aNode.

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
FASTFortranSyntaxJsonVisitor >> visitType: aNode [
	
	| data |
	data := super visitType: aNode.
	1 halt.
	^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitTypeReference: aNode [

	^ super visitTypeReference: aNode
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitUnsignedIntConstant: aNode [

	| data |
	data := super visitUnsignedIntConstant: aNode.
	^ (self newEntity: FASTFortranIntegerLiteral)
		  primitiveValue: data first;
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
FASTFortranSyntaxJsonVisitor >> visitValue: aNode [
	"comment"

	^ super visitValue: aNode 
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitVariable: aNode [

	|data|
	data := super visitVariable: aNode.
	1 halt.
	^ data
]

{ #category : #'as yet unclassified' }
FASTFortranSyntaxJsonVisitor >> visitVariableDeclarationStatement: aNode [
	"start_pos declarators type"

	| data position declaration|
	data := super visitVariableDeclarationStatement: aNode.
	1 halt.
	
	
   "position := self createPosition: data first end: data third."
	
	declaration := (self newEntity: FASTFortranVariableDeclarationStatement)
		        declarators data second;
		        type: data third;
		        yourself.
	
	^ declaration
]
