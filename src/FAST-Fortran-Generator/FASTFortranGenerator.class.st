Class {
	#name : 'FASTFortranGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'acceptStatement',
		'assignmentStatement',
		'automaticStatement',
		'backspaceStatement',
		'blockData',
		'callStatement',
		'closeStatement',
		'comment',
		'commonStatement',
		'continueStatement',
		'dataStatement',
		'decodeStatement',
		'encodeStatement',
		'dimensionStatement',
		'doStatement',
		'doWhileStatement',
		'elseStatement',
		'endFileStatement',
		'entryStatement',
		'equivalenceStatement',
		'externalStatement',
		'formatStatement',
		'function',
		'ifArithmeticStatement',
		'ifBlockStatement',
		'ifLogicalStatement',
		'implicitStatement',
		'includeStatement',
		'inquireStatement',
		'intrinsicStatement',
		'mainprogram',
		'mapStatement',
		'nameListStatement',
		'openStatement',
		'optionsStatement',
		'parameterStatement',
		'pauseStatement',
		'pragmaStatement',
		'printStatement',
		'procedure',
		'programUnit',
		'readStatement',
		'rewindStatement',
		'saveStatement',
		'staticStatement',
		'subprogram',
		'substring',
		'stopStatement',
		'subroutine',
		'unionStatement',
		'virtualStatement',
		'volatileStatement',
		'writeStatement',
		'complexConstant',
		'type',
		'byteType',
		'characterType',
		'complexType',
		'doubleComplexType',
		'doublePrecisionType',
		'integerType',
		'logicalType',
		'realType',
		'exitStatement',
		'doubleComplexConstant',
		'doublePrecisionConstant',
		'integerConstant',
		'realConstant',
		'asterisk',
		'ampersand',
		'functionStatement',
		'returnStatement',
		'variable',
		'binaryExpression',
		'unaryExpression',
		'programFile',
		'functionCall',
		'booleanConstant',
		'characterConstant',
		'statementBlock',
		'assignmentExpression',
		'tEntryArgument',
		'dataGroup',
		'abstractStatement',
		'abstractExpression',
		'abstractLiteral',
		'scalarVariable',
		'arrayVariable',
		'variableDeclarationStatement',
		'tWithDeclarators',
		'variableDeclarator',
		'commonGroup',
		'equivalenceGroup',
		'tVariableGroup',
		'tWithVariableGroup',
		'tWithFormat',
		'tFormat',
		'tIOParameter',
		'arrayRange',
		'implicitTypingRule',
		'implicitRange',
		'impliedDoExpression',
		'tWithLoopControl',
		'abstractIOStatement',
		'numericalConstant',
		'conditionalStatement',
		'tEntity',
		'tBehaviouralEntity',
		'tNamedEntity',
		'tWithParameters',
		'tWithComments',
		'tComment',
		'tStatement',
		'tAssignment',
		'tWithArguments',
		'tReturnStatement',
		'tStatementBlock',
		'tExpression',
		'tCharacterLiteral',
		'tBooleanLiteral',
		'tNumericalLiteral',
		'tUnaryExpression',
		'tBinaryExpression',
		'tVariableEntity',
		'entity',
		'tDeclaration',
		'tWithDeclarations',
		'fieldAccess',
		'ioParameter',
		'tDeclaredType',
		'functionTypeDeclarationStatement',
		'functionReturnStatement',
		'includedFile',
		'tConditionalStatement',
		'tLoopStatement',
		'tBranchStatement',
		'loopControlBlock',
		'tGotoStatement',
		'tLabeledStatement',
		'gotoComputed',
		'gotoStatement',
		'gotoAssignedStatement'
	],
	#category : 'FAST-Fortran-Generator',
	#package : 'FAST-Fortran-Generator'
}

{ #category : 'generating' }
FASTFortranGenerator class >> generate [

	"TODO: can it be removed? As FamixMetamodelGenerator class has generate"

	<script>
	^ super generate
]

{ #category : 'generating' }
FASTFortranGenerator class >> packageName [

	^ #'FAST-Fortran-Entities'
]

{ #category : 'generating' }
FASTFortranGenerator class >> prefix [

	^ #FASTFortran
]

{ #category : 'generating' }
FASTFortranGenerator class >> submetamodels [

	^ { FASTMetamodelGenerator }
]

{ #category : 'definition' }
FASTFortranGenerator >> commentForIOParameter [
	^'I represent a specifier keywords used in I/O statement (open, write, read, close, ...).

where the most common specifiers are:

```fortran
    [UNIT=]  u
    IOSTAT=  ios
    ERR=     err
    FILE=    fname
    STATUS=  sta
    ACCESS=  acc
    FORM=    frm
    RECL=    rl
```
	
	'
]

{ #category : 'definition' }
FASTFortranGenerator >> defineClasses [

	super defineClasses.

	self defineFASTClasses. 
	self defineStatements.
	self defineData
]

{ #category : 'definition' }
FASTFortranGenerator >> defineData [
	"sorted alphabetically, please keep the order"

	abstractExpression := self
		                   newClassNamed: #AbstractExpression
		                   comment: 'I am the super class of all Fortran expressions'.

	abstractLiteral := self
		                   newClassNamed: #AbstractLiteral
		                   comment: 'I am the super class of all Fortran Literals'.

	ampersand := self
		             newClassNamed: #Ampersand
		             comment:
		             'I represent an Ampersand Character Literal (Constant) that is often used in parameters and format identifiers'.

	arrayRange := self
		                            newClassNamed: #ArrayRange
		                            comment:
		                            'I represent an array lower/upper bounds'.

	arrayVariable := self
		                            newClassNamed: #ArrayVariable
		                            comment:
		                            'An array Fortran Variable, accessed in the code'.

	assignmentExpression := self
		                        newClassNamed: #AssignmentExpression
		                        comment:
		                        'I represent an assignment expression as a part of assignment statement'.

	asterisk := self
		            newClassNamed: #Asterisk
		            comment:
		            'I represent an Asterisk Character Literal (Constant) that is often used as a format identifier'.

	binaryExpression := self
		                    newClassNamed: #BinaryExpression
		                    comment:
		                    'a Fortran Binary Expression (arithmetic, logical)'.

	booleanConstant := self
		                   newClassNamed: #BooleanLiteral
		                   comment:
		                   'I represent Fortran Boolean Literal (Constant)'.

	byteType := self
		            newClassNamed: #ByteType
		            comment:
			            'I represent Fortran Byte statement. The BYTE data type provides a data type that uses only one byte of storage. It is a logical data type, and has the synonym,
LOGICAL*1. A variable of type BYTE can hold any of the following: 1)one character, 2)an integer between -128 and 127, 3)the logical values, .TRUE. or .FALSE. If it is interpreted as a logical value, a value of 0 represents .FALSE., and any other value is interpreted as .TRUE.
f77 allows the BYTE type as an array index, just as it allows the REAL type, but it does not allow BYTE as a DO loop index (where it allows only INTEGER, REAL, and DOUBLE PRECISION). Wherever the compiler expects INTEGER explicitly, it will not allow BYTE.'.

	characterConstant := self
		                     newClassNamed: #CharacterLiteral
		                     comment:
		                     'I represent Fortran Character Literal (Constant)'.

	characterType := self
		                 newClassNamed: #CharacterType
		                 comment:
		                 'I represent Fortran Character Literal'.

	commonGroup := self
		                   newClassNamed: #CommonGroup
		                   comment: 'I represent Common group inside a Common statement'.

	complexConstant := self
		                   newClassNamed: #ComplexLiteral
		                   comment:
		                   'I represent Fortran Arithmetic Complex Literal (Constant)'.

	complexType := self
		               newClassNamed: #ComplexType
		               comment:
		               'I represent Fortran Complex type COMPLEX, ie. a pair of REAL*4 values'.

	doubleComplexConstant := self
		                         newClassNamed: #DoubleComplexLiteral
		                         comment:
		                         'I represent Fortran Arithmetic Double Complex Literal (Constant)'.

	doubleComplexType := self
		                     newClassNamed: #DoubleComplexType
		                     comment:
		                     'I represent Fortran Double type'.

	doublePrecisionConstant := self
		                           newClassNamed: #DoublePrecisionLiteral
		                           comment:
		                           'I represent Fortran Arithmetic Double Precision Literal (Constant)'.

	doublePrecisionType := self
		                       newClassNamed: #DoublePrecisionType
		                       comment:
		                       'I represent Fortran Double Precision type, synonym of REAL*8'.

	fieldAccess := self
		                   newClassNamed: #FieldAccess
		                   comment:
		                   'I represent an access to pointer.field in Esope (therefore an expression)'.

	impliedDoExpression := self
		                   newClassNamed: #ImpliedDoExpression
		                   comment:
		                   'I represent a Fortran "implied do" expression'.

	integerConstant := self
		                   newClassNamed: #IntegerLiteral
		                   comment:
		                   'I represent Fortran Arithmetic Integer Literal (Constant)'.

	integerType := self
		               newClassNamed: #IntegerType
		               comment:
			               'I represent Fortran Integer type'.

	logicalType := self
		               newClassNamed: #LogicalType
		               comment:
		               'I represent Fortran boolean type'.

	loopControlBlock := self
		                         newClassNamed: #LoopControlExpression
		                         comment:
		                         'a Fortran Loop Control Expression'.

	numericalConstant := self
		newClassNamed: #NumericalConstant
		comment: 'I represent Fortran numerical Literals (Integer, Real, Complex)'.

	realConstant := self
		                newClassNamed: #RealLiteral
		                comment:
		                'I represent Fortran Arithmetic Real Literal (Constant)'.

	realType := self
		            newClassNamed: #RealType
		            comment:
		            'I represent Fortran Real type, synonym REAL*4'.

	scalarVariable := self
		                             newClassNamed: #ScalarVariable
		                             comment:
		                             'a scalar Fortran Variable, used in declarations'.

	substring := self
		             newClassNamed: #Substring
		             comment: 'I represent Fortran Substring'.

	type := self
		        newClassNamed: #Type
		        comment: 'I represent Fortran Type statement'.

	variable := self
		            newClassNamed: #Variable
		            comment:
		            'an abstract Fortran Variable, could be an array or a scalar'.

	variableDeclarator := self
		            newClassNamed: #VariableDeclarator
		            comment:
		            'Part of a variable declaration: name of the variable + optional initial value'.

	unaryExpression := self
		                   newClassNamed: #UnaryExpression
		                   comment:
		                   'a Fortran Unary Expression (arithmetic, logical, character)'

]

{ #category : 'definition' }
FASTFortranGenerator >> defineFASTClasses [
	"FAMIX-level classes (might be removed later)"

	entity  := self newClassNamed: #Entity.

	blockData := self
		newClassNamed: #BlockData
		comment: 'The BLOCK DATA statement identifies a subprogram that initializes variables and arrays in labeled common blocks.'.

	comment := self
		newClassNamed: #Comment
		comment: 'A fortran comment'.

	function := self
		newClassNamed: #Function
		comment: 'I represent a Fortran Function'.
	
	functionCall := self
		 newClassNamed: #FunctionCall
		 comment: 'I represent a call to a function (or function statement)'.

	includedFile := self
		newClassNamed: #IncludedFile
		comment: 'A virtual entity representing all the content of an included file'.

	ioParameter := self
		newClassNamed: #IOParameter
		comment: self commentForIOParameter.

	mainprogram := self
		 newClassNamed: #ProgramMain
		 comment: 'The PROGRAM statement identifies the program unit as a main program. program. For the loader, the main program is always named MAIN. The PROGRAM statement serves only the person who reads the program'.

	procedure := self
		 newClassNamed: #Procedure
		 comment: 'I represent a fortran subroutine or a function'.

	programFile := self
		newClassNamed: #ProgramFile
		comment: 'An entity that can contain fortran program units and comments'.

	programUnit := self
		newClassNamed: #ProgramUnit
		comment:
		               'A fortran program unit is a sequence of statements, terminated by an END statement. Every program unit is either a main program or a subprogram. If a program is to be executable, it must have a main program'.

	subprogram := self
		newClassNamed: #Subprogram
		comment: 'I represent a fortran subprogram: procedure or block data'.

	subroutine := self
		 newClassNamed: #Subroutine
		 comment: 'The SUBROUTINE statement identifies a subprogram, a named program unit as a subroutine, and specifies arguments for it'.

]

{ #category : 'definition' }
FASTFortranGenerator >> defineHierarchy [

	super defineHierarchy.

	entity --|> tEntity.

	"An IncludedFile is a virtual entity that represent a file included it can have comments,
	 declarations or statements
	 Also we want it to be a programUnit to be retrived by Carrefour as a rootEntity"
	includedFile --|> programUnit.

	programUnit --|> tEntity.
	programUnit --|> tBehaviouralEntity.
	programUnit --|> tWithDeclarations.
	programUnit --|> tNamedEntity.
	subprogram --|> programUnit.
	mainprogram --|> programUnit.
	procedure --|> subprogram.
	procedure --|> tWithParameters.
	blockData --|> subprogram.
	function --|> procedure.
	function --|> tDeclaredType.
	subroutine --|> procedure.

	programFile --|> tWithComments.
	programFile --|> tWithDeclarations.

	programUnit --|> tWithComments.

	"other entities"
	comment --|> tEntity.
	comment --|> tComment.
	comment --|> abstractStatement.

	"FORTRAN STATEMENTS"
	abstractStatement --|> tStatement.
	abstractIOStatement --|> abstractStatement.
	acceptStatement --|> abstractStatement.
	assignmentStatement --|> abstractStatement.
	assignmentStatement --|> tAssignment.
	automaticStatement --|> abstractStatement.
	backspaceStatement --|> abstractIOStatement.
	callStatement --|> abstractStatement.
	callStatement --|> tWithArguments.
	closeStatement --|> abstractIOStatement.
	commonStatement --|> abstractStatement.
	conditionalStatement --|> abstractStatement.
	conditionalStatement --|> tConditionalStatement.
	continueStatement --|> abstractStatement.
	dataStatement --|> abstractStatement.
	dataStatement --|> tWithVariableGroup.
	decodeStatement --|> abstractIOStatement.
	dimensionStatement --|> abstractStatement.
	dimensionStatement --|> tWithDeclarators.
	doStatement --|> abstractStatement.
	doStatement --|> tLoopStatement.
	doStatement --|> tWithLoopControl.
	doWhileStatement --|> abstractStatement.
	doWhileStatement --|> tLoopStatement.
	elseStatement --|> abstractStatement.
	encodeStatement --|> abstractIOStatement.
	endFileStatement --|> abstractIOStatement.
	entryStatement --|> abstractStatement.
	entryStatement --|> tNamedEntity.
	equivalenceStatement --|> abstractStatement.
	equivalenceStatement --|> tWithVariableGroup.
	exitStatement --|> abstractStatement.
	externalStatement --|> abstractStatement.
	externalStatement --|> tNamedEntity.
	formatStatement --|> abstractStatement.
	formatStatement --|> tWithFormat.
	functionStatement --|> abstractStatement.
	functionStatement --|> tWithParameters.
	functionStatement --|> tNamedEntity.
	functionTypeDeclarationStatement --|> abstractStatement.
	functionTypeDeclarationStatement --|> tNamedEntity.
	functionTypeDeclarationStatement --|> tDeclaredType.
	functionReturnStatement --|> tNamedEntity. "we use the name to track the function name"
	functionReturnStatement --|> tReturnStatement. "not the same as return statement (the keyword)"
	gotoStatement --|> abstractStatement.
	gotoStatement --|> tGotoStatement.
	gotoAssignedStatement --|> abstractStatement.
	gotoAssignedStatement --|> tBranchStatement.
	gotoComputed --|> abstractStatement.
	gotoComputed --|> tBranchStatement.
	ifArithmeticStatement --|> abstractStatement.
	ifArithmeticStatement --|> tBranchStatement.
	ifBlockStatement --|> conditionalStatement.
	ifLogicalStatement --|> conditionalStatement.
	implicitStatement --|> abstractStatement.
	includeStatement --|> abstractStatement.
	inquireStatement --|> abstractIOStatement.
	intrinsicStatement --|> abstractStatement.
	intrinsicStatement --|> tVariableGroup.
	mapStatement --|> abstractStatement.
	nameListStatement --|> abstractStatement.
	openStatement --|> abstractIOStatement.
	optionsStatement --|> abstractStatement.
	parameterStatement --|> abstractStatement.
	parameterStatement --|> tWithDeclarators.
	pauseStatement --|> abstractStatement.
	pragmaStatement --|> abstractStatement.
	printStatement --|> abstractStatement.
	printStatement --|> tWithFormat.
	printStatement --|> tWithArguments.
	readStatement --|> abstractIOStatement.
	readStatement --|> tWithArguments.
	returnStatement --|> abstractStatement.
	returnStatement --|> tReturnStatement.
	rewindStatement --|> abstractIOStatement.
	saveStatement --|> abstractStatement.
	statementBlock --|> tStatementBlock.
	statementBlock --|> tWithComments.
	staticStatement --|> abstractStatement.
	stopStatement --|> abstractStatement.
	unionStatement --|> abstractStatement.
	variableDeclarationStatement --|> tDeclaredType.
	variableDeclarationStatement --|> abstractStatement.
	variableDeclarationStatement --|> tWithDeclarators.
	virtualStatement --|> abstractStatement.
	volatileStatement --|> abstractStatement.
	writeStatement --|> abstractIOStatement.
	writeStatement --|> tWithArguments.


	"Expressions"
	abstractExpression --|> tExpression.
	abstractLiteral --|> abstractExpression.
	ampersand --|> abstractLiteral.
	ampersand --|> tCharacterLiteral.
	arrayRange --|> abstractExpression.
	arrayVariable --|> variable.
	assignmentExpression --|> abstractExpression.
	assignmentExpression --|> tAssignment.
	assignmentExpression --|> tIOParameter.
	binaryExpression --|> abstractExpression.
	binaryExpression --|> tBinaryExpression.
	booleanConstant --|> abstractLiteral.
	booleanConstant --|> tBooleanLiteral.
	characterConstant --|> abstractLiteral.
	characterConstant --|> tCharacterLiteral.
	characterConstant --|> tFormat.
	commonGroup --|> tWithDeclarators.
	commonGroup --|> tNamedEntity.
	complexConstant --|> numericalConstant.
	dataGroup --|> tVariableGroup.
	doubleComplexConstant --|> numericalConstant.
	doublePrecisionConstant --|> numericalConstant.
	equivalenceGroup --|> tVariableGroup.
	fieldAccess --|> variable.
	functionCall --|> abstractExpression.
	functionCall --|> tWithArguments.
	impliedDoExpression --|> tWithLoopControl.
	impliedDoExpression --|> abstractExpression.
	impliedDoExpression --|> tVariableGroup.
	integerConstant --|> numericalConstant.
	integerConstant --|> tFormat.
	ioParameter --|> tNamedEntity.
	ioParameter --|> tIOParameter.
	numericalConstant --|> abstractLiteral.
	numericalConstant --|> tNumericalLiteral.
	realConstant --|> numericalConstant.
	scalarVariable --|> variable.
	substring --|> abstractExpression.
	unaryExpression --|> abstractExpression.
	unaryExpression --|> tUnaryExpression.
	variable --|> abstractExpression.
	variable --|> tVariableEntity.
	variable --|> tEntryArgument.
	variable --|> tFormat.
	variableDeclarator --|> tNamedEntity.

	"types"
	byteType --|> type.
	characterType --|> type.
	complexType --|> type.
	doubleComplexType --|> type.
	doublePrecisionType --|> type.
	integerType --|> type.
	logicalType --|> type.
	realType --|> type.

	asterisk --|> integerConstant. "used as type size"
	asterisk --|> tEntryArgument.
	asterisk --|> tFormat.

	tFormat --|> tIOParameter.
]

{ #category : 'definition' }
FASTFortranGenerator >> defineProperties [

	super defineProperties.

	(callStatement property: #name type: #String)
		comment: 'Name of called entity (a subroutine)'.

	(doStatement property: #doLabel type: #String)
		comment: 'A label to come back to, at the end of the DO loop'.

	(formatStatement property: #formatDescription type: #String).

	(functionCall property: #name type: #String)
		comment: 'Name of called function'.

	(implicitRange property: #from type: #String)
		comment: 'Start of character range for implicit rule'.

	(implicitRange property: #to type: #String)
		comment: 'End of character range for implicit rule'.

	(programFile property: #filename type: #String).

	(returnStatement property: #alternateReturnLabel type: #String)
		comment: 'Optional. Expression of type INTEGER or REAL'.

	(pauseStatement property: #displayArgument type: #String)
		comment: 'Optional. Displayed when the program pauses. String of no more that 5 digits or a character constant'.

	(stopStatement property: #displayArgument type: #String)
		comment: 'Optional. Displayed when the program stops. String of no more that 5 digits or a character constant'.

	(tBinaryExpression property: #operator type: #String)
		comment: 'Binary expression operator'.

	(abstractStatement property: #label type: #String)
		comment: 'Determines the statement label which consists of 1 to 5 digits, with at least one nonzero'.

]

{ #category : 'definition' }
FASTFortranGenerator >> defineRelations [

	super defineRelations.

	((abstractIOStatement property: #ioParameters) comment: 'IO-Parameters of an IO-statement (READ, WRITE...)')
	<>-* (tIOParameter property: #parentIOStatement).

	((arrayRange property: #upperBound) comment: 'An upper bound of an array dimension')
	<>- ((abstractExpression property: #parentArrayDimensionDeclarator) comment:
			 'Parent array dimension declarator').

	((arrayRange property: #lowerBound) comment: 'A lower bound of an array dimension')
	<>- ((abstractExpression property: #parentArrayDimensionDeclarator) comment:
			 'Parent array dimension declarator').

	((arrayVariable property: #indices) comment: 'Indices used in the array access')
	<>-* ((abstractExpression property: #parentArrayExpression) comment: 'an ArrayVariable expression of which I am an indice').

	((commonStatement property: #groups) comment:
		 'List common groups in this common statement')
	<>-* ((commonGroup property: #parentCommonStatement) comment:
			 'Parent common statement I belong to').

	(dataGroup property: #dataConstants)
	<>-* (abstractExpression property: #parentDataStatement).

	((tDeclaredType property: #declaredType) comment: 'type')
	<>-
	((type property: #parentDeclaration) comment: 'Parent declaration').

	(entryStatement property: #entryArguments)
	<>-* (tEntryArgument property: #entryStatement).

	(fieldAccess property: #pointer)
	<>- ((variable property: #pointerIn) comment: 'Parent FieldAccess in which receiver is a pointer').

	(fieldAccess property: #field)
	<>- ((variable property: #fieldIn) comment: 'Parent FieldAccess in which receiver is a field').

	((functionStatement property: #expression) comment:
		 'Expression thats being assigned upon declaration to the var')
	<>- ((abstractExpression property: #assignementExpressionOwner) comment:
			 'The AssignementExpression owner (if possible)').

	(implicitStatement property: #typingRules)
	<>-* (implicitTypingRule property: #parentImplicitStatement).

	implicitTypingRule
	<>- (type property: #parentImplicitRule).

	(implicitTypingRule property: #ranges)
	<>-* (implicitRange property: #parentImplicitRule).

	(impliedDoExpression property: #variables)
	<>-* (tVariableEntity property: #parentImpliedExpression).

	((ioParameter property: #expression) comment: 
		'value of the parameter (keyword argument)')
	<>- ((tExpression property: #ioSpecifier) comment: 
		'name of the parameter (keyword argument)').

	((loopControlBlock property: #init) comment:
		 'initial assignment')
	<>- (assignmentExpression property: #parentLoopControlInitialization).

	((loopControlBlock property: #increment) comment:
		'Loop control increment value')
	<>- (abstractExpression property: #parentLoopControlIncrement).

	((loopControlBlock property: #limit) comment:
		'Loop control limit value')
	<>- (abstractExpression property: #parentLoopControlLimit).

	(programFile comment: 'Program Units in a program file')
	<>-* (programUnit comment: 'Parent program file').

	((type property: #size) comment: 'a data size in bytes')
	<>- (abstractExpression property: #parentTypeSize).

	((variableDeclarator property: #dimensions) comment: 'Possible dimensions in case this is an array declaration')
	<>-* ((arrayRange property: #parentVariableDeclarator)
			comment: 'The variable declarator I am part of').

	((variableDeclarator property: #expression) comment:
		 'Expression assigned to the variable declared')
	<>- (abstractExpression property: #variableDeclaratorOwner) .

	(tVariableGroup property: #variables)
	<>-* (variable property: #parentVariableGroup).

	tWithVariableGroup <>-* tVariableGroup.
	
	((tWithDeclarators property: #declarators) comment: 'variables declared')
	<>-* (variableDeclarator property: #parentDeclaration).

	((tWithDeclarations property: #declarations) comment:
		 'The elements I declare')
	<>-* ((tDeclaration property: #fortranDeclarationOwner) comment:
			 'The element that declares me').
	
	((tWithFormat property: #format) comment: 'The description of the format')
	<>- ((tFormat property: #parentFormatedStatement) comment: 'A format description in a Format/Print/Read/Write statement').

	((tWithLoopControl property: #loopControl) comment: 'loop control')
	<>-
	((loopControlBlock property: #parentLoop) comment: 'Parent loop').

]

{ #category : 'definition' }
FASTFortranGenerator >> defineStatements [
	"A statement consists of zero or more key words, symbolic names, literal constants, statement labels, operators, and special characters."

	abstractStatement := self newClassNamed: #AbstractStatement
		comment: 'I am the super class of all Fortran statements'.

	abstractIOStatement := self newClassNamed: #AbstractIOStatement
		comment: 'I am the abstract superclass of all IO-statements (READ, WRITE, CLOSE, ENCODE...)'.

	acceptStatement := self newClassNamed: #AcceptStatement
		comment: 'I represent Fortran accept statement'.

	assignmentStatement := self newClassNamed: #AssignmentStatement
		comment: 'I represent Fortran assignment made without ASSIGN statement'.

	automaticStatement := self newClassNamed: #AutomaticStatement
		comment: 'I represent Fortran Automatic statement'.
	backspaceStatement := self newClassNamed: #BackspaceStatement
		comment: 'I represent Fortran Backspace statement'.
	callStatement := self newClassNamed: #CallStatement
		comment: 'I represent Fortran Call statement'.
	closeStatement := self newClassNamed: #CloseStatement
		comment: 'I represent Fortran Close statement'.
	commonStatement := self newClassNamed: #CommonStatement
		comment: 'I represent Fortran Common statement'.
	conditionalStatement := self
		newClassNamed: #ConditionalStatement
		comment: 'I represent a fortran statement with a condition: if-block, if-logical'.
	continueStatement := self newClassNamed: #ContinueStatement
		comment: 'I represent Fortran Continue statement'.
	dataStatement := self newClassNamed: #DataStatement
		comment: 'I represent a Fortran Data statement'.

	dataGroup := self newClassNamed: #DataGroup
		comment: 'I represent a Fortran Data group in a Data statement'.
	decodeStatement := self newClassNamed: #DecodeStatement
		comment: 'I represent Fortran Decode statement'.
	encodeStatement := self newClassNamed: #EncodeStatement
		comment: 'I represent Fortran Encode statement'.
	dimensionStatement := self newClassNamed: #DimensionStatement
		comment: 'I represent FortranDimension statement'.
	doStatement := self newClassNamed: #DoStatement
		comment: 'I represent Fortran Do statement'.
	doWhileStatement := self newClassNamed: #DoWhileStatement
		comment: 'I represent Fortran Do While statement'.
	elseStatement := self newClassNamed: #ElseStatement
		comment: 'I represent Fortran Else statement'.
	endFileStatement := self newClassNamed: #EndFileStatement
		comment: 'I represent Fortran End File statement'.

	entryStatement := self newClassNamed: #EntryStatement
		comment: 'I represent Fortran Entry statement'.
	equivalenceGroup := self newClassNamed: #EquivalenceGroup
		comment: 'I represent a group of variables in an Equivalence statement'.
	equivalenceStatement := self newClassNamed: #EquivalenceStatement
		comment: 'I represent a Fortran Equivalence statement'.
	externalStatement := self newClassNamed: #ExternalStatement
		comment: 'I represent Fortran External statement'.
	formatStatement := self newClassNamed: #FormatStatement
		comment: 'I represent Fortran Format statement'.

	functionStatement := self newClassNamed: #FunctionStatement
		comment: 'I represent a function statement - a function-like declaration, made in a single statement'.
		
	functionTypeDeclarationStatement := self newClassNamed: #FunctionTypeDeclarationStatement
		comment: 'I represent a return type declaration statement'.

	functionReturnStatement := self
		newClassNamed: #FunctionReturnStatement
		comment: 'I represent a return (not related to return keyword) for a function'.

	gotoStatement := self newClassNamed: #GotoStatement
		comment: 'I represent Fortran Go To (unconditional) statement'.

	gotoAssignedStatement := self newClassNamed: #GotoAssignedStatement
		comment: 'I represent Fortran Go To( Assigned) statement'.
	gotoComputed := self newClassNamed: #GotoComputedStatement
		comment: 'I represent Fortran GOTO (Computed) statement'.

	ifArithmeticStatement := self newClassNamed: #IfArithmeticStatement
	  	comment: 'I represent Fortran If (Arithmetic) statement'.
	ifBlockStatement := self newClassNamed: #IfBlockStatement
		comment: 'I represent Fortran If (BLock) statement'.
	ifLogicalStatement := self newClassNamed: #IfLogicalStatement
		comment: 'The logical IF statement executes one single statement, or does not execute it, depending on the value of a logical expression.'.
	implicitStatement := self newClassNamed: #ImplicitStatement
		comment: 'I represent Fortran Implicit statement'.

	implicitTypingRule := self newClassNamed: #ImplicitTypingRule
		comment: 'I represent a rule (ie. Type+letter range) in an Implicit statement'.

	implicitRange := self newClassNamed: #ImplicitRange
		comment: 'I represent a range of characters in an Implicit statement'.

	includeStatement := self newClassNamed: #IncludeStatement
		comment: 'I represent Fortran Include statement'.
	inquireStatement := self newClassNamed: #InquireStatement
		comment: 'I represent Fortran Inquire statement'.
	intrinsicStatement := self newClassNamed: #IntrinsicStatement
		comment:
		                      'I represent Fortran Intrinsic statement'.
	mapStatement := self newClassNamed: #MapStatement
		comment: 'I represent Fortran Map statement'.
	nameListStatement := self newClassNamed: #NameListStatement
		comment: 'I represent Fortran NameList statement'.
	openStatement := self newClassNamed: #OpenStatement
		comment: 'I represent Fortran Open statement'.
	optionsStatement := self newClassNamed: #OptionsStatement
		comment: 'I represent Fortran Options statement'.
	parameterStatement := self newClassNamed: #ParameterStatement
		comment: 'I represent Fortran Parameter statement'.
	pauseStatement := self newClassNamed: #PauseStatement
		comment: 'I represent Fortran Pause statement'.
	pragmaStatement := self newClassNamed: #PragmaStatement
		comment: 'I represent Fortran Pragma statement'.
	printStatement := self newClassNamed: #PrintStatement
		comment: 'I represent Fortran Print statement'.

	readStatement := self newClassNamed: #ReadStatement
		comment: 'I represent Fortran Read statement'.

	returnStatement := self newClassNamed: #ReturnStatement
		comment: 'a Fortran Return Statement'.

	rewindStatement := self newClassNamed: #RewindStatement
		comment: 'I represent Fortran Rewind statement'.
	saveStatement := self newClassNamed: #SaveStatement
		comment: 'I represent Fortran Save statement'.

	statementBlock := self
		newClassNamed: #StatementBlock
		comment: 'Contains the block of Fortran statements'.

	staticStatement := self newClassNamed: #StaticStatement
		comment: 'I represent Fortran Static statement'.
	stopStatement := self newClassNamed: #StopStatement
		comment: 'I represent Fortran Stop statement'.
	unionStatement := self newClassNamed: #UnionStatement
		comment: 'I represent Fortran Union statement'.

	variableDeclarationStatement := self newClassNamed: #VariableDeclarationStatement
	  	comment: 'I represent a type declaration for one or many scalar variables or arrays'.	

	virtualStatement := self newClassNamed: #VirtualStatement
		comment: 'I represent Fortran Virtual statement'.
	volatileStatement := self newClassNamed: #VolatileStatement
		comment: 'I represent Fortran Volatile statement'.
	writeStatement := self newClassNamed: #WriteStatement
		comment: 'I represent Fortran Write statement'.

	"NOT IN THE 77 STANDARD"
	exitStatement := self newClassNamed: #ExitStatement
		comment: 'I represent Fortran90 Exit statement'
]

{ #category : 'definition' }
FASTFortranGenerator >> defineTraits [

	super defineTraits.

	tEntryArgument := self newTraitNamed: #TEntryArgument comment: 'I represent an argument in an entry statement: it can be a variable name, array name, formal procedure name, or an asterisk'.
	tDeclaration := self newTraitNamed: #TDeclaration comment: 'I am a declaration in fortran'.
	tDeclaredType := self newTraitNamed: #TDeclaredType comment: 'I am the declared type of a function or variable'.
	tFormat := self newTraitNamed: #TFormat comment: 'I represent a format description (eg. in Format or Print statement)'.
	tIOParameter := self newTraitNamed: #TIOParameter comment: 'I represent a parameter to an IO-statement (read or write)'.
	tVariableGroup := self newTraitNamed: #TVariableGroup comment: 'I represent an entity with several variables like in a DataStatement or an EquivalenceStatement'.
	tWithDeclarations := self newTraitNamed: #TWithDeclarations comment: 'I have declarations'.
	tWithDeclarators := self newTraitNamed: #TWithDeclarators comment: 'I represent a declaration with several variable declarators'.
	tWithFormat := self newTraitNamed: #TWithFormat comment: 'I represent a statement with a format (format, print)'.
	tWithLoopControl := self newTraitNamed: #TWithLoopControl comment: 'I represent a loop control: initialization/limit/increment'.
	tWithVariableGroup := self newTraitNamed: #TWithVariableGroups comment: 'I represent a statement with variable groups like a DataStatement or an EquivalenceStatement'.

	"Traits from FAST-core"
	tEntity := self remoteTrait: #TEntity withPrefix: #FAST.

	tAssignment := self remoteTrait: #TAssignment withPrefix: #FAST.
	tBehaviouralEntity := self remoteTrait: #TBehaviouralEntity withPrefix: #FAST.
	tBinaryExpression := self remoteTrait: #TBinaryExpression withPrefix: #FAST. 
	tBooleanLiteral := self remoteTrait: #TBooleanLiteral withPrefix: #FAST.
	tBranchStatement := self remoteTrait: #TBranchStatement withPrefix: #FAST.
	tCharacterLiteral := self remoteTrait: #TCharacterLiteral withPrefix: #FAST.
	tComment := self remoteTrait: #TComment withPrefix: #FAST.
	tConditionalStatement := self remoteTrait: #TConditionalStatement withPrefix: #FAST.
	tExpression := self remoteTrait: #TExpression withPrefix: #FAST.
	tGotoStatement := self remoteTrait: #TGotoStatement withPrefix: #FAST.
	tLabeledStatement := self remoteTrait: #TLabeledStatement withPrefix: #FAST.
	tLoopStatement := self remoteTrait: #TLoopStatement withPrefix: #FAST.
	tNamedEntity := self remoteTrait: #TNamedEntity withPrefix: #FAST.
	tNumericalLiteral := self remoteTrait: #TNumericalLiteral withPrefix: #FAST.
	tReturnStatement := self remoteTrait: #TReturnStatement withPrefix: #FAST.
	tStatement := self remoteTrait: #TStatement withPrefix: #FAST.
	tStatementBlock := self remoteTrait: #TStatementBlock withPrefix: #FAST.
	tUnaryExpression := self remoteTrait: #TUnaryExpression withPrefix: #FAST. 
	tVariableEntity := self remoteTrait: #TVariableEntity withPrefix: #FAST.
	tWithArguments := self remoteTrait: #TWithArguments withPrefix: #FAST.
	tWithComments := self remoteTrait: #TWithComments withPrefix: #FAST.
	tWithParameters := self remoteTrait: #TWithParameters withPrefix: #FAST.

]
