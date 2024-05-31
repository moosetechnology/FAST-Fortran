Class {
	#name : #FASTFortranSyntaxJsonVisitor,
	#superclass : #SyntaxAbstractJsonVisitor,
	#instVars : [
		'lineSizes',
		'model',
		'nestedDoEndLabel',
		'currentComment'
	],
	#category : #'FAST-Fortran-Visitors-Importer'
}

{ #category : #'helpers - positions' }
FASTFortranSyntaxJsonVisitor >> addEndPosOfArray: array on: data [

	data at: 'end_pos' put: array last endPos
]

{ #category : #'helpers - positions' }
FASTFortranSyntaxJsonVisitor >> addEndPosOfArrayPlusParenthes: array on: data [

	| endPosArray |
	endPosArray := array last endPos.
	data at: 'end_pos' put: endPosArray x @ (endPosArray y + 1)
]

{ #category : #'helpers - positions' }
FASTFortranSyntaxJsonVisitor >> addEndPosOfInt: n on: data [
	| startPos |
	
	startPos := data at: 'start_pos'. 
	data at: 'end_pos' put: ((startPos x)@(startPos y + n - 1)).
]

{ #category : #'helpers - positions' }
FASTFortranSyntaxJsonVisitor >> addEndPosOfPoint: aPoint on: data [
	data at: 'end_pos' put: aPoint 
]

{ #category : #'helpers - positions' }
FASTFortranSyntaxJsonVisitor >> addEndPosOfString: str on: data [
	| startPos |
	
	startPos := data at: 'start_pos'. 
	data at: 'end_pos' put: ((startPos x)@(startPos y + (str size) - 1)).
]

{ #category : #'helpers - positions' }
FASTFortranSyntaxJsonVisitor >> addEndPosSimpleOn: data [

	data at: 'end_pos' put: (data at: 'start_pos')		
]

{ #category : #'helpers - positions' }
FASTFortranSyntaxJsonVisitor >> addEndPosUntilEndLineOn: data [
	| startPosX |
	
	startPosX := (data at: 'start_pos') x. 
	data at: 'end_pos' put: (startPosX @ (lineSizes at: startPosX )).
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> checkEmptyElse: blockIf [
	"if a ELSE (of a IfBlockStatement) contains no statement and no commentsButton
	 then we just remove it from the FASTFortranIfBlockStatement"

	blockIf elseStatementBlock statements ifNotEmpty: [ ^self ].
	blockIf elseStatementBlock comments ifNotEmpty: [ ^self ].

	blockIf elseStatementBlock: nil
]

{ #category : #'helpers - comments' }
FASTFortranSyntaxJsonVisitor >> checkForComments: aStatementBlock [
	"StatementBlocks should be created inside-out (inner most first), so we just check which comments
	 the block englobes"

	(self commentsWithin: aStatementBlock) do: [ :aComment || commentLine |
		commentLine := aComment key asInteger.
		aStatementBlock addComment: ((self newEntity: FASTFortranComment)
			content: aComment value trim ;
			startPos: commentLine @ 0 ;
			endPos: commentLine @ (lineSizes at: commentLine) ;
			yourself).
		commentList remove: aComment
	]

]

{ #category : #'accessing - private tests' }
FASTFortranSyntaxJsonVisitor >> commentList [

	^commentList
]

{ #category : #'helpers - comments' }
FASTFortranSyntaxJsonVisitor >> commentsWithin: aStatementBlock [
	"We just check line numbers because Fortran-77 does not have end-of-line comments
	Note: #commentList is ordered by the comments line number, pas the last line of commentBlock,
	 there is no need to continue
	 We compare with <= and >= because start/end pos are not always clear"

	| assignedComments |
	assignedComments := OrderedCollection new.

	commentList do: [ :aComment |
		(aStatementBlock startPos x <= aComment key) ifTrue: [
			(aStatementBlock endPos x >= aComment key)
			ifTrue: [ assignedComments add: aComment ]
			ifFalse: [ ^assignedComments "comment is after the blockStatement" ]
		]
	].

	^assignedComments 
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> controlOptionToVariable: data [ 

	^ (self newEntity:  FASTFortranScalarVariable  withPosition: data) name: (data at: 'control_option_name')
]

{ #category : #running }
FASTFortranSyntaxJsonVisitor >> convertLineColumnToPositions [

		(model allWithSubTypesOf: FASTFortranEntity) do: [ :entity |
		entity startPos ifNotNil: [ :pos | entity startPos: (self pointToPosition: pos) ].
		entity endPos ifNotNil: [ :pos | entity endPos: (self pointToPosition: pos) ]
	].
]

{ #category : #'helpers - positions' }
FASTFortranSyntaxJsonVisitor >> endOfLinePosition: aPosition [

	^(aPosition x) @ (lineSizes at: aPosition x)
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> groupCommonSequences: aCollection [
	"a flat sequence of: #common_name, #variable_declarator, #variable_declarator, #common_name, #variable_declarator, ...
	- mut be grouped by: #common_name, #variable_declarators
	- #common_name is optional (and there is only one group in this case)
	
	a #common_name is a dictionary with a key #dommon_name. This is how we recognized them"

	| groups current_group inner |
	groups := OrderedCollection new.

	inner := [ :each |
	         current_group := self
		                          newEntity: FASTFortranCommonGroup
		                          withPosition: each.
	         current_group addDeclarator:
		         (each at: 'common_element_name').
	         groups add: current_group ].

	aCollection do: [ :each |
		(each includesKey: 'common_block_name')
			ifTrue: [ (inner value: each) name: (each at: 'common_block_name') asString ]
			ifFalse: [
				current_group
					ifNotNil: [
					current_group addDeclarator: (each at: 'common_element_name') ]
					ifNil: [ inner value: each ] ] ].
	^ groups
]

{ #category : #initialization }
FASTFortranSyntaxJsonVisitor >> initLineSizes: fortranSource [

	lineSizes := 0.
	lineSizes := fortranSource lines collect: #size
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> makeLoopControl: data [

	| init endPosLoop |
	init := (self
		         newEntity: FASTFortranAssignmentExpression
		         withPosition: data)
		        variable: (data at: #variable_name);
		        expression: (self variableOrExpression: (data at: #init));
		        endPos: (data at: #init) endPos;
		        yourself.

	endPosLoop := (data includes: 'increment')
		              ifFalse: [
			              | endPos |
			              endPos := (data at: #limit) endPos.
			              endPos x @ (endPos y + 1) ]
		              ifTrue: [
			              | endPos |
			              endPos := (data at: #increment) endPos endPos x
			                        @ (endPos y + 1) ].

	^ (self
		   newEntity: FASTFortranLoopControlExpression
		   withPosition: data)
		  init: init;
		  limit: (self variableOrExpression: (data at: #limit));
		  increment: (data at: #increment ifAbsent: [ nil ]);
		  endPos: endPosLoop;
		  yourself
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> newEntity: aFASTFortranClass [

	^aFASTFortranClass new
		mooseModel: model ;
		yourself
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> newEntity: aFASTFortranClass withPosition: aNode [

	| node |
	node := self newEntity: aFASTFortranClass.

	self set: node startEnd: aNode.
	
	^ node
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> newLabeledStatement: aFASTStatementClass withPosition: aNode [
	"creates aFASTStatementClass, sets a label if there is one.
	heuristic: endpos is the end of the line"

	| statement |
	statement := self newEntity: aFASTStatementClass withPosition: aNode.
	aNode at: #label ifPresent: [ :label | statement label: label ].

	(statement startPos = statement endPos)
		ifTrue: [ statement endPos: (self endOfLinePosition: (aNode at: #start_pos)) ].

	^ statement
]

{ #category : #running }
FASTFortranSyntaxJsonVisitor >> onFile: aProgramFile [
	
	| ast |
	model := FASTFortranModel new.

	ast := super onFile: aProgramFile.

	self convertLineColumnToPositions.

	^ast
]

{ #category : #'helpers - positions' }
FASTFortranSyntaxJsonVisitor >> pointToPosition: lineColumn [

	| position |
	position := 0.
	1 to: lineColumn x - 1 do: [ :i |
	position := position + (lineSizes at: i) + 1 ].
	^ position + lineColumn y
]

{ #category : #'helpers - positions' }
FASTFortranSyntaxJsonVisitor >> set: aFASTFortranNode startEnd: aNode [

	aFASTFortranNode startPos: (aNode at: #start_pos).

	aFASTFortranNode endPos: (aNode
		at: #end_pos
		ifAbsent: [ aFASTFortranNode startPos ]).
]

{ #category : #'helpers - positions' }
FASTFortranSyntaxJsonVisitor >> setBlockIfStartEnd: blockIf [
	| thenBlock elseBlock |
	
	elseBlock := blockIf elseStatementBlock.
	blockIf endPos: elseBlock endPos.

	elseBlock startPos ifNil: [
		elseBlock startPos: (elseBlock endPos x @ 1)
	].
	
	thenBlock := blockIf thenStatementBlock.
	thenBlock statements ifEmpty: [
		self assert: (thenBlock startPos isNil).
		self assert: (thenBlock endPos isNil).
		thenBlock startPos: (self endOfLinePosition: (blockIf startPos)).
		thenBlock endPos: (self endOfLinePosition: (elseBlock startPos - 1)).
	]
]

{ #category : #'helpers - positions' }
FASTFortranSyntaxJsonVisitor >> setEndPos: aPoint on: data [
	data at: 'end_pos' put: aPoint 
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> statementBlockFromStatementList: statementList [

	| block |
	block := self newEntity: FASTFortranStatementBlock.
	block statements: statementList.

	statementList
		ifNotEmpty: [
			block startPos: statementList first startPos.
			block endPos: statementList last endPos ].

	^ block
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> variableOrExpression: anObject [

	(anObject isKindOf: TemporalSymbolicName) ifTrue: [
		^ anObject asVariable: self ].
	^ anObject
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitAlternateReturnSpecifier: aNode [

	| data |
	data := super visitAlternateReturnSpecifier: aNode.
	self addEndPosSimpleOn: data.
	
	^ (self newEntity: FASTFortranCharacterLiteral withPosition: data) primitiveValue:
		  '*' , ((data at: #label) at: #label)
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitArgumentWithReturnSpecifier: aNode [

	| data |
	data := super visitArgumentWithReturnSpecifier: aNode.
	1 halt.
	"Seems it is not called by anyone, a candidate for being deleted"
	
	^ (self newEntity: FASTFortranCharacterLiteral)
		  primitiveValue: ((data at: 'return_specifier') , (data at: 'argument'));
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitArguments: aNode [

	| data |
	data := super visitArguments: aNode.
	^ data collect: [ :each | self variableOrExpression: each ]
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitArithmeticIfStatement: aNode [
	"start_pos labels expression"

	| data |
	data := super visitArithmeticIfStatement: aNode.
	self addEndPosOfArray: (data at: #labels) on: data.

	^ (self
		   newLabeledStatement: FASTFortranIfArithmeticStatement
		   withPosition: data)
		  condition: (data at: #expression);
		  lessLabel: (data at: #labels) first;
		  equalLabel: (data at: #labels) second;
		  greaterLabel: (data at: #labels) third;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitArrayElementName: aNode [

	| data |
	data := super visitArrayElementName: aNode.
	self
		addEndPosOfArrayPlusParenthes: (data at: 'qualifiers_list')
		on: data.

	^ ((data at: 'name') asArraVariable: self)
		  indices: (data at: 'qualifiers_list');
		  endPos: (data at: 'end_pos');
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitAssignmentStatement: aNode [
	"start_pos right left
	note: left-hand-side is not an expression, it's a variable, but #convertToFASTExpression:
	  does what we need here"

	| data |
	data := super visitAssignmentStatement: aNode.

	self addEndPosOfPoint: (data at: 'right') endPos on: data. 
	^ (self newLabeledStatement: FASTFortranAssignmentStatement withPosition: data)
		  expression: (data at: 'right') ;
		  variable: (self variableOrExpression: (data at: #left)) ;
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitAsterisk: aNode [

	| pos |
	pos := self visitJsonNode: aNode key: 'start_pos'.
	^ self newEntity: FASTFortranAsterisk withPosition: (Dictionary new
			   at: 'start_pos' put: pos;
			   at: 'end_pos' put: pos;
			   yourself)
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitBinaryExpression: aNode [
	"expression lhs operator"

	| data |

	data := super visitBinaryExpression: aNode.

	self addEndPosOfPoint: (data at: 'right') endPos on: data. 
	^(self newEntity: FASTFortranBinaryExpression withPosition: data)
		leftOperand: (self variableOrExpression: (data at: 'left')) ;
		rightOperand: (self variableOrExpression: (data at: 'right')) ;
		operator: ((data at: 'operator') at: 'operator_value' ) ;
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranSyntaxJsonVisitor >> visitBlockData: aNode [
	"start_pos prog_unit_parameters end_pos statement_list name tag"

	| data progUnit |
	data := super visitBlockData: aNode.

	progUnit := (self newEntity: FASTFortranBlockData withPosition: data)
		name: ((data at: 'name') name);
		parameters: (data at: 'prog_unit_parameters');
		statementBlock: (data at: 'statement_list');
		yourself.

	self checkForComments: progUnit.

	^progUnit
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitBlockIfStatement: aNode [
	"start_pos condition then_statements else_block"

	| data blockIf |
	data := super visitBlockIfStatement: aNode.
	self addEndPosOfPoint: ((data at: 'else_block') endPos) on: data. 
	blockIf := (self newLabeledStatement: FASTFortranIfBlockStatement withPosition: data)
		condition: (self variableOrExpression: (data at: #condition)) ;
		thenStatementBlock: (data at: #then_statements) ;
		elseStatementBlock: (data at: #else_block) ;
		yourself.

	self setBlockIfStartEnd: blockIf.

	self checkForComments: blockIf thenStatementBlock.
	self checkForComments: blockIf elseStatementBlock.

	self checkEmptyElse: blockIf.	

	^blockIf

]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitCallStatement: aNode [
	"start_pos tag name arguments"

	| data endPosX |
	data := super visitCallStatement: aNode.

	endPosX := (data at: 'arguments') last endPos x.
	self addEndPosOfPoint: endPosX@(lineSizes at: endPosX) on: data.
	
	^ (self
		   newLabeledStatement: FASTFortranCallStatement
		   withPosition: data)
		  name: (data at: 'name') name;
		  arguments: (data at: 'arguments');
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitCharacterConstant: aNode [

	| data |
	data := super visitCharacterConstant: aNode.

	self addEndPosOfString: (data at: 'value') on: data.
	^ (self newEntity: FASTFortranCharacterLiteral withPosition: data)
		  primitiveValue: (data at: 'value');
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitCharacterType: aNode [

	| position |
	position := self visitJsonMap: aNode keys: #( start_pos ).
	self addEndPosOfInt: 9 on: position.

	^ self newEntity: FASTFortranCharacterType withPosition: position
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitCommonBody: aCollection [
	"a flat sequence of: #common_name, #variable_declarator, #variable_declarator, #common_name, #variable_declarator, ...
	- mut be grouped by: #common_name, #variable_declarators
	- #common_name is optional (and there is only one group in this case)"

	^ self groupCommonSequences: (super visitCommonBody: aCollection)
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitCommonStatement: aNode [
	"start_pos tag common_parameters"

	| data |
	data := super visitCommonStatement: aNode.

	self
		addEndPosOfArray: (data at: 'common_body') last declarators
		on: data.
	^ (self
		   newLabeledStatement: FASTFortranCommonStatement
		   withPosition: data)
		  groups: (data at: 'common_body');
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitComplexType: aNode [

	| position |
	position := self visitJsonMap: aNode keys: #( start_pos ).
	self addEndPosOfInt: 7 on: position.

	^ self newEntity: FASTFortranComplexType withPosition: position
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitComputedGotoStatement: aNode [
	"var start_pos labels"

	| data |
	data := super visitComputedGotoStatement: aNode.
	self addEndPosOfPoint: (data at: #expression) endPos on: data.
	^ (self
		   newLabeledStatement: FASTFortranGoToComputedStatement
		   withPosition: data)
		  selectorExpression: (data at: #expression);
		  labelReferences: (data at: #labels);
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
	self addEndPosOfPoint: constant endPos on: data.
	constant isMooseEntity
		ifTrue: [
			constant primitiveValue:
				((data at: #sign) at: #sign_value) , constant primitiveValue.
			"updating start position to accomodate the sign"
			constant startPos: constant startPos x @ (constant startPos y - 1).
			return := constant ]
		ifFalse: [
			return := self
				          newEntity: FASTFortranUnaryExpression
				          withPosition: data.
			return operator: ((data at: #sign) at: #sign_value).
			return expression:
				((self newEntity: FASTFortranScalarVariable) name: constant name) ].

	^ return
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitContinueStatement: aNode [
	"start_pos label"

	| data |
	data := super visitContinueStatement: aNode.
	self addEndPosUntilEndLineOn: data.
	^self newLabeledStatement: FASTFortranContinueStatement withPosition: data
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitControlInfoList: aNode [

	^ (super visitControlInfoList: aNode) collect: [ :each |
		  self variableOrExpression: each ]
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitControlInfoOption: aNode [
	"(symbolic_name right)
	#right can be another symbolic_name, a literal, or an array with a label_ref.
	The later needs to be converted (to unsigned_int for now)"

	| data |
	data := super visitControlInfoOption: aNode.
	self
		addEndPosOfPoint: (data at: #control_option_value) endPos
		on: data.
	^ (self newEntity: FASTFortranAssignmentExpression withPosition: data)
		  expression:
			  (self variableOrExpression: (data at: #control_option_value));
		  variable: (self controlOptionToVariable: data);
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitControlOptionValue: aNode [
	"(symbolic_name right)
	#right can be another symbolic_name, a literal, or an array with a label_ref.
	The later needs to be converted (to unsigned_int for now)"

	| data |
	data := super visitControlOptionValue: aNode.

	(data isKindOf: FASTFortranLabelReference)
		ifTrue: [
			^ (self newEntity: FASTFortranIntegerLiteral withPosition: aNode)
				  primitiveValue: data label;
				  startPos: data startPos;
				  endPos: data endPos;
				  yourself ]
		ifFalse: [ ^ data ]
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitDataGroup: aNode [

	| data |
	data := super visitDataGroup: aNode.
	self addEndPosOfArray: (data at: #data_group_constants_list) on: data. 
	
	^ (self newEntity: FASTFortranDataGroup withPosition: data)
		  variables: (data at: #data_group_variables_list);
		  constants: (data at: #data_group_constants_list);
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitDataGroupConstant: aNode [
	"occurence constant"

	| data |
	data :=  super visitDataGroupConstant: aNode.
	
	^(data at: #occurence)
		ifNil:[ data at: #constant	]
		ifNotNil:  [ :multiplier |
			1 halt.
			(self newEntity: FASTFortranBinaryExpression withPosition: data)
				operator: '*' ;
				leftOperand: multiplier ;
				rightOperand: (data at: #constant) ;
				yourselfNotUsed
		]
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitDataGroupVariablesList: aNode [

	^ (super visitDataGroupVariablesList: aNode) collect: [ :each |
		  self variableOrExpression: each ]
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitDataGroups: aNode [

	^aNode collect: [ :each |
		self visitDataGroup: each
	]
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitDataImplyDoList: aNode [
	"dlist init limit increment"

	| data vars return |
	data := super visitDataImplyDoList: aNode.

	vars := (data at: #dlist) collect: [ :var |
		        self variableOrExpression: var ].
	data
		at: #variable_name
		put: (self variableOrExpression: (data at: #variable_name)).

	return := (self
		           newEntity: FASTFortranImpliedDoExpression
		           withPosition: data)
		          variables: vars;
		          loopControl: (self makeLoopControl: data);
		          yourself.

	return endPos: return loopControl endPos.

	^ return
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitDataStatement: aNode [
	"start_pos data_groups"

	| data |
	
	data := super visitDataStatement: aNode.
	self addEndPosOfPoint: ((data at: #data_groups) last endPos) on: data. 
	^(self newEntity: FASTFortranDataStatement withPosition: data)
		groups: (data at: #data_groups) ;
		yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitDimensionDeclarator: aNode [

	| data |
	data := super visitDimensionDeclarator: aNode.
	^ (self newEntity: FASTFortranArrayRange withPosition: data)
		  upperBound: (data at: #upper_bound);
		  endPos: (data at: #upper_bound) endPos;
		  lowerBound: (data at: #lower_bound ifPresent: [ :lower | lower ])
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitDimensionDeclarators: aNode [
	"no keys in data"

	^ super visitDimensionDeclarators: aNode
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitDimensionStatement: aNode [
	"start_pos array_declarators"

	| data |
	data := super visitDimensionStatement: aNode.

	self addEndPosOfArray: (data at: 'array_declarators') on: data.
	^ (self
		   newLabeledStatement: FASTFortranDimensionStatement
		   withPosition: data)
		  declarators: (data at: #array_declarators);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitDoStatement: aNode [
	"start_pos statement_number loop_control statement_list"

	| data statement |
	data := super visitDoStatement: aNode.

	statement := (self newLabeledStatement: FASTFortranDoStatement withPosition: data)
		labelReferences: (data
			at: #statement_number
			ifPresent: [ :labelRef | { labelRef } ]
			ifAbsent: [ #() ] ) ;
		loopControl: (data at: #loop_control) ;
		statementBlock: (data at: #statement_list) ;
		yourself.

	statement statementBlock startPos: (self endOfLinePosition: statement startPos) + 1.
	self checkForComments: statement statementBlock.

	^statement
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitElse: aNode [
	"start_pos statement_list end_if
	we send the #endPos of the ElseBlock to after #end_if"

	| data statementBlock |
	data := super visitElse: aNode.

	statementBlock := data
		at: #statement_list
		ifAbsent: [ self newEntity: FASTFortranStatementBlock ].

	statementBlock startPos: (data at: #start_pos).
	statementBlock endPos: ( self endOfLinePosition: ((data at: #end_if) at: #start_pos) ).

	^statementBlock
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitElseBlock: aNode [
	"statement_list end_if
	 if the ELSE is not empty, data contains the StatementBlock"

	| data |
	data := super visitElseBlock: aNode.
	
	^(data isMooseEntity)
		ifTrue: [ data ]
		ifFalse: [
			(data at: #statement_list)
				endPos: (self endOfLinePosition: ((data at: #end_if) at: #start_pos)) ;
				yourself
		]
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitElseIf: aNode [
	"contains a new block_if inside the ELSE
	 Note: calls #visitBlockIfStatement: in super-class and the resulting
	   IfBlockStatement goes in #data
	 #start_pos is the start of ELSE
	 for #startPos of inner IF we add 5  (=length of 'ELSE ') to this"

	| innerIf elseStart |
	innerIf := super visitElseIf: aNode.

	elseStart := innerIf startPos.
	innerIf startPos: (innerIf startPos x @ (innerIf startPos y+ 5)).

	^(self statementBlockFromStatementList: { innerIf })
		startPos: elseStart ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitElseStatements: aNode [

	^self statementBlockFromStatementList: (super visitElseStatements: aNode)
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitEntryStatement: aNode [
	"name tag start_pos parameters"

	| data |
	data := super visitEntryStatement: aNode.
	self addEndPosOfArray: (data at: 'parameters') on: data.
	^ (self newLabeledStatement: FASTFortranEntryStatement withPosition: data)
		  name: (data at: 'name');
		  entryArguments: (data at: 'parameters');
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitEquivalenceEntity: aCollection [

	^ self variableOrExpression:
		  (super visitEquivalenceEntity: aCollection)
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitEquivalenceGroup: aCollection [

	| data |
	data := super visitEquivalenceGroup: aCollection.

	self
		addEndPosOfArrayPlusParenthes:
		(data at: 'equivalence_group_elements')
		on: data.
	^ (self newEntity: FASTFortranEquivalenceGroup withPosition: data)
		  variables: (data at: 'equivalence_group_elements');
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitEquivalenceStatement: aNode [
	"start_pos equivalence_groups"

	| data |
	data := super visitEquivalenceStatement: aNode.
	self addEndPosOfArray: (data at: #equivalence_groups) on: data.
	^(self newLabeledStatement: FASTFortranEquivalenceStatement withPosition: data)
		variableGroups: (data at: #equivalence_groups) ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitExpression: aNode [

	^self variableOrExpression: (super visitExpression: aNode)
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitExternalStatement: aNode [

	| data |
	data := super visitExternalStatement: aNode.
	self addEndPosOfArray: (data at: 'proc_list') on: data.
	^ (self
		   newLabeledStatement: FASTFortranExternalStatement
		   withPosition: data)
		  procedures: ((data at: 'proc_list') collect: [ :each |
					   (self
						    newEntity: FASTFortranExternalProcedure
						    withPosition: each data)
						   name: each name;
						   yourself ]);
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitFormat: aNode [
	"data is an array which can:
	 - be empty
	 - contain a CharacterLiteral
	 - contain a string (variable name)
	 - contain another array of 1 Asterisk
	 - contain another array of 1 LabelReference"

	| data |
	data := super visitFormat: aNode.
	data ifEmpty: [
		1 halt. "no one entered"
		^ data ].
	data anyOne class = FASTFortranCharacterLiteral ifTrue: [
		^ data anyOne ].
	data anyOne isString ifTrue: [
		1 halt. "no one entered"
		^ (self newEntity: FASTFortranScalarVariable) name: data anyOne ].
	^ data anyOne
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitFormatStatement: aNode [
	"specification"

	| data format_desc lastElem lastElemStartPos |
	data := super visitFormatStatement: aNode.

	format_desc := ',' join:
		               ((data at: 'format_specifiers') collect: [ :e |
			                e at: 'value' ]).

	lastElem := (data at: 'format_specifiers') last.
	lastElemStartPos := lastElem at: 'start_pos'.

	self
		addEndPosOfPoint:
		(lastElemStartPos x) @ (lastElemStartPos y
		+ (lastElem at: 'value') size + 1)
		on: data.
	^ (self
		   newLabeledStatement: FASTFortranFormatStatement
		   withPosition: data)
		  formatDescription: format_desc;
		  yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranSyntaxJsonVisitor >> visitFortranFile: aProgramFile [
	"comments program_units file"

	| progUnits |
	progUnits := (super visitFortranFile: aProgramFile) at: #program_units.

	progUnits do: [:each | self checkForComments: each ].

	^progUnits
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitFunList: aCollection [

	^ (super visitFunList: aCollection) collect: [ :functionName |
		  (self
			   newEntity: FASTFortranScalarVariable
			   withPosition: functionName data)
			  name: functionName name;
			  yourself ]
]

{ #category : #'visiting prog-unit' }
FASTFortranSyntaxJsonVisitor >> visitFunction: aNode [
	" name prog_unit_parameters return_type start_pos end_pos statement_list "

	| data progUnit |
	data := super visitFunction: aNode.

	progUnit := (self newEntity: FASTFortranFunction withPosition: data)
		name: ((data at: 'name') name);
		parameters: (data at: 'prog_unit_parameters');
		statementBlock: (data at: 'statement_list');
		returnType: (data at: 'return_type');
		yourself.

	self checkForComments: progUnit.

	^progUnit
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitFunctionReference: aNode [

	| data |
	data := super visitFunctionReference: aNode.

	self addEndPosUntilEndLineOn: data.
	^ (self newEntity: FASTFortranFunctionCall withPosition: data)
		  name: (data at: 'name') name;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitImplicitNoneStatement: aNode [

	| data |
	data := super visitImplicitNoneStatement: aNode.
	self addEndPosOfInt: 13 on: data. "implicit none size -> 13"
	^ (self
		   newLabeledStatement: FASTFortranImplicitStatement
		   withPosition: data)
		  typingRules: #(  );
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitImplicitParameter: anImplicitParameter [
	"type implicit_elements"

	| data |
	data := super visitImplicitParameter: anImplicitParameter.
	self
		addEndPosOfArrayPlusParenthes: (data at: #implicit_elements)
		on: data.

	^ (self newEntity: FASTFortranImplicitTypingRule withPosition: data)
		  type: (data at: #type);
		  ranges: (data at: #implicit_elements);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitImplicitRange: aNode [
	"implicit_range_lower implicit_range_upper"

	| data rangeLength |
	data := super visitImplicitRange: aNode.

	rangeLength := (data at: 'implicit_range_upper')
		               ifNotNil: [
			               (data at: #implicit_range_upper) size
			               + (data at: #implicit_range_lower) size + 1 ]
		               ifNil: [ (data at: #implicit_range_lower) size ].
		
	self addEndPosOfInt: rangeLength on: data.
	^ (self newEntity: FASTFortranImplicitRange withPosition: data)
		  from: (data at: #implicit_range_lower);
		  to: (data at: #implicit_range_upper);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitImplicitRangeUpper: aString [

	^ aString ifEmpty: [ nil ]
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitImplicitStatement: aNode [
	"start_pos implicit_parameters"

	| data |
	data := super visitImplicitStatement: aNode.
	
	self addEndPosOfArray: (data at: #implicit_parameters) on: data.
	^ (self
		   newLabeledStatement: FASTFortranImplicitStatement
		   withPosition: data)
		  typingRules: (data at: #implicit_parameters);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitInquireStatement: aNode [
	"start_pos control_info_list"

	| data |
	data := super visitInquireStatement: aNode.

	self addEndPosOfArrayPlusParenthes: (data at: #control_info_list) on: data.
	^ (self
		   newLabeledStatement: FASTFortranInquireStatement
		   withPosition: data)
		  ioParameters: (data at: #control_info_list);
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitIntegerType: aNode [

	| position |
	position := self visitJsonMap: aNode keys: #( start_pos ).
	self addEndPosOfInt: 7 on: position.

	^ self newEntity: FASTFortranIntegerType withPosition: position
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitIntrinsicStatement: aNode [
	"start_pos fun_list"

	| data |
	data := super visitIntrinsicStatement: aNode.
	self addEndPosOfArray: (data at: #fun_list) on: data.
	^(self newLabeledStatement: FASTFortranIntrinsicStatement withPosition: data)
		variables: (data at: #fun_list) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitIoList: aCollection [

	^ (super visitIoList: aCollection) collect: [ :each |
		  self variableOrExpression: each ]
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitLabelReference: aNode [

	| data |
	data := super visitLabelReference: aNode.
	self addEndPosOfString: (data at: 'label') on: data.
	^ (self newEntity: FASTFortranLabelReference withPosition: data)
		  label: (aNode at: #label);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitLenSpecification: aNode [
	"#asterisk or #value"

	| data |
	data := super visitLenSpecification: aNode.

	^ data isDictionary
		  ifTrue: [
			  self addEndPosOfString: (data at: #value) on: data.
			  (self newEntity: FASTFortranIntegerLiteral withPosition: data)
				  primitiveValue: (data at: #value) ]
		  ifFalse: [ data ]
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitLiteralExpression: aNode [

	^ super visitLiteralExpression: aNode
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitLogicalConstant: aNode [

	| data |
	data := super visitLogicalConstant: aNode.

	(data at: 'value') = '.TRUE.'
		ifTrue: [
			self addEndPosOfString: '.true.' on: data.
			^ (self newEntity: FASTFortranBooleanLiteral withPosition: data)
				  primitiveValue: true;
				  yourself ]
		ifFalse: [
			self addEndPosOfString: '.false.' on: data.
			^ (self newEntity: FASTFortranBooleanLiteral withPosition: data)
				  primitiveValue: false;
				  yourself ]
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitLogicalFactor: aNode [

	| data |
	data := super visitLogicalFactor: aNode.

	^ data at: 'expression'
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitLogicalIfStatement: aNode [
	"start_pos expression statement"

	| data |
	data := super visitLogicalIfStatement: aNode.
	self addEndPosOfPoint: (data at: #statement) endPos on: data.
	^(self newLabeledStatement: FASTFortranIfLogicalStatement withPosition: data)
		condition: (data at:#expression) ;
		statement: (data at: #statement) ;
		yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitLogicalType: aNode [

	| position |
	position := self visitJsonMap: aNode keys: #( start_pos ).
	self addEndPosOfInt: 4 on: position.

	^ self newEntity: FASTFortranLogicalType withPosition: position
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitLoopControl: aNode [
	"variable_name init limit increment"

	^ self makeLoopControl: (super visitLoopControl: aNode)
]

{ #category : #'visiting prog-unit' }
FASTFortranSyntaxJsonVisitor >> visitMain: aNode [
	"name start_pos end_pos statement_list"

	| data progUnit |
	data := super visitMain: aNode.

	progUnit := (self newEntity: FASTFortranProgramMain withPosition: data)
		statementBlock: (data at: 'statement_list');
	yourself.
	
	(data includesKey: 'name') ifTrue: [ progUnit name: ((data at: 'name') name) ].

	self checkForComments: progUnit.

	^progUnit
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitOpenStatement: aNode [
    "start_pos control_info_list"

	| data |
	data := super visitOpenStatement: aNode.
	self addEndPosOfArrayPlusParenthes: (data at: #control_info_list) on: data.
	^(self newLabeledStatement: FASTFortranOpenStatement withPosition: data)
		ioParameters: (data at: #control_info_list) ;
		yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitParameter: aNode [
	"start_pos name"
   
	| data |
	data := super visitParameter: aNode.
	data = '*' ifTrue: [ ^ self newEntity: FASTFortranAsterisk withPosition: data ].
	
	self addEndPosOfString: (aNode at: 'name') on: data. 
	^ (self newEntity: FASTFortranScalarVariable withPosition: data)
		  name: (aNode at: 'name');
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitParameterAssign: aNode [
	"symbolic_name expression"

    | data |
	data := super visitParameterAssign: aNode.

	self addEndPosOfPoint: (data at: #expression) endPos on: data.
	^(self newEntity: FASTFortranVariableDeclarator withPosition: data)
		name: ((data at: #symbolic_name) name);
		expression: (data at: #expression) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitParameterStatement: aNode [
	" start_pos constant_declarations"

	| data |
	data := super visitParameterStatement: aNode.
	self addEndPosOfArrayPlusParenthes: (data at: #constant_declarations) on: data.
	^(self newLabeledStatement: FASTFortranParameterStatement withPosition: data)
		declarators: (data at: #constant_declarations) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitPauseStatement: aNode [
	"start_pos tag"

	| data return |
	data := super visitPauseStatement: aNode.
	self addEndPosOfInt: 5 on: data.
	return := self newLabeledStatement: FASTFortranPauseStatement withPosition: data.
	data at: #argument ifPresent: [ :arg | return displayArgument: arg; endPos: arg endPos ].
	^return
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitPrintStatement: aNode [
	"start_pos format io_list"

	| data |
	data := super visitPrintStatement: aNode.
	self addEndPosOfArray: (data at: #io_list) on: data.
	^ (self
		   newLabeledStatement: FASTFortranPrintStatement
		   withPosition: data)
		  format: (self variableOrExpression: (data at: #format));
		  arguments: (data at: #io_list);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitProgUnitParameters: aCollection [

	^ (super visitProgUnitParameters: aCollection) collect: [ :each |
		  each asVariable: self ]
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitQualifiersList: aNode [

	^(super visitQualifiersList: aNode) collect: [ :each |
		  self variableOrExpression: each ]
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitReadStatement: aNode [
	"start_pos format control_info_list io_list"

	| data readStatement |
	data := super visitReadStatement: aNode.
	self addEndPosOfArray: (data at: #io_list) on: data.
	readStatement := (self
		                  newLabeledStatement: FASTFortranReadStatement
		                  withPosition: data)
		                 ioParameters:
			                 (data at: #control_info_list ifAbsent: [ #(  ) ]);
		                 arguments: (data at: #io_list);
		                 yourself.

	(data includesKey: #format) ifTrue: [
		readStatement format:
			(self variableOrExpression: (data at: 'format')) ].

	^ readStatement
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitRealType: aNode [

	| position |
	position := self visitJsonMap: aNode keys: #( start_pos ).
	self addEndPosOfInt: 4 on: position.

	^ self newEntity: FASTFortranRealType withPosition: position
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitReturnStatement: aNode [
	"start_pos tag"
	| position |
	position := super visitReturnStatement: aNode.
	self addEndPosOfInt: 6 on: position.
	^ self newLabeledStatement: FASTFortranReturnStatement withPosition: position.
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitRewindStatement: aNode [
    "start_pos control_info_list"

	| data |
	data := super visitRewindStatement: aNode.
	self addEndPosOfArray: (data at: #control_info_list) on: data.
	^(self newLabeledStatement: FASTFortranRewindStatement withPosition: data)
		ioParameters: (data at: #control_info_list) ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitScalarVariable: aNode [

	| data |
	data := super visitScalarVariable: aNode.
	self addEndPosOfPoint: (data at: 'variable_name') endPos on: data.
	^ (self newEntity: FASTFortranScalarVariable withPosition: data)
		  name: (data at: 'variable_name')
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitStatementList: statementCollection [

	| data |
	data := super visitStatementList: statementCollection.

	^ self statementBlockFromStatementList: data
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitStopStatement: aNode [
	"start_pos OPTIONAL(argument)"

	| data return |

	data := super visitStopStatement: aNode.
	self addEndPosUntilEndLineOn: data.
	return := self newLabeledStatement: FASTFortranStopStatement withPosition: data.
	data at: #argument ifPresent: [ :arg | return displayArgument: arg; endPos: arg endPos ].
	^return
]

{ #category : #'visiting prog-unit' }
FASTFortranSyntaxJsonVisitor >> visitSubroutine: aSubroutine [
	"#(start_pos prog_unit_parameters end_pos statement_list name)"

	| data progUnit |
	data := super visitSubroutine: aSubroutine.

	progUnit := (self newEntity: FASTFortranSubroutine withPosition: data)
		name: ((data at: #name) name);
		parameters: (data at: #prog_unit_parameters);
		statementBlock: (data at: #statement_list);
		yourself.

	self checkForComments: progUnit.

	^progUnit
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitSubstring: aNode [

	| data array indices_position endPos |
	data := super visitSubstring: aNode.
	endPos := (data at: 'upper_bound') endPos.

	array := (self newEntity: FASTFortranArrayVariable withPosition: data)
		         name: (data at: 'variable_name') name;
		         endPos: endPos.


	indices_position := Dictionary new
		                    at: 'start_pos'
		                    put: (data at: 'lower_bound') startPos;
		                    yourself.

	array indices add:
		((self
			  newEntity: FASTFortranArrayRange
			  withPosition: indices_position)
			 lowerBound: (data at: 'lower_bound');
			 upperBound: (data at: 'upper_bound');
			 endPos: endPos).

	^ array
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitSymbolicName: aNode [

	| data |
	data := super visitSymbolicName: aNode.
	self addEndPosOfString: (data at: 'name') on: data.

	^ TemporalSymbolicName new
		  data: data;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitThenStatements: aNode [

	^self statementBlockFromStatementList: (super visitThenStatements: aNode)
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitTypeReference: aNode [

	| data return |
	data := super visitTypeReference: aNode.
	
	return := data at: #name.
	return startPos: (data at: 'start_pos').
	data at: #len_specification ifPresent: [ :size |
		return endPos: size endPos.
		return size: size ].
	^ return
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitTypeStatement: aNode [
	"start_pos tag declarators type"

	| data |
	data := super visitTypeStatement: aNode.
	1 halt. "no one called this method"
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
	1 halt. "No one called this method, candidate for deletion"
	
	^ (self newEntity: FASTFortranUnaryExpression withPosition: data)
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
	self addEndPosOfArray: (data at: #labels) on: data.
	^(self newLabeledStatement: FASTFortranGoToStatement withPosition: data)
		labelReferences: (data at: #labels) ;
		yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitUndefinedType: aNode [

	| position |
	position := self visitJsonMap: aNode keys: #( start_pos ).
	self addEndPosOfInt: 9 on: position.

	^ self
		  newEntity: FASTFortranImplicitUndefinedType
		  withPosition: position
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitUnsignedIntConstant: aNode [

	| data |
	data := super visitUnsignedIntConstant: aNode.
	
	self addEndPosOfString: (data at: 'value') on: data.
	^ (self newEntity: FASTFortranIntegerLiteral withPosition: data)
		  primitiveValue: (data at: 'value');
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitUnsignedRealConstant: aNode [

	| data |
	data := super visitUnsignedRealConstant: aNode.
	self addEndPosOfString: (data at: 'value') on: data. 
	^ (self newEntity: FASTFortranRealLiteral withPosition: data)
		  primitiveValue: (data at: 'value');
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitVariable: aNode [

	^ super visitVariable: aNode
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitVariableDeclarationStatement: aNode [
	"start_pos tag declarators type"

	| data |
	data := super visitVariableDeclarationStatement: aNode.

	self addEndPosOfArray: (data at: 'declarators') on: data.
	^ (self newLabeledStatement: FASTFortranVariableDeclarationStatement withPosition: data)
		  type: (data at: 'type');
		  declarators: (data at: 'declarators');
		  yourself
]

{ #category : #visiting }
FASTFortranSyntaxJsonVisitor >> visitVariableDeclarator: aNode [
	"variable dimension_declarators expression"

	| data return |
	data := super visitVariableDeclarator: aNode.
	return := (self
		           newEntity: FASTFortranVariableDeclarator
		           withPosition: data)
		          name: (data at: #variable_name) name;
		          endPos: (data at: #variable_name) endPos;
		          yourself.

	data at: #dimension_declarators ifPresent: [ :dimensions |
		dimensions isNotEmpty ifTrue: [
			| endPosD  |
			endPosD := dimensions last endPos.
			return
				dimensions: dimensions;
				endPos: (endPosD x)@(endPosD y + 1) ] ].

	data at: #expression ifPresent: [ :initial_value |
		return
			expression: initial_value;
			endPos: initial_value endPos ].

	^ return
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitVariableExpression: aNode [

	^ (super visitVariableExpression: aNode) at: 'variable_name'
]

{ #category : #'visiting expression' }
FASTFortranSyntaxJsonVisitor >> visitVariableName: aNode [
	"start_pos name"

	| data |
	data := super visitVariableName: aNode.
	self addEndPosOfString: (data at: 'name') on: data.
	^ (self newEntity: FASTFortranScalarVariable withPosition: data)
		  name: (data at: #name);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranSyntaxJsonVisitor >> visitWriteStatement: aNode [
    "start_pos control_info_list io_list"

	| data |
	data := super visitWriteStatement: aNode.
	self addEndPosOfArray: (data at: #io_list) on: data.
	^(self newLabeledStatement: FASTFortranWriteStatement withPosition: data)
		ioParameters: (data at: #control_info_list) ;
		arguments: (data at: #io_list) ;
		yourself
]
