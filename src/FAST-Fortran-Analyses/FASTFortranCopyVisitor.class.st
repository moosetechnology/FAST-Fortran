Class {
	#name : #FASTFortranCopyVisitor,
	#superclass : #FASTFortranVisitor,
	#category : #'FAST-Fortran-Analyses-SSA'
}

{ #category : #copying }
FASTFortranCopyVisitor >> copy: aNode [

	aNode ifNil: [ ^nil ].
	aNode isLiteral ifTrue: [ ^aNode ].
	aNode isCollection ifFalse: [ ^aNode accept: self ].
	^aNode collect: [ :each | self copy: each ]

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractExpression: aFASTFortranAbstractExpression [
	<generated>
	^FASTFortranAbstractExpression new
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractLiteral: aFASTFortranAbstractLiteral [
	<generated>
	^FASTFortranAbstractLiteral new
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractStatement: aFASTFortranAbstractStatement [
	<generated>
	^FASTFortranAbstractStatement new
		label: (self copy: aFASTFortranAbstractStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAcceptStatement: aFASTFortranAcceptStatement [
	<generated>
	^FASTFortranAcceptStatement new
		label: (self copy: aFASTFortranAcceptStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAmpersand: aFASTFortranAmpersand [
	<generated>
	^FASTFortranAmpersand new
		primitiveValue: (self copy: aFASTFortranAmpersand primitiveValue) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranArrayRange: aFASTFortranArrayRange [
	<generated>
	^FASTFortranArrayRange new
		lowerBound: (self copy: aFASTFortranArrayRange lowerBound) ;
		upperBound: (self copy: aFASTFortranArrayRange upperBound) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [
	<generated>
	^FASTFortranArrayVariable new
		name: (self copy: aFASTFortranArrayVariable name) ;
		indices: (self copy: aFASTFortranArrayVariable indices) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAssignmentExpression: aFASTFortranAssignmentExpression [
	<generated>
	^FASTFortranAssignmentExpression new
		variable: (self copy: aFASTFortranAssignmentExpression variable) ;
		expression: (self copy: aFASTFortranAssignmentExpression expression) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement [
	<generated>
	^FASTFortranAssignmentStatement new
		variable: (self copy: aFASTFortranAssignmentStatement variable) ;
		label: (self copy: aFASTFortranAssignmentStatement label) ;
		expression: (self copy: aFASTFortranAssignmentStatement expression) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAsterisk: aFASTFortranAsterisk [
	<generated>
	^FASTFortranAsterisk new
		primitiveValue: (self copy: aFASTFortranAsterisk primitiveValue) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAutomaticStatement: aFASTFortranAutomaticStatement [
	<generated>
	^FASTFortranAutomaticStatement new
		label: (self copy: aFASTFortranAutomaticStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranBackspaceStatement: aFASTFortranBackspaceStatement [
	<generated>
	^FASTFortranBackspaceStatement new
		label: (self copy: aFASTFortranBackspaceStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [
	<generated>
	^FASTFortranBinaryExpression new
		right: (self copy: aFASTFortranBinaryExpression right) ;
		left: (self copy: aFASTFortranBinaryExpression left) ;
		operator: (self copy: aFASTFortranBinaryExpression operator) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranBlockData: aFASTFortranBlockData [
	<generated>
	^FASTFortranBlockData new
		comments: (self copy: aFASTFortranBlockData comments) ;
		name: (self copy: aFASTFortranBlockData name) ;
		parameters: (self copy: aFASTFortranBlockData parameters) ;
		statementBlock: (self copy: aFASTFortranBlockData statementBlock) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranBooleanLiteral: aFASTFortranBooleanLiteral [
	<generated>
	^FASTFortranBooleanLiteral new
		primitiveValue: (self copy: aFASTFortranBooleanLiteral primitiveValue) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranByteType: aFASTFortranByteType [
	<generated>
	^FASTFortranByteType new
		size: (self copy: aFASTFortranByteType size) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [
	<generated>
	^FASTFortranCallStatement new
		name: (self copy: aFASTFortranCallStatement name) ;
		arguments: (self copy: aFASTFortranCallStatement arguments) ;
		label: (self copy: aFASTFortranCallStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranCharacterLiteral: aFASTFortranCharacterLiteral [
	<generated>
	^FASTFortranCharacterLiteral new
		primitiveValue: (self copy: aFASTFortranCharacterLiteral primitiveValue) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranCharacterType: aFASTFortranCharacterType [
	<generated>
	^FASTFortranCharacterType new
		size: (self copy: aFASTFortranCharacterType size) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranCloseStatement: aFASTFortranCloseStatement [
	<generated>
	^FASTFortranCloseStatement new
		label: (self copy: aFASTFortranCloseStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranComment: aFASTFortranComment [
	<generated>
	^FASTFortranComment new
		content: (self copy: aFASTFortranComment content) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranCommonGroup: aFASTFortranCommonGroup [
	<generated>
	^FASTFortranCommonGroup new
		name: (self copy: aFASTFortranCommonGroup name) ;
		declarators: (self copy: aFASTFortranCommonGroup declarators) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranCommonStatement: aFASTFortranCommonStatement [
	<generated>
	^FASTFortranCommonStatement new
		groups: (self copy: aFASTFortranCommonStatement groups) ;
		label: (self copy: aFASTFortranCommonStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranComplexLiteral: aFASTFortranComplexLiteral [
	<generated>
	^FASTFortranComplexLiteral new
		primitiveValue: (self copy: aFASTFortranComplexLiteral primitiveValue) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranComplexType: aFASTFortranComplexType [
	<generated>
	^FASTFortranComplexType new
		size: (self copy: aFASTFortranComplexType size) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranContinueStatement: aFASTFortranContinueStatement [
	<generated>
	^FASTFortranContinueStatement new
		label: (self copy: aFASTFortranContinueStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDataGroup: aFASTFortranDataGroup [
	<generated>
	^FASTFortranDataGroup new
		dataConstants: (self copy: aFASTFortranDataGroup dataConstants) ;
		variables: (self copy: aFASTFortranDataGroup variables) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDataStatement: aFASTFortranDataStatement [
	<generated>
	^FASTFortranDataStatement new
		variableGroups: (self copy: aFASTFortranDataStatement variableGroups) ;
		label: (self copy: aFASTFortranDataStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDecodeStatement: aFASTFortranDecodeStatement [
	<generated>
	^FASTFortranDecodeStatement new
		label: (self copy: aFASTFortranDecodeStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDimensionStatement: aFASTFortranDimensionStatement [
	<generated>
	^FASTFortranDimensionStatement new
		label: (self copy: aFASTFortranDimensionStatement label) ;
		declarators: (self copy: aFASTFortranDimensionStatement declarators) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [
	<generated>
	^FASTFortranDoStatement new
		labelReferences: (self copy: aFASTFortranDoStatement labelReferences) ;
		loopControl: (self copy: aFASTFortranDoStatement loopControl) ;
		label: (self copy: aFASTFortranDoStatement label) ;
		statementBlock: (self copy: aFASTFortranDoStatement statementBlock) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement [
	<generated>
	^FASTFortranDoWhileStatement new
		label: (self copy: aFASTFortranDoWhileStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDoubleComplexLiteral: aFASTFortranDoubleComplexLiteral [
	<generated>
	^FASTFortranDoubleComplexLiteral new
		primitiveValue: (self copy: aFASTFortranDoubleComplexLiteral primitiveValue) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDoubleComplexType: aFASTFortranDoubleComplexType [
	<generated>
	^FASTFortranDoubleComplexType new
		size: (self copy: aFASTFortranDoubleComplexType size) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDoublePrecisionLiteral: aFASTFortranDoublePrecisionLiteral [
	<generated>
	^FASTFortranDoublePrecisionLiteral new
		primitiveValue: (self copy: aFASTFortranDoublePrecisionLiteral primitiveValue) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDoublePrecisionType: aFASTFortranDoublePrecisionType [
	<generated>
	^FASTFortranDoublePrecisionType new
		size: (self copy: aFASTFortranDoublePrecisionType size) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranElseStatement: aFASTFortranElseStatement [
	<generated>
	^FASTFortranElseStatement new
		label: (self copy: aFASTFortranElseStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranEncodeStatement: aFASTFortranEncodeStatement [
	<generated>
	^FASTFortranEncodeStatement new
		label: (self copy: aFASTFortranEncodeStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranEndFileStatement: aFASTFortranEndFileStatement [
	<generated>
	^FASTFortranEndFileStatement new
		label: (self copy: aFASTFortranEndFileStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranEntity: aFASTFortranEntity [
	<generated>
	^FASTFortranEntity new
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranEntryStatement: aFASTFortranEntryStatement [
	<generated>
	^FASTFortranEntryStatement new
		name: (self copy: aFASTFortranEntryStatement name) ;
		label: (self copy: aFASTFortranEntryStatement label) ;
		entryArguments: (self copy: aFASTFortranEntryStatement entryArguments) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranEquivalenceGroup: aFASTFortranEquivalenceGroup [
	<generated>
	^FASTFortranEquivalenceGroup new
		variables: (self copy: aFASTFortranEquivalenceGroup variables) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranEquivalenceStatement: aFASTFortranEquivalenceStatement [
	<generated>
	^FASTFortranEquivalenceStatement new
		variableGroups: (self copy: aFASTFortranEquivalenceStatement variableGroups) ;
		label: (self copy: aFASTFortranEquivalenceStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [
	<generated>
	^FASTFortranExitStatement new
		label: (self copy: aFASTFortranExitStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranExternalStatement: aFASTFortranExternalStatement [
	<generated>
	^FASTFortranExternalStatement new
		name: (self copy: aFASTFortranExternalStatement name) ;
		label: (self copy: aFASTFortranExternalStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranFormatStatement: aFASTFortranFormatStatement [
	<generated>
	^FASTFortranFormatStatement new
		format: (self copy: aFASTFortranFormatStatement format) ;
		label: (self copy: aFASTFortranFormatStatement label) ;
		formatDescription: (self copy: aFASTFortranFormatStatement formatDescription) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranFunction: aFASTFortranFunction [
	<generated>
	^FASTFortranFunction new
		comments: (self copy: aFASTFortranFunction comments) ;
		name: (self copy: aFASTFortranFunction name) ;
		parameters: (self copy: aFASTFortranFunction parameters) ;
		returnType: (self copy: aFASTFortranFunction returnType) ;
		statementBlock: (self copy: aFASTFortranFunction statementBlock) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranFunctionCall: aFASTFortranFunctionCall [
	<generated>
	^FASTFortranFunctionCall new
		name: (self copy: aFASTFortranFunctionCall name) ;
		arguments: (self copy: aFASTFortranFunctionCall arguments) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranFunctionStatement: aFASTFortranFunctionStatement [
	<generated>
	^FASTFortranFunctionStatement new
		name: (self copy: aFASTFortranFunctionStatement name) ;
		arguments: (self copy: aFASTFortranFunctionStatement arguments) ;
		label: (self copy: aFASTFortranFunctionStatement label) ;
		expression: (self copy: aFASTFortranFunctionStatement expression) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranGoToAssignedStatement: aFASTFortranGoToAssignedStatement [
	<generated>
	^FASTFortranGoToAssignedStatement new
		labelReferences: (self copy: aFASTFortranGoToAssignedStatement labelReferences) ;
		label: (self copy: aFASTFortranGoToAssignedStatement label) ;
		selectorExpression: (self copy: aFASTFortranGoToAssignedStatement selectorExpression) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [
	<generated>
	^FASTFortranGoToComputedStatement new
		labelReferences: (self copy: aFASTFortranGoToComputedStatement labelReferences) ;
		label: (self copy: aFASTFortranGoToComputedStatement label) ;
		selectorExpression: (self copy: aFASTFortranGoToComputedStatement selectorExpression) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [
	<generated>
	^FASTFortranGoToStatement new
		labelReferences: (self copy: aFASTFortranGoToStatement labelReferences) ;
		label: (self copy: aFASTFortranGoToStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [
	<generated>
	^FASTFortranIfArithmeticStatement new
		condition: (self copy: aFASTFortranIfArithmeticStatement condition) ;
		lessLabel: (self copy: aFASTFortranIfArithmeticStatement lessLabel) ;
		label: (self copy: aFASTFortranIfArithmeticStatement label) ;
		equalLabel: (self copy: aFASTFortranIfArithmeticStatement equalLabel) ;
		greaterLabel: (self copy: aFASTFortranIfArithmeticStatement greaterLabel) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [
	<generated>
	^FASTFortranIfBlockStatement new
		condition: (self copy: aFASTFortranIfBlockStatement condition) ;
		elseStatementBlock: (self copy: aFASTFortranIfBlockStatement elseStatementBlock) ;
		thenStatementBlock: (self copy: aFASTFortranIfBlockStatement thenStatementBlock) ;
		label: (self copy: aFASTFortranIfBlockStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [
	<generated>
	^FASTFortranIfLogicalStatement new
		condition: (self copy: aFASTFortranIfLogicalStatement condition) ;
		statement: (self copy: aFASTFortranIfLogicalStatement statement) ;
		label: (self copy: aFASTFortranIfLogicalStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranImplicitRange: aFASTFortranImplicitRange [
	<generated>
	^FASTFortranImplicitRange new
		to: (self copy: aFASTFortranImplicitRange to) ;
		from: (self copy: aFASTFortranImplicitRange from) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranImplicitStatement: aFASTFortranImplicitStatement [
	<generated>
	^FASTFortranImplicitStatement new
		label: (self copy: aFASTFortranImplicitStatement label) ;
		typingRules: (self copy: aFASTFortranImplicitStatement typingRules) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranImplicitTypingRule: aFASTFortranImplicitTypingRule [
	<generated>
	^FASTFortranImplicitTypingRule new
		type: (self copy: aFASTFortranImplicitTypingRule type) ;
		ranges: (self copy: aFASTFortranImplicitTypingRule ranges) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranImpliedDoExpression: aFASTFortranImpliedDoExpression [
	<generated>
	^FASTFortranImpliedDoExpression new
		loopControl: (self copy: aFASTFortranImpliedDoExpression loopControl) ;
		variables: (self copy: aFASTFortranImpliedDoExpression variables) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIncludeStatement: aFASTFortranIncludeStatement [
	<generated>
	^FASTFortranIncludeStatement new
		label: (self copy: aFASTFortranIncludeStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranInquireStatement: aFASTFortranInquireStatement [
	<generated>
	^FASTFortranInquireStatement new
		ioParameters: (self copy: aFASTFortranInquireStatement ioParameters) ;
		label: (self copy: aFASTFortranInquireStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIntegerLiteral: aFASTFortranIntegerLiteral [
	<generated>
	^FASTFortranIntegerLiteral new
		primitiveValue: (self copy: aFASTFortranIntegerLiteral primitiveValue) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIntegerType: aFASTFortranIntegerType [
	<generated>
	^FASTFortranIntegerType new
		size: (self copy: aFASTFortranIntegerType size) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIntrinsicStatement: aFASTFortranIntrinsicStatement [
	<generated>
	^FASTFortranIntrinsicStatement new
		variables: (self copy: aFASTFortranIntrinsicStatement variables) ;
		label: (self copy: aFASTFortranIntrinsicStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranLabelReference: aFASTFortranLabelReference [
	<generated>
	^FASTFortranLabelReference new
		label: (self copy: aFASTFortranLabelReference label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranLogicalType: aFASTFortranLogicalType [
	<generated>
	^FASTFortranLogicalType new
		size: (self copy: aFASTFortranLogicalType size) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranLoopControlExpression: aFASTFortranLoopControlExpression [
	<generated>
	^FASTFortranLoopControlExpression new
		increment: (self copy: aFASTFortranLoopControlExpression increment) ;
		limit: (self copy: aFASTFortranLoopControlExpression limit) ;
		init: (self copy: aFASTFortranLoopControlExpression init) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranMapStatement: aFASTFortranMapStatement [
	<generated>
	^FASTFortranMapStatement new
		label: (self copy: aFASTFortranMapStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranNameListStatement: aFASTFortranNameListStatement [
	<generated>
	^FASTFortranNameListStatement new
		label: (self copy: aFASTFortranNameListStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranOpenStatement: aFASTFortranOpenStatement [
	<generated>
	^FASTFortranOpenStatement new
		ioParameters: (self copy: aFASTFortranOpenStatement ioParameters) ;
		label: (self copy: aFASTFortranOpenStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranOptionsStatement: aFASTFortranOptionsStatement [
	<generated>
	^FASTFortranOptionsStatement new
		label: (self copy: aFASTFortranOptionsStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranParameterStatement: aFASTFortranParameterStatement [
	<generated>
	^FASTFortranParameterStatement new
		label: (self copy: aFASTFortranParameterStatement label) ;
		declarators: (self copy: aFASTFortranParameterStatement declarators) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranPauseStatement: aFASTFortranPauseStatement [
	<generated>
	^FASTFortranPauseStatement new
		label: (self copy: aFASTFortranPauseStatement label) ;
		displayArgument: (self copy: aFASTFortranPauseStatement displayArgument) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranPragmaStatement: aFASTFortranPragmaStatement [
	<generated>
	^FASTFortranPragmaStatement new
		label: (self copy: aFASTFortranPragmaStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranPrintStatement: aFASTFortranPrintStatement [
	<generated>
	^FASTFortranPrintStatement new
		format: (self copy: aFASTFortranPrintStatement format) ;
		arguments: (self copy: aFASTFortranPrintStatement arguments) ;
		label: (self copy: aFASTFortranPrintStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranProcedure: aFASTFortranProcedure [
	<generated>
	^FASTFortranProcedure new
		comments: (self copy: aFASTFortranProcedure comments) ;
		name: (self copy: aFASTFortranProcedure name) ;
		parameters: (self copy: aFASTFortranProcedure parameters) ;
		statementBlock: (self copy: aFASTFortranProcedure statementBlock) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranProgramFile: aFASTFortranProgramFile [
	<generated>
	^FASTFortranProgramFile new
		comments: (self copy: aFASTFortranProgramFile comments) ;
		programUnit: (self copy: aFASTFortranProgramFile programUnit) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranProgramMain: aFASTFortranProgramMain [
	<generated>
	^FASTFortranProgramMain new
		comments: (self copy: aFASTFortranProgramMain comments) ;
		name: (self copy: aFASTFortranProgramMain name) ;
		parameters: (self copy: aFASTFortranProgramMain parameters) ;
		statementBlock: (self copy: aFASTFortranProgramMain statementBlock) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [
	<generated>
	^FASTFortranProgramUnit new
		comments: (self copy: aFASTFortranProgramUnit comments) ;
		name: (self copy: aFASTFortranProgramUnit name) ;
		parameters: (self copy: aFASTFortranProgramUnit parameters) ;
		statementBlock: (self copy: aFASTFortranProgramUnit statementBlock) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranReadStatement: aFASTFortranReadStatement [
	<generated>
	^FASTFortranReadStatement new
		ioParameters: (self copy: aFASTFortranReadStatement ioParameters) ;
		arguments: (self copy: aFASTFortranReadStatement arguments) ;
		label: (self copy: aFASTFortranReadStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranRealLiteral: aFASTFortranRealLiteral [
	<generated>
	^FASTFortranRealLiteral new
		primitiveValue: (self copy: aFASTFortranRealLiteral primitiveValue) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranRealType: aFASTFortranRealType [
	<generated>
	^FASTFortranRealType new
		size: (self copy: aFASTFortranRealType size) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranReturnStatement: aFASTFortranReturnStatement [
	<generated>
	^FASTFortranReturnStatement new
		label: (self copy: aFASTFortranReturnStatement label) ;
		expression: (self copy: aFASTFortranReturnStatement expression) ;
		alternateReturnLable: (self copy: aFASTFortranReturnStatement alternateReturnLable) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranRewindStatement: aFASTFortranRewindStatement [
	<generated>
	^FASTFortranRewindStatement new
		ioParameters: (self copy: aFASTFortranRewindStatement ioParameters) ;
		label: (self copy: aFASTFortranRewindStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranSaveStatement: aFASTFortranSaveStatement [
	<generated>
	^FASTFortranSaveStatement new
		label: (self copy: aFASTFortranSaveStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [
	<generated>
	^FASTFortranScalarVariable new
		name: (self copy: aFASTFortranScalarVariable name) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [
	<generated>
	^FASTFortranStatementBlock new
		comments: (self copy: aFASTFortranStatementBlock comments) ;
		label: (self copy: aFASTFortranStatementBlock label) ;
		statements: (self copy: aFASTFortranStatementBlock statements) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranStaticStatement: aFASTFortranStaticStatement [
	<generated>
	^FASTFortranStaticStatement new
		label: (self copy: aFASTFortranStaticStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranStopStatement: aFASTFortranStopStatement [
	<generated>
	^FASTFortranStopStatement new
		label: (self copy: aFASTFortranStopStatement label) ;
		displayArgument: (self copy: aFASTFortranStopStatement displayArgument) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranSubprogram: aFASTFortranSubprogram [
	<generated>
	^FASTFortranSubprogram new
		comments: (self copy: aFASTFortranSubprogram comments) ;
		name: (self copy: aFASTFortranSubprogram name) ;
		parameters: (self copy: aFASTFortranSubprogram parameters) ;
		statementBlock: (self copy: aFASTFortranSubprogram statementBlock) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranSubroutine: aFASTFortranSubroutine [
	<generated>
	^FASTFortranSubroutine new
		comments: (self copy: aFASTFortranSubroutine comments) ;
		name: (self copy: aFASTFortranSubroutine name) ;
		parameters: (self copy: aFASTFortranSubroutine parameters) ;
		statementBlock: (self copy: aFASTFortranSubroutine statementBlock) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranSubstring: aFASTFortranSubstring [
	<generated>
	^FASTFortranSubstring new
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranType: aFASTFortranType [
	<generated>
	^FASTFortranType new
		size: (self copy: aFASTFortranType size) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranUnaryExpression: aFASTFortranUnaryExpression [
	<generated>
	^FASTFortranUnaryExpression new
		expression: (self copy: aFASTFortranUnaryExpression expression) ;
		operator: (self copy: aFASTFortranUnaryExpression operator) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranUnionStatement: aFASTFortranUnionStatement [
	<generated>
	^FASTFortranUnionStatement new
		label: (self copy: aFASTFortranUnionStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranVariable: aFASTFortranVariable [
	<generated>
	^FASTFortranVariable new
		name: (self copy: aFASTFortranVariable name) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranVariableDeclarationStatement: aFASTFortranVariableDeclarationStatement [
	<generated>
	^FASTFortranVariableDeclarationStatement new
		type: (self copy: aFASTFortranVariableDeclarationStatement type) ;
		label: (self copy: aFASTFortranVariableDeclarationStatement label) ;
		declarators: (self copy: aFASTFortranVariableDeclarationStatement declarators) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranVariableDeclarator: aFASTFortranVariableDeclarator [
	<generated>
	^FASTFortranVariableDeclarator new
		variable: (self copy: aFASTFortranVariableDeclarator variable) ;
		dimensions: (self copy: aFASTFortranVariableDeclarator dimensions) ;
		expression: (self copy: aFASTFortranVariableDeclarator expression) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranVirtualStatement: aFASTFortranVirtualStatement [
	<generated>
	^FASTFortranVirtualStatement new
		label: (self copy: aFASTFortranVirtualStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranVolatileStatement: aFASTFortranVolatileStatement [
	<generated>
	^FASTFortranVolatileStatement new
		label: (self copy: aFASTFortranVolatileStatement label) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [
	<generated>
	^FASTFortranWriteStatement new
		ioParameters: (self copy: aFASTFortranWriteStatement ioParameters) ;
		arguments: (self copy: aFASTFortranWriteStatement arguments) ;
		label: (self copy: aFASTFortranWriteStatement label) ;
		yourself

]
