Class {
	#name : 'FASTFortranAbstractVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'ast',
		'visitor'
	],
	#category : 'FAST-Fortran-Visitors-Tests-Visitor',
	#package : 'FAST-Fortran-Visitors-Tests',
	#tag : 'Visitor'
}

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> aFunctionWithConditional [
	"
	CHARACTER*20 FUNCTION fctBigSmall( x, y)
	INTEGER x
	INTEGER y
	CHARACTER*20 str

	x = 1

	IF y .gt. 5 THEN
	str = ""small""
	y = fctSmall(x)

	ELSE
	str = ""big""
	y = y - x
	END IF

	RETURN str
	END
	"

	| ifStatement |
	self function: #fctBigSmall type: #(character 20).
	self addParameter: #x type: #integer.
	self addParameter: #y type: #integer.
	self addStatement: (self declarationStatement: #str type: #(character 20) ).
	self addStatement: (self assignementStatement: #x value: 1).
	ifStatement := self addStatement: (self ifBlock: (self binary: '.gt.' left: #y right: 5) then: #() else:  #()).
	self addStatement: (self returnStatement: #str).

	self
		add: ifStatement thenStatementBlock
		statement: (self assignementStatement: #str value: '"small"').
	self
		add: ifStatement thenStatementBlock
		statement: (self
			assignementStatement: #y
			value: (self functionCall: #fctSmall arguments: { self scalarVariable: 'x' })).

	self
		add: ifStatement elseStatementBlock
		statement: (self assignementStatement: #str value: '"big"').
	self
		add: ifStatement elseStatementBlock
		statement: (self
			assignementStatement: #y
			value: (self binary: '-' left: #y right: #x)).

	^ast

]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> add: statementBlock statement: aStatement [

	aStatement startPos: (statementBlock statements size + 1).
	statementBlock addStatement: aStatement.

	^aStatement

]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> addParameter: name type: typeDescription [
	"assume #ast contains a function definition"

	self entity: ast parameters: ((ast parameters collect: #name)
			 add: name asString;
			 yourself).

	^ self addStatement: (self declarationStatement: name type: typeDescription)
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> addStatement: aStatement [

	^self add: ast statementBlock statement: aStatement

]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> array: name access: aCollection [

	^FASTFortranArrayVariable new
		name: name ;
		indices: aCollection ;
		yourself

]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> arrayDeclaration: variable dimensions: aCollection [

	^ FASTFortranVariableDeclarationStatement new
		  declaredType: (self integerType: nil);
		  declarators: { self arrayDeclarator: variable dimensions: aCollection };
		  startPos: 1;
		  endPos: 10;
		  yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> arrayDeclarator: variable dimensions: aCollection [

	| declarator |
	declarator := self variableDeclarator: variable.
	declarator dimensions: (aCollection collect: [ :dim || min max|
		(dim size = 2)
			ifTrue: [ min := dim first. max := dim second ]
			ifFalse: [ min := nil. max := dim first].
			 FASTFortranArrayRange new
				 lowerBound: (min ifNotNil: [self integerLiteral: min]);
				 upperBound: (self integerLiteral: max)
	]).

	^ declarator
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> arrayVariable: aName indice: anInteger [
	^FASTFortranArrayVariable new
		name: aName ;
		indices: { self integerLiteral: anInteger }
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> assignementExpression: aName value: value [

	^FASTFortranAssignmentExpression new
		variable: (self makeSimpleExpression: aName) ;
		expression: (self makeSimpleExpression: value) ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> assignementStatement: aName value: rhs [

	^FASTFortranAssignmentStatement new
		variable: (self scalarVariable: aName) ;
		expression: (self makeSimpleExpression: rhs) ;
		yourself
]

{ #category : 'accessing' }
FASTFortranAbstractVisitorTest >> ast [

	^ast
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> binary: op left: lhs right: rhs [

	^FASTFortranBinaryExpression new
		operator: op ;
		leftOperand: (self makeSimpleExpression: lhs) ;
		rightOperand: (self makeSimpleExpression: rhs) ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> callStatement: aName arguments: aCollection [	
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranCallStatement new
		name: aName ;
		arguments: (aCollection collect: [ :expr | self makeSimpleExpression: expr]) ;
		startPos: 1 ;
		endPos: aName size + 4 ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> characterLiteral: value [
	^FASTFortranCharacterLiteral new
		primitiveValue: value ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> characterType: dimension [
	^FASTFortranCharacterType new
		size: (self typeSize: dimension) ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> comment: text [
	^FASTFortranComment new
		content: text asString ;
		startPos: 1 ;
		endPos: text asString size + 1 ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> declarationStatement: name type: typeDescription [

	^self declarationStatement: name type: typeDescription init: nil
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> declarationStatement: aName type: typeDescription init: expression [

	| decl |
	decl := (self declarationStatement: (self makeType: typeDescription) variables: { aName }).
	decl declarators anyOne expression: (self makeSimpleExpression: expression).

	^decl
		
		
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> declarationStatement: typeDescription variables: aCollection [
	"Bulk declaration of several variables"

	^FASTFortranVariableDeclarationStatement new
		declaredType: (self makeType: typeDescription) ;
		declarators: (self variableDeclarators: aCollection)  ;
		startPos: 1 ;
		endPos: 10 ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> doStatement: control statements: stmtBlock [
	"control is a collection of:
	 - #variable
	 - initial value expression
	 - maximum value expression
	 - optional increment"

	^FASTFortranDoStatement new
		loopControl: (self
			loopControlInit: (control first: 2)
			increment: ((control size = 4)
				ifTrue: [ control fourth ]
				ifFalse: [ nil ])
			limit: control third) ;

		statementBlock: (self statementBlock: stmtBlock) ;

		startPos: 1 ;
		endPos: 20 ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> entity: owner parameters: aCollection [
	^owner
		parameters: (self scalarVariables: aCollection) ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> exitStatement: label [

	^FASTFortranExitStatement new
		"label: (self makeSimpleExpression: label) ;
		yourself"
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> externalStatement: aName [
	^FASTFortranExternalStatement new
		name: aName ;
		startPos: 1 ;
		endPos: 8 ;
		yourself
]

{ #category : 'running' }
FASTFortranAbstractVisitorTest >> findBasicBlocks: aClass with: aPharoBooleanBlock [

	^visitor basicBlocks
		select: [ :aBasicBlock |
			(aBasicBlock class = aClass) and:
			[ aPharoBooleanBlock value: aBasicBlock ]
		]
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> function: name type: typeDescription [

	ast := self functionDeclaration: name.
	ast declaredType: (self makeType: typeDescription).

	^ast

]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> functionCall: aName arguments: aCollection [

	^FASTFortranFunctionCall new
		name: aName ;
		arguments: (aCollection collect: [:exp | self makeSimpleExpression: exp]) ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> functionDeclaration: aName [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranFunction new
		name: aName ;
		declaredType: FASTFortranRealType new ;
		parameters: {  } ;
		statementBlock: FASTFortranStatementBlock new
		yourself.
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> gotoComputedStatement: labels expression: expr [

	^FASTFortranGoToComputedStatement new
		labelReferences: (labels collect: [:label | self labelReference: label asString]) ;
		selectorExpression: (self makeSimpleExpression: expr) ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> gotoStatement: label [

	^FASTFortranGoToStatement new
		labelReferences: { self labelReference: label asString } ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> ifArithmetic: condition negative: negativeLabel  null: nullLabel  positive: positiveLabel [ 
	^FASTFortranIfArithmeticStatement new
		condition: (self makeSimpleExpression: condition) ;
		lessLabel:    (self labelReference: negativeLabel asString) ;
		equalLabel:   (self labelReference: nullLabel asString) ;
		greaterLabel: (self labelReference: positiveLabel asString).
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> ifBlock: condition then: thenBlock else: elseBlock [
	^FASTFortranIfBlockStatement new
		condition: (self makeSimpleExpression: condition) ;
		thenStatementBlock: (self statementBlock: thenBlock) ;
		elseStatementBlock: (elseBlock ifNil: [ nil ] ifNotNil: [self statementBlock: elseBlock]) ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> implicitRange: from to: to [

	^FASTFortranImplicitRange new
		from: from ;
		to: to ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> implicitStatement [
	^FASTFortranImplicitStatement new
		startPos: 1 ;
		endPos: 13 ;
		typingRules: #() ;
		yourself

]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> integerLiteral: value [
	^FASTFortranIntegerLiteral new
		primitiveValue: value ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> integerType: dimension [
	^FASTFortranIntegerType new
		size: (self typeSize: dimension) ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> ioParameter: aName value: expression [

	^FASTFortranIOParameter new
		name: aName ;
		expression: (self makeSimpleExpression: expression) ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> ioStatement: aClass ioParams: params arguments: args [

	^aClass new
		ioParameters: (params collect: [:each | self makeSimpleExpression: each]) ;
		arguments: (args collect: [:each | self makeSimpleExpression: each]) ;
		startPos: 1 ;
		endPos: 30 ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> labelReference: aString [

	^FASTFortranLabelReference new
		label: aString ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> labelled: label statement: aStatement [

	^aStatement
		label: label asString ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> logicalIf: condition statement: statement [

	^ FASTFortranIfLogicalStatement new
		  condition: (self makeSimpleExpression: condition);
		  statement: statement;
		  yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> logicalLiteral: value [
	^FASTFortranBooleanLiteral new
		primitiveValue: value ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> logicalType: dimension [
	^FASTFortranLogicalType new
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> loopControlInit: init increment: incr limit: limit [
	"#init is a pair:
	 - #variable name
	 - inital value"
	| entity |
	entity := FASTFortranLoopControlExpression new.

	entity init: (FASTFortranAssignmentExpression new
		variable: (self makeSimpleExpression: init first) ;
		expression: (self makeSimpleExpression: init second)).

	incr ifNotNil: [ entity increment: (self makeSimpleExpression: incr) ].

	entity limit: (self makeSimpleExpression: limit).

	^entity
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> makeSimpleExpression: description [

	description ifNil: [ ^nil ].
	(description = $*) ifTrue: [ ^FASTFortranAsterisk new ].
	description isInteger ifTrue: [ ^self integerLiteral: description asString ].
	description isFloat ifTrue: [ ^self realLiteral: description asString ].
	description isSymbol ifTrue: [ ^self scalarVariable: description asString ].
	description isString ifTrue: [ ^self characterLiteral: description asString ].
	description isMooseEntity ifTrue: [ ^description ].

	ShouldBeImplemented signal: 'ExpressionDescription: ' , description class name
	
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> makeType: typeDescription [
	"typeDescription can be a symbol (eg. #integer) or a pair: #(character '*')"

	| helper pair |

	typeDescription isMooseEntity ifTrue: [ ^typeDescription ].

	pair := typeDescription isSymbol
		ifTrue: [ { typeDescription . nil } ]
		ifFalse: [ typeDescription ].

	helper := (pair first asString , 'Type:') asSymbol.
	^self perform: helper with: pair second.	
]

{ #category : 'running' }
FASTFortranAbstractVisitorTest >> newVisitor [

	self subclassResponsibility
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> printStatement: aCollection [

	^FASTFortranPrintStatement new
		format: FASTFortranAsterisk new ;
		arguments: (aCollection collect: [ :each | self makeSimpleExpression: each]) ;
		startPos: 1 ;
		endPos: 30 ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> readStatement: aCollection [

	^self readStatement: aCollection ioParams: #( * * )
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> readStatement: args ioParams: params [

	^self ioStatement: FASTFortranReadStatement ioParams: params arguments: args
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> realLiteral: value [
	^FASTFortranRealLiteral new
		primitiveValue: value ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> realType: dimension [
	^FASTFortranRealType new
		size: (self typeSize: dimension) ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> returnStatement: expressionDescription [

	^FASTFortranReturnStatement new
		expression: (self makeSimpleExpression: expressionDescription) ;
		startPos: 1 ;
		endPos: 6 ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> scalarVariable: aName [
	^FASTFortranScalarVariable new
		name: aName ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> scalarVariables: aCollectionOfString [
	^aCollectionOfString collect: [ :aString | self scalarVariable: aString ]
]

{ #category : 'running' }
FASTFortranAbstractVisitorTest >> setUp [
	super setUp.

	visitor := self newVisitor
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> statementBlock: aCollection [
	aCollection withIndexDo: [ :stmt :i | stmt startPos: i ].
	^FASTFortranStatementBlock new
		statements: aCollection ;
		startPos: 1 ;
		endPos: (aCollection ifNotEmpty: [ aCollection last endPos ] ifEmpty: [ 2 ]) ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> subroutine: aName [

	ast := FASTFortranSubroutine new
		name: aName ;
		statementBlock: (self statementBlock: #()) ;
		startPos: 1 ;
		endPos: 50 ;
		yourself.

	^ast
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> typeSize: dimension [
	dimension isNumber ifTrue: [ ^self integerLiteral: dimension asString ].
	dimension = '*' ifTrue: [ ^FASTFortranAsterisk new ].
	^nil
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> unary: op operand: operand [

	^FASTFortranUnaryExpression new
		operator: op ;
		expression: (self makeSimpleExpression: operand) ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> variableDeclarator: aName [
	^FASTFortranVariableDeclarator new
		name: aName ;
		yourself
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> variableDeclarators: aCollectionOfString [
	^aCollectionOfString collect: [ :aString | self variableDeclarator: aString ]
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> writeStatement: aCollection [

	^self writeStatement: aCollection ioParams: #( * * )
]

{ #category : 'entity creation' }
FASTFortranAbstractVisitorTest >> writeStatement: args ioParams: params [

	^self ioStatement: FASTFortranWriteStatement ioParams: params arguments: args
]
