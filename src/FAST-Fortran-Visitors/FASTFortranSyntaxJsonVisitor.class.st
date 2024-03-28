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
FASTFortranSyntaxJsonVisitor >> checkAndwrapToScalarVariable: aNode [

	aNode = FASTFortranCharacterLiteral
		ifTrue: [
			^ (self newEntity: FASTFortranScalarVariable)
				  name: aNode primitiveValue;
				  yourself ]
		ifFalse: [ ^ aNode ]
]

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
FASTFortranSyntaxJsonVisitor >> newEntity: aFASTFortranClass withPosition: aNode [

	| node |
	node := aFASTFortranClass new.
	node mooseModel: model.
	self set: node startEnd: aNode.
	^ node
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> newLabeledStatement: aFASTStatementClass withPosition: aNode [

	| statement |
	statement := self newEntity: aFASTStatementClass withPosition: aNode.
	aNode at: #label ifPresent: [ :label | statement label: label ].

	^ statement
]

{ #category : #running }
FASTFortranSyntaxJsonVisitor >> onFile: aProgramFile [
	
	model := FASTFortranModel new.

	^super onFile: aProgramFile
	

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
FASTFortranSyntaxJsonVisitor >> set: aFASTFortranNode startEnd: aNode [

	| end |
	aFASTFortranNode startPos: (self pointToPosition: (aNode at: #start_pos)).
	end := aNode at: #end_pos ifAbsent: [ (aNode at: #start_pos) + 2 ].
	aFASTFortranNode endPos: (self pointToPosition: end) - 1
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> variableNameOrExpression: anObject [
	"Scalar variables appear as String, otherwise, don't do anything"

	^anObject isString
		ifTrue: [ (self newEntity: FASTFortranScalarVariable) name: anObject ]
		ifFalse: [ anObject ]
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitArgumentWithReturnSpecifier: aNode [
	"start_pos tag return_specifier argument"

	| data |
	data := super visitArgumentWithReturnSpecifier: aNode.

	^ (self newEntity: FASTFortranCharacterLiteral)
		  primitiveValue: ((data at: 'return_specifier') , (data at: 'argument'));
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitArguments: aNode [

	| data |
	data := super visitArguments: aNode.
	^data collect: [ :each | self variableNameOrExpression: each ]

]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitArithmeticIfStatement: aNode [
	"start_pos labels expression"

	| data |
	data := super visitArithmeticIfStatement: aNode.

	^ (self newLabeledStatement: FASTFortranIfArithmeticStatement withPosition: data)
		  condition: (data at: #expression);
		  lessLabel: (data at: #labels) first ;
		  equalLabel: (data at: #labels) second ;
		  greaterLabel: (data at: #labels) third ;
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitArrayElementName: aNode [
	"name tag qualifiers_list"

	| data |
	data := super visitArrayElementName: aNode.

	^ (self newEntity: FASTFortranArrayVariable)
		  name: (data at: 'name');
		  indices: (data at: 'qualifiers_list');
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitAssignmentStatement: aNode [
	"start_pos right left
	note: left-hand-side is not an expression, it's a variable, but #convertToFASTExpression:
	  does what we need here"

	| data |
	data := super visitAssignmentStatement: aNode.

	^ (self newLabeledStatement: FASTFortranAssignmentStatement withPosition: data)
		  expression: (data at: 'right') ;
		  variable: (self variableNameOrExpression: (data at: #left)) ;
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitAsterisk: aNode [

	^ FASTFortranAsterisk new
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitBinaryExpression: aNode [
	"expression lhs operator"

	| data |

	data := super visitBinaryExpression: aNode.

	^(self newEntity: FASTFortranBinaryExpression" withPosition: data")
		leftOperand: (self variableNameOrExpression: (data at: 'lhs')) ;
		rightOperand: (self variableNameOrExpression: (data at: 'rhs')) ;
		operator: (data at: 'operator') ;
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranSyntaxJsonVisitor >> visitBlockData: aNode [
	"start_pos parameters end_pos statement_list name tag"

	| data |
	data := super visitBlockData: aNode.

	^(self newEntity: FASTFortranBlockData withPosition: data)
		name: (data at: 'name');
		parameters: (data at: 'parameters');
		statementBlock: (data at: 'statement_list');
		yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitBlockIfStatement: aNode [
	"start_pos then_statements else_block expression tag"

	| data |
	data := super visitBlockIfStatement: aNode.

	^ (self newLabeledStatement: FASTFortranIfBlockStatement withPosition: data)
		  condition: (data at: 'expression') ;
		  thenStatementBlock: (data at: 'then_statements') ;
		  elseStatementBlock: (data at: 'else_block') ;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitCallStatement: aNode [
	"start_pos tag name arguments"

	| data |
	data := super visitCallStatement: aNode.

	^ (self newLabeledStatement: FASTFortranCallStatement withPosition: data)
		  name: (data at: 'name');
		  arguments: (data at: 'arguments');
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitCharacterConstant: aNode [
	"start_pos tag value"

	| data |
	data := super visitCharacterConstant: aNode.
	^ (self newEntity: FASTFortranCharacterLiteral)
		  primitiveValue: (data at: 'value');
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitCharacterExpression: aNode [
	"tag expression"

	^ (super visitCharacterExpression: aNode) at: 'expression'
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitCharacterType: aNode [

	^self newEntity: FASTFortranCharacterType
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitCommonParameters: aNode [
	"data is an array of dict-s with keys name, nlist"

	| data result |
	data := super visitCommonParameters: aNode.
	result := OrderedCollection new.
	
	data do: [ :common |
		result add: ((self newEntity: FASTFortranCommonGroup)
				 name: (common at: 'name');
				 declarators: (common at: 'nlist');
				 yourself) ].
	^ result
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitCommonStatement: aNode [
	"start_pos tag common_parameters"

	| data |
	data := super visitCommonStatement: aNode.

	^ (self newLabeledStatement: FASTFortranCommonStatement withPosition: data)
		  groups: (data at: 'common_parameters');
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitComplexType: aNode [

	^self newEntity: FASTFortranComplexType
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitComputedGotoStatement: aNode [
	"var start_pos labels"

	| data |
	data := super visitComputedGotoStatement: aNode.

	^(self newLabeledStatement: FASTFortranGoToComputedStatement withPosition: data)
		selectorExpression: (data at: #var) ;
		labelReferences: (data at: #labels) ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitConstantSigned: aNode [
	"sign tag constant
	 if #constant is a literal (ie. isMooseEntity), then add the sign to its primitive value
	 and return it
	 otherwise, its the name of a variable, so create a UnaryExpression and inside a ScalarVariable
	Humm, could it be an ArrayVariable ?
	"

	| data constant return |
	data := super visitConstantSigned: aNode.

	constant := data at: #constant.

	constant isMooseEntity
		ifTrue: [
			constant primitiveValue: ((data at: #sign) , constant primitiveValue).
			return := constant
		]
		ifFalse: [
			return := self newEntity: FASTFortranUnaryExpression.
			return operator: (data at: 'sign').
			return expression: ((self newEntity: FASTFortranScalarVariable)
			 		name: constant)
		].

	^return

]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitContinueStatement: aNode [
	"start_pos label"

	| data |
	data := super visitContinueStatement: aNode.

	^self newLabeledStatement: FASTFortranContinueStatement withPosition: data
]

{ #category : #visiting }
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

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitElseStatements: aNode [
	"no keys in data"

	^ (self newEntity: FASTFortranStatementBlock)
		  statements: (super visitElseStatements: aNode);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitEntryStatement: aNode [
	"name tag start_pos parameters"

	| data |
	data := super visitEntryStatement: aNode.

	^ (self newLabeledStatement: FASTFortranEntryStatement withPosition: data)
		  name: (data at: 'name');
		  entryArguments: (data at: 'parameters');
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitExpression: aNode [

	| data |
	data := super visitExpression: aNode.

	^self variableNameOrExpression: data
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitExternalStatement: aNode [
	"proc_list start_pos tag"

	| data |
	data := super visitExternalStatement: aNode.

	^ (self newLabeledStatement: FASTFortranExternalStatement withPosition: data)
		  procedures: (data at: 'proc_list');
		  yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranSyntaxJsonVisitor >> visitFortranFile: aProgramFile [
	"comments program_units file"

	| data |
	data := super visitFortranFile: aProgramFile.

	^data at: #program_units
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitFunList: aCollection [
 
   ^(super visitFunList: aCollection) collect: [ :functionName |
		(self newEntity: FASTFortranScalarVariable)
			name: functionName ;
			yourself
	]
]

{ #category : #'visiting prog-unit' }
FASTFortranSyntaxJsonVisitor >> visitFunction: aNode [
	" name parameters return_type start_pos end_pos statement_list "

	| data |
	data := super visitFunction: aNode.
	^(self newEntity: FASTFortranFunction withPosition: data)
		name: (data at: 'name');
		parameters: (data at: 'parameters');
		statementBlock: (data at: 'statement_list');
		returnType: (data at: 'return_type');
		yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitFunctionReference: aNode [
	"name tag"

	^ (self newEntity: FASTFortranFunctionCall)
		  name: ((super visitFunctionReference: aNode) at: 'name');
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitImplicitNoneStatement: aNode [

	| data |
	data := super visitImplicitNoneStatement: aNode.

	^(self newLabeledStatement: FASTFortranImplicitStatement withPosition: data)
		typingRules: #() ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitImplicitParameter: anImplicitParameter [
	"type implicit_elements"

	| data |
	data := super visitImplicitParameter: anImplicitParameter.

	^(self newEntity: FASTFortranImplicitTypingRule "withPosition: data")
		type: (data at: #type) ;
		ranges: (data at: #implicit_elements) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitImplicitRange: aNode [
	"implicit_range_lower implicit_range_upper"

	| data |
	data := super visitImplicitRange: aNode.

	^(self newEntity: FASTFortranImplicitRange "withPosition: data")
		from: (data at: #implicit_range_lower) ;
		to: (data at: #implicit_range_upper) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitImplicitRangeUpper: aString [
	
	^aString ifEmpty: [ nil ] 
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitImplicitStatement: aNode [
	"start_pos implicit_parameters"

	| data |
	data := super visitImplicitStatement: aNode.

	^(self newLabeledStatement: FASTFortranImplicitStatement withPosition: data)
		typingRules: (data at: #implicit_parameters) ;
		yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitIntegerType: aNode [
	"comment"

	^ FASTFortranIntegerType new
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitIntrinsicStatement: aNode [
	"start_pos fun_list"

	| data |
	data := super visitIntrinsicStatement: aNode.

	^(self newLabeledStatement: FASTFortranIntrinsicStatement withPosition: data)
		variables: (data at: #fun_list) ;
		yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitLabelReference: labelRefNode [

	^(self newEntity: FASTFortranLabelReference)
		label: (labelRefNode at: #label_ref) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitLenSpecification: aNode [
	"#asterisk or #value"

	| data |
	data := super visitLenSpecification: aNode.

	^data at: #value
		ifPresent: [ :size |
			(self newEntity: FASTFortranIntegerLiteral)
				primitiveValue: size
		]
		ifAbsent: [ 	self newEntity: FASTFortranAsterisk ]
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitLhs: aNode [
	"start_pos tag value"

	| data |

	data := super visitLhs: aNode.
	data isArray ifTrue: [ ^ self checkAndwrapToScalarVariable: data first ].
	^ self checkAndwrapToScalarVariable: data
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitLiteralExpression: aNode [

	^super visitLiteralExpression: aNode
]

{ #category : #'visiting expression' }
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

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitLogicalType: aNode [

	^ FASTFortranLogicalType new
]

{ #category : #'visiting prog-unit' }
FASTFortranSyntaxJsonVisitor >> visitMain: aNode [
	"start_pos parameters end_pos statement_list name tag"

	| data main |
	data := super visitMain: aNode.

	main := (self newEntity: FASTFortranProgramMain withPosition: data)
		name: (data at: 'name');
		statementBlock: (data at: 'statement_list');
	yourself.

	^ main
]

{ #category : #'visiting prog-unit' }
FASTFortranSyntaxJsonVisitor >> visitParameter: aNode [
	"start_pos name"
   
	| data |
	data := super visitParameter: aNode.

	data = '*' ifTrue: [ ^ self newEntity: FASTFortranAsterisk ].

	^ (self newEntity: FASTFortranScalarVariable withPosition: data)
		  name: (aNode at: 'name');
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitPauseStatement: aNode [
	"start_pos tag"

	| data return |
	data := super visitPauseStatement: aNode.

	return := self newLabeledStatement: FASTFortranPauseStatement withPosition: data.
	data at: #argument ifPresent: [ :arg | return displayArgument: arg ].
	^return
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitQualifiersList: aNode [
	"we wrap all character literals into a scalar variable since we know that they can represent only an integer expression and not an array variable"

	^ (super visitQualifiersList: aNode) collect: [ :each |
		  each class = FASTFortranCharacterLiteral
			  ifTrue: [
				  (self newEntity: FASTFortranScalarVariable)
					  name: each primitiveValue;
					  yourself ]
			  ifFalse: [ each ] ]
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitRealType: aNode [

	^ FASTFortranRealType new
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitReturnStatement: aNode [
	"start_pos tag"

	^ self newLabeledStatement: FASTFortranReturnStatement withPosition: (super visitReturnStatement: aNode)
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitRhs: aNode [
	"start_pos value"

	| data |
	data := super visitRhs: aNode.
	data isArray ifTrue: [
		^ self checkAndwrapToScalarVariable: data first ].
	^ self checkAndwrapToScalarVariable: data
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitStatementList: statementCollection [

	| data block |
	data := super visitStatementList: statementCollection.

	block := self newEntity: FASTFortranStatementBlock.
	block statements: data.
	data
		ifEmpty: [
			block startPos: 0.
			block endPos: 0
		]
		ifNotEmpty: [
			block startPos: data first startPos.
			block endPos: data last endPos
		].

	^block
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitStopStatement: aNode [
	"start_pos OPTIONAL(argument)"

	| data return |

	data := super visitStopStatement: aNode.

	return := self newLabeledStatement: FASTFortranStopStatement withPosition: data.
	data at: #argument ifPresent: [ :arg | return displayArgument: arg ].
	^return
]

{ #category : #'visiting prog-unit' }
FASTFortranSyntaxJsonVisitor >> visitSubroutine: aSubroutine [
	"#(start_pos parameters end_pos statement_list name)"

	| data subroutine |
	data := super visitSubroutine: aSubroutine.

	subroutine := (self newEntity: FASTFortranSubroutine withPosition: data)
		name: (data at: #name);
		parameters: (data at: #parameters);
		statementBlock: (data at: #statement_list);
		yourself.

	^ subroutine
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitSubstring: aNode [
	"lower_bound tag variable upper_bound"

	<generated>
	| data array |
	data := super visitSubstring: aNode.

	array := (self newEntity: FASTFortranArrayVariable) name:
		         (data at: 'variable') name.

	array indices add: ((self newEntity: FASTFortranArrayRange)
			 lowerBound: (data at: 'lower_bound');
			 upperBound: (data at: 'upper_bound')).
			
	^ array
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitThenStatements: aNode [
	"no keys in data"

	| data |
	data := super visitThenStatements: aNode.

	^ (self newEntity: FASTFortranStatementBlock)
		  statements: data;
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitTypeReference: aNode [

	| data return |
	data := super visitTypeReference: aNode.

	return := data at: #name.
	data at: #len_specification ifPresent: [ :size | return size: size ].
	^return
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitTypeStatement: aNode [
	"start_pos tag declarators type"

	| data |
	data := super visitTypeStatement: aNode.

	^ (self newLabeledStatement: FASTFortranVariableDeclarationStatement withPosition: data)
		  type: (data at: 'type');
		  declarators: (data at: 'declarators');
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitUnaryExpression: aNode [
	"tag expression operator"

	| data |
	data := super visitUnaryExpression: aNode.

	^ (self newEntity: FASTFortranUnaryExpression)
		  expression: (data at: 'expression');
		  operator: (data at: 'operator');
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitUnconditionalGotoStatement: aNode [
	"start_pos labels
	contrary to what it seems, there is only one label possible"

	| data |
	data := super visitUnconditionalGotoStatement: aNode.

	^(self newLabeledStatement: FASTFortranGoToStatement withPosition: data)
		labelReferences: (data at: #labels) ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitUnsignedIntConstant: aNode [
	
	^ (self newEntity: FASTFortranIntegerLiteral)
		  primitiveValue:
			  ((super visitUnsignedIntConstant: aNode) at: 'value');
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitUnsignedRealConstant: aNode [
	"start_pos tag value"

	| data |
	data := super visitUnsignedRealConstant: aNode.
	^ (self newEntity: FASTFortranRealLiteral)
		  primitiveValue: (data at: 'value');
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitVar: aNode [

  | data |
	data := super visitVar: aNode.
	^self variableNameOrExpression: data
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitVariable: aNode [
	"start_pos tag name"

	| data |
	data := super visitVariable: aNode.

	^ (self newEntity: FASTFortranScalarVariable withPosition: data)
		  name: (data at: 'name');
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitVariableDeclarationStatement: aNode [
	"start_pos tag declarators type"

	| data |
	data := super visitVariableDeclarationStatement: aNode.

	^ (self newLabeledStatement: FASTFortranVariableDeclarationStatement withPosition: data)
		  type: (data at: 'type');
		  declarators: (data at: 'declarators');
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitVariableDeclarator: aNode [
	"tag variable dimension_declarators"

	| data |
	data := super visitVariableDeclarator: aNode.

	^ (self newEntity: FASTFortranVariableDeclarator)
		  dimensions: (data at: 'dimension_declarators');
		  name: (data at: 'variable');
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitVariableExpression: aNode [

	^ (super visitVariableExpression: aNode) at: 'variable'
]
