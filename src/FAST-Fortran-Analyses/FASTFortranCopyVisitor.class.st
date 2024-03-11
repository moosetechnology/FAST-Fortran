Class {
	#name : #FASTFortranCopyVisitor,
	#superclass : #FASTFortranVisitor,
	#category : #'FAST-Fortran-Analyses-SSA'
}

{ #category : #visiting }
FASTFortranCopyVisitor class >> visit: anAST [

	^self new
		visit: anAST
]

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
		startPos: (self copy: aFASTFortranAbstractExpression startPos) ;
		endPos: (self copy: aFASTFortranAbstractExpression endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractIOStatement: aFASTFortranAbstractIOStatement [
	<generated>
	^FASTFortranAbstractIOStatement new
		ioParameters: (self copy: aFASTFortranAbstractIOStatement ioParameters) ;
		label: (self copy: aFASTFortranAbstractIOStatement label) ;
		startPos: (self copy: aFASTFortranAbstractIOStatement startPos) ;
		endPos: (self copy: aFASTFortranAbstractIOStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractLiteral: aFASTFortranAbstractLiteral [
	<generated>
	^FASTFortranAbstractLiteral new
		startPos: (self copy: aFASTFortranAbstractLiteral startPos) ;
		endPos: (self copy: aFASTFortranAbstractLiteral endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractStatement: aFASTFortranAbstractStatement [
	<generated>
	^FASTFortranAbstractStatement new
		label: (self copy: aFASTFortranAbstractStatement label) ;
		startPos: (self copy: aFASTFortranAbstractStatement startPos) ;
		endPos: (self copy: aFASTFortranAbstractStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAcceptStatement: aFASTFortranAcceptStatement [
	<generated>
	^FASTFortranAcceptStatement new
		label: (self copy: aFASTFortranAcceptStatement label) ;
		startPos: (self copy: aFASTFortranAcceptStatement startPos) ;
		endPos: (self copy: aFASTFortranAcceptStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAmpersand: aFASTFortranAmpersand [
	<generated>
	^FASTFortranAmpersand new
		primitiveValue: (self copy: aFASTFortranAmpersand primitiveValue) ;
		startPos: (self copy: aFASTFortranAmpersand startPos) ;
		endPos: (self copy: aFASTFortranAmpersand endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranArrayRange: aFASTFortranArrayRange [
	<generated>
	^FASTFortranArrayRange new
		lowerBound: (self copy: aFASTFortranArrayRange lowerBound) ;
		upperBound: (self copy: aFASTFortranArrayRange upperBound) ;
		startPos: (self copy: aFASTFortranArrayRange startPos) ;
		endPos: (self copy: aFASTFortranArrayRange endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [
	<generated>
	^FASTFortranArrayVariable new
		name: (self copy: aFASTFortranArrayVariable name) ;
		indices: (self copy: aFASTFortranArrayVariable indices) ;
		startPos: (self copy: aFASTFortranArrayVariable startPos) ;
		endPos: (self copy: aFASTFortranArrayVariable endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAssignmentExpression: aFASTFortranAssignmentExpression [
	<generated>
	^FASTFortranAssignmentExpression new
		variable: (self copy: aFASTFortranAssignmentExpression variable) ;
		expression: (self copy: aFASTFortranAssignmentExpression expression) ;
		startPos: (self copy: aFASTFortranAssignmentExpression startPos) ;
		endPos: (self copy: aFASTFortranAssignmentExpression endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement [
	<generated>
	^FASTFortranAssignmentStatement new
		variable: (self copy: aFASTFortranAssignmentStatement variable) ;
		label: (self copy: aFASTFortranAssignmentStatement label) ;
		expression: (self copy: aFASTFortranAssignmentStatement expression) ;
		startPos: (self copy: aFASTFortranAssignmentStatement startPos) ;
		endPos: (self copy: aFASTFortranAssignmentStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAsterisk: aFASTFortranAsterisk [
	<generated>
	^FASTFortranAsterisk new
		primitiveValue: (self copy: aFASTFortranAsterisk primitiveValue) ;
		startPos: (self copy: aFASTFortranAsterisk startPos) ;
		endPos: (self copy: aFASTFortranAsterisk endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranAutomaticStatement: aFASTFortranAutomaticStatement [
	<generated>
	^FASTFortranAutomaticStatement new
		label: (self copy: aFASTFortranAutomaticStatement label) ;
		startPos: (self copy: aFASTFortranAutomaticStatement startPos) ;
		endPos: (self copy: aFASTFortranAutomaticStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranBackspaceStatement: aFASTFortranBackspaceStatement [
	<generated>
	^FASTFortranBackspaceStatement new
		ioParameters: (self copy: aFASTFortranBackspaceStatement ioParameters) ;
		label: (self copy: aFASTFortranBackspaceStatement label) ;
		startPos: (self copy: aFASTFortranBackspaceStatement startPos) ;
		endPos: (self copy: aFASTFortranBackspaceStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [
	<generated>
	^FASTFortranBinaryExpression new
		right: (self copy: aFASTFortranBinaryExpression right) ;
		left: (self copy: aFASTFortranBinaryExpression left) ;
		startPos: (self copy: aFASTFortranBinaryExpression startPos) ;
		endPos: (self copy: aFASTFortranBinaryExpression endPos) ;
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
		startPos: (self copy: aFASTFortranBlockData startPos) ;
		endPos: (self copy: aFASTFortranBlockData endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranBooleanLiteral: aFASTFortranBooleanLiteral [
	<generated>
	^FASTFortranBooleanLiteral new
		primitiveValue: (self copy: aFASTFortranBooleanLiteral primitiveValue) ;
		startPos: (self copy: aFASTFortranBooleanLiteral startPos) ;
		endPos: (self copy: aFASTFortranBooleanLiteral endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranByteType: aFASTFortranByteType [
	<generated>
	^FASTFortranByteType new
		size: (self copy: aFASTFortranByteType size) ;
		startPos: (self copy: aFASTFortranByteType startPos) ;
		endPos: (self copy: aFASTFortranByteType endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [
	<generated>
	^FASTFortranCallStatement new
		name: (self copy: aFASTFortranCallStatement name) ;
		arguments: (self copy: aFASTFortranCallStatement arguments) ;
		label: (self copy: aFASTFortranCallStatement label) ;
		startPos: (self copy: aFASTFortranCallStatement startPos) ;
		endPos: (self copy: aFASTFortranCallStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranCharacterLiteral: aFASTFortranCharacterLiteral [
	<generated>
	^FASTFortranCharacterLiteral new
		primitiveValue: (self copy: aFASTFortranCharacterLiteral primitiveValue) ;
		startPos: (self copy: aFASTFortranCharacterLiteral startPos) ;
		endPos: (self copy: aFASTFortranCharacterLiteral endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranCharacterType: aFASTFortranCharacterType [
	<generated>
	^FASTFortranCharacterType new
		size: (self copy: aFASTFortranCharacterType size) ;
		startPos: (self copy: aFASTFortranCharacterType startPos) ;
		endPos: (self copy: aFASTFortranCharacterType endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranCloseStatement: aFASTFortranCloseStatement [
	<generated>
	^FASTFortranCloseStatement new
		ioParameters: (self copy: aFASTFortranCloseStatement ioParameters) ;
		label: (self copy: aFASTFortranCloseStatement label) ;
		startPos: (self copy: aFASTFortranCloseStatement startPos) ;
		endPos: (self copy: aFASTFortranCloseStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranComment: aFASTFortranComment [
	<generated>
	^FASTFortranComment new
		content: (self copy: aFASTFortranComment content) ;
		startPos: (self copy: aFASTFortranComment startPos) ;
		endPos: (self copy: aFASTFortranComment endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranCommonGroup: aFASTFortranCommonGroup [
	<generated>
	^FASTFortranCommonGroup new
		name: (self copy: aFASTFortranCommonGroup name) ;
		declarators: (self copy: aFASTFortranCommonGroup declarators) ;
		startPos: (self copy: aFASTFortranCommonGroup startPos) ;
		endPos: (self copy: aFASTFortranCommonGroup endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranCommonStatement: aFASTFortranCommonStatement [
	<generated>
	^FASTFortranCommonStatement new
		groups: (self copy: aFASTFortranCommonStatement groups) ;
		label: (self copy: aFASTFortranCommonStatement label) ;
		startPos: (self copy: aFASTFortranCommonStatement startPos) ;
		endPos: (self copy: aFASTFortranCommonStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranComplexLiteral: aFASTFortranComplexLiteral [
	<generated>
	^FASTFortranComplexLiteral new
		primitiveValue: (self copy: aFASTFortranComplexLiteral primitiveValue) ;
		startPos: (self copy: aFASTFortranComplexLiteral startPos) ;
		endPos: (self copy: aFASTFortranComplexLiteral endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranComplexType: aFASTFortranComplexType [
	<generated>
	^FASTFortranComplexType new
		size: (self copy: aFASTFortranComplexType size) ;
		startPos: (self copy: aFASTFortranComplexType startPos) ;
		endPos: (self copy: aFASTFortranComplexType endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranConditionalStatement: aFASTFortranConditionalStatement [
	<generated>
	^FASTFortranConditionalStatement new
		condition: (self copy: aFASTFortranConditionalStatement condition) ;
		label: (self copy: aFASTFortranConditionalStatement label) ;
		startPos: (self copy: aFASTFortranConditionalStatement startPos) ;
		endPos: (self copy: aFASTFortranConditionalStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranContinueStatement: aFASTFortranContinueStatement [
	<generated>
	^FASTFortranContinueStatement new
		label: (self copy: aFASTFortranContinueStatement label) ;
		startPos: (self copy: aFASTFortranContinueStatement startPos) ;
		endPos: (self copy: aFASTFortranContinueStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDataGroup: aFASTFortranDataGroup [
	<generated>
	^FASTFortranDataGroup new
		dataConstants: (self copy: aFASTFortranDataGroup dataConstants) ;
		variables: (self copy: aFASTFortranDataGroup variables) ;
		startPos: (self copy: aFASTFortranDataGroup startPos) ;
		endPos: (self copy: aFASTFortranDataGroup endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDataStatement: aFASTFortranDataStatement [
	<generated>
	^FASTFortranDataStatement new
		variableGroups: (self copy: aFASTFortranDataStatement variableGroups) ;
		label: (self copy: aFASTFortranDataStatement label) ;
		startPos: (self copy: aFASTFortranDataStatement startPos) ;
		endPos: (self copy: aFASTFortranDataStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDecodeStatement: aFASTFortranDecodeStatement [
	<generated>
	^FASTFortranDecodeStatement new
		ioParameters: (self copy: aFASTFortranDecodeStatement ioParameters) ;
		label: (self copy: aFASTFortranDecodeStatement label) ;
		startPos: (self copy: aFASTFortranDecodeStatement startPos) ;
		endPos: (self copy: aFASTFortranDecodeStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDimensionStatement: aFASTFortranDimensionStatement [
	<generated>
	^FASTFortranDimensionStatement new
		label: (self copy: aFASTFortranDimensionStatement label) ;
		declarators: (self copy: aFASTFortranDimensionStatement declarators) ;
		startPos: (self copy: aFASTFortranDimensionStatement startPos) ;
		endPos: (self copy: aFASTFortranDimensionStatement endPos) ;
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
		startPos: (self copy: aFASTFortranDoStatement startPos) ;
		endPos: (self copy: aFASTFortranDoStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement [
	<generated>
	^FASTFortranDoWhileStatement new
		condition: (self copy: aFASTFortranDoWhileStatement condition) ;
		label: (self copy: aFASTFortranDoWhileStatement label) ;
		startPos: (self copy: aFASTFortranDoWhileStatement startPos) ;
		endPos: (self copy: aFASTFortranDoWhileStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDoubleComplexLiteral: aFASTFortranDoubleComplexLiteral [
	<generated>
	^FASTFortranDoubleComplexLiteral new
		primitiveValue: (self copy: aFASTFortranDoubleComplexLiteral primitiveValue) ;
		startPos: (self copy: aFASTFortranDoubleComplexLiteral startPos) ;
		endPos: (self copy: aFASTFortranDoubleComplexLiteral endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDoubleComplexType: aFASTFortranDoubleComplexType [
	<generated>
	^FASTFortranDoubleComplexType new
		size: (self copy: aFASTFortranDoubleComplexType size) ;
		startPos: (self copy: aFASTFortranDoubleComplexType startPos) ;
		endPos: (self copy: aFASTFortranDoubleComplexType endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDoublePrecisionLiteral: aFASTFortranDoublePrecisionLiteral [
	<generated>
	^FASTFortranDoublePrecisionLiteral new
		primitiveValue: (self copy: aFASTFortranDoublePrecisionLiteral primitiveValue) ;
		startPos: (self copy: aFASTFortranDoublePrecisionLiteral startPos) ;
		endPos: (self copy: aFASTFortranDoublePrecisionLiteral endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranDoublePrecisionType: aFASTFortranDoublePrecisionType [
	<generated>
	^FASTFortranDoublePrecisionType new
		size: (self copy: aFASTFortranDoublePrecisionType size) ;
		startPos: (self copy: aFASTFortranDoublePrecisionType startPos) ;
		endPos: (self copy: aFASTFortranDoublePrecisionType endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranElseStatement: aFASTFortranElseStatement [
	<generated>
	^FASTFortranElseStatement new
		label: (self copy: aFASTFortranElseStatement label) ;
		startPos: (self copy: aFASTFortranElseStatement startPos) ;
		endPos: (self copy: aFASTFortranElseStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranEncodeStatement: aFASTFortranEncodeStatement [
	<generated>
	^FASTFortranEncodeStatement new
		ioParameters: (self copy: aFASTFortranEncodeStatement ioParameters) ;
		label: (self copy: aFASTFortranEncodeStatement label) ;
		startPos: (self copy: aFASTFortranEncodeStatement startPos) ;
		endPos: (self copy: aFASTFortranEncodeStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranEndFileStatement: aFASTFortranEndFileStatement [
	<generated>
	^FASTFortranEndFileStatement new
		ioParameters: (self copy: aFASTFortranEndFileStatement ioParameters) ;
		label: (self copy: aFASTFortranEndFileStatement label) ;
		startPos: (self copy: aFASTFortranEndFileStatement startPos) ;
		endPos: (self copy: aFASTFortranEndFileStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranEntity: aFASTFortranEntity [
	<generated>
	^FASTFortranEntity new
		startPos: (self copy: aFASTFortranEntity startPos) ;
		endPos: (self copy: aFASTFortranEntity endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranEntryStatement: aFASTFortranEntryStatement [
	<generated>
	^FASTFortranEntryStatement new
		name: (self copy: aFASTFortranEntryStatement name) ;
		label: (self copy: aFASTFortranEntryStatement label) ;
		entryArguments: (self copy: aFASTFortranEntryStatement entryArguments) ;
		startPos: (self copy: aFASTFortranEntryStatement startPos) ;
		endPos: (self copy: aFASTFortranEntryStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranEquivalenceGroup: aFASTFortranEquivalenceGroup [
	<generated>
	^FASTFortranEquivalenceGroup new
		variables: (self copy: aFASTFortranEquivalenceGroup variables) ;
		startPos: (self copy: aFASTFortranEquivalenceGroup startPos) ;
		endPos: (self copy: aFASTFortranEquivalenceGroup endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranEquivalenceStatement: aFASTFortranEquivalenceStatement [
	<generated>
	^FASTFortranEquivalenceStatement new
		variableGroups: (self copy: aFASTFortranEquivalenceStatement variableGroups) ;
		label: (self copy: aFASTFortranEquivalenceStatement label) ;
		startPos: (self copy: aFASTFortranEquivalenceStatement startPos) ;
		endPos: (self copy: aFASTFortranEquivalenceStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [
	<generated>
	^FASTFortranExitStatement new
		label: (self copy: aFASTFortranExitStatement label) ;
		startPos: (self copy: aFASTFortranExitStatement startPos) ;
		endPos: (self copy: aFASTFortranExitStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranExternalStatement: aFASTFortranExternalStatement [
	<generated>
	^FASTFortranExternalStatement new
		name: (self copy: aFASTFortranExternalStatement name) ;
		label: (self copy: aFASTFortranExternalStatement label) ;
		startPos: (self copy: aFASTFortranExternalStatement startPos) ;
		endPos: (self copy: aFASTFortranExternalStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranFormatStatement: aFASTFortranFormatStatement [
	<generated>
	^FASTFortranFormatStatement new
		format: (self copy: aFASTFortranFormatStatement format) ;
		label: (self copy: aFASTFortranFormatStatement label) ;
		formatDescription: (self copy: aFASTFortranFormatStatement formatDescription) ;
		startPos: (self copy: aFASTFortranFormatStatement startPos) ;
		endPos: (self copy: aFASTFortranFormatStatement endPos) ;
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
		startPos: (self copy: aFASTFortranFunction startPos) ;
		endPos: (self copy: aFASTFortranFunction endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranFunctionCall: aFASTFortranFunctionCall [
	<generated>
	^FASTFortranFunctionCall new
		name: (self copy: aFASTFortranFunctionCall name) ;
		arguments: (self copy: aFASTFortranFunctionCall arguments) ;
		startPos: (self copy: aFASTFortranFunctionCall startPos) ;
		endPos: (self copy: aFASTFortranFunctionCall endPos) ;
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
		startPos: (self copy: aFASTFortranFunctionStatement startPos) ;
		endPos: (self copy: aFASTFortranFunctionStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranGoToAssignedStatement: aFASTFortranGoToAssignedStatement [
	<generated>
	^FASTFortranGoToAssignedStatement new
		labelReferences: (self copy: aFASTFortranGoToAssignedStatement labelReferences) ;
		label: (self copy: aFASTFortranGoToAssignedStatement label) ;
		selectorExpression: (self copy: aFASTFortranGoToAssignedStatement selectorExpression) ;
		startPos: (self copy: aFASTFortranGoToAssignedStatement startPos) ;
		endPos: (self copy: aFASTFortranGoToAssignedStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [
	<generated>
	^FASTFortranGoToComputedStatement new
		labelReferences: (self copy: aFASTFortranGoToComputedStatement labelReferences) ;
		label: (self copy: aFASTFortranGoToComputedStatement label) ;
		selectorExpression: (self copy: aFASTFortranGoToComputedStatement selectorExpression) ;
		startPos: (self copy: aFASTFortranGoToComputedStatement startPos) ;
		endPos: (self copy: aFASTFortranGoToComputedStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [
	<generated>
	^FASTFortranGoToStatement new
		labelReferences: (self copy: aFASTFortranGoToStatement labelReferences) ;
		label: (self copy: aFASTFortranGoToStatement label) ;
		startPos: (self copy: aFASTFortranGoToStatement startPos) ;
		endPos: (self copy: aFASTFortranGoToStatement endPos) ;
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
		startPos: (self copy: aFASTFortranIfArithmeticStatement startPos) ;
		endPos: (self copy: aFASTFortranIfArithmeticStatement endPos) ;
		greaterLabel: (self copy: aFASTFortranIfArithmeticStatement greaterLabel) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [
	<generated>
	^FASTFortranIfBlockStatement new
		condition: (self copy: aFASTFortranIfBlockStatement condition) ;
		thenStatementBlock: (self copy: aFASTFortranIfBlockStatement thenStatementBlock) ;
		elseStatementBlock: (self copy: aFASTFortranIfBlockStatement elseStatementBlock) ;
		label: (self copy: aFASTFortranIfBlockStatement label) ;
		startPos: (self copy: aFASTFortranIfBlockStatement startPos) ;
		endPos: (self copy: aFASTFortranIfBlockStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [
	<generated>
	^FASTFortranIfLogicalStatement new
		condition: (self copy: aFASTFortranIfLogicalStatement condition) ;
		statement: (self copy: aFASTFortranIfLogicalStatement statement) ;
		label: (self copy: aFASTFortranIfLogicalStatement label) ;
		startPos: (self copy: aFASTFortranIfLogicalStatement startPos) ;
		endPos: (self copy: aFASTFortranIfLogicalStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranImplicitLocalDeclaration: aFASTFortranImplicitLocalDeclaration [
	<generated>
	^FASTFortranImplicitLocalDeclaration new
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranImplicitRange: aFASTFortranImplicitRange [
	<generated>
	^FASTFortranImplicitRange new
		to: (self copy: aFASTFortranImplicitRange to) ;
		from: (self copy: aFASTFortranImplicitRange from) ;
		startPos: (self copy: aFASTFortranImplicitRange startPos) ;
		endPos: (self copy: aFASTFortranImplicitRange endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranImplicitStatement: aFASTFortranImplicitStatement [
	<generated>
	^FASTFortranImplicitStatement new
		label: (self copy: aFASTFortranImplicitStatement label) ;
		typingRules: (self copy: aFASTFortranImplicitStatement typingRules) ;
		startPos: (self copy: aFASTFortranImplicitStatement startPos) ;
		endPos: (self copy: aFASTFortranImplicitStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranImplicitTypingRule: aFASTFortranImplicitTypingRule [
	<generated>
	^FASTFortranImplicitTypingRule new
		type: (self copy: aFASTFortranImplicitTypingRule type) ;
		ranges: (self copy: aFASTFortranImplicitTypingRule ranges) ;
		startPos: (self copy: aFASTFortranImplicitTypingRule startPos) ;
		endPos: (self copy: aFASTFortranImplicitTypingRule endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranImpliedDoExpression: aFASTFortranImpliedDoExpression [
	<generated>
	^FASTFortranImpliedDoExpression new
		loopControl: (self copy: aFASTFortranImpliedDoExpression loopControl) ;
		variables: (self copy: aFASTFortranImpliedDoExpression variables) ;
		startPos: (self copy: aFASTFortranImpliedDoExpression startPos) ;
		endPos: (self copy: aFASTFortranImpliedDoExpression endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIncludeStatement: aFASTFortranIncludeStatement [
	<generated>
	^FASTFortranIncludeStatement new
		label: (self copy: aFASTFortranIncludeStatement label) ;
		startPos: (self copy: aFASTFortranIncludeStatement startPos) ;
		endPos: (self copy: aFASTFortranIncludeStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranInquireStatement: aFASTFortranInquireStatement [
	<generated>
	^FASTFortranInquireStatement new
		ioParameters: (self copy: aFASTFortranInquireStatement ioParameters) ;
		label: (self copy: aFASTFortranInquireStatement label) ;
		startPos: (self copy: aFASTFortranInquireStatement startPos) ;
		endPos: (self copy: aFASTFortranInquireStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIntegerLiteral: aFASTFortranIntegerLiteral [
	<generated>
	^FASTFortranIntegerLiteral new
		primitiveValue: (self copy: aFASTFortranIntegerLiteral primitiveValue) ;
		startPos: (self copy: aFASTFortranIntegerLiteral startPos) ;
		endPos: (self copy: aFASTFortranIntegerLiteral endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIntegerType: aFASTFortranIntegerType [
	<generated>
	^FASTFortranIntegerType new
		size: (self copy: aFASTFortranIntegerType size) ;
		startPos: (self copy: aFASTFortranIntegerType startPos) ;
		endPos: (self copy: aFASTFortranIntegerType endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranIntrinsicStatement: aFASTFortranIntrinsicStatement [
	<generated>
	^FASTFortranIntrinsicStatement new
		variables: (self copy: aFASTFortranIntrinsicStatement variables) ;
		label: (self copy: aFASTFortranIntrinsicStatement label) ;
		startPos: (self copy: aFASTFortranIntrinsicStatement startPos) ;
		endPos: (self copy: aFASTFortranIntrinsicStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranLabelReference: aFASTFortranLabelReference [
	<generated>
	^FASTFortranLabelReference new
		label: (self copy: aFASTFortranLabelReference label) ;
		startPos: (self copy: aFASTFortranLabelReference startPos) ;
		endPos: (self copy: aFASTFortranLabelReference endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranLogicalType: aFASTFortranLogicalType [
	<generated>
	^FASTFortranLogicalType new
		size: (self copy: aFASTFortranLogicalType size) ;
		startPos: (self copy: aFASTFortranLogicalType startPos) ;
		endPos: (self copy: aFASTFortranLogicalType endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranLoopControlExpression: aFASTFortranLoopControlExpression [
	<generated>
	^FASTFortranLoopControlExpression new
		increment: (self copy: aFASTFortranLoopControlExpression increment) ;
		limit: (self copy: aFASTFortranLoopControlExpression limit) ;
		init: (self copy: aFASTFortranLoopControlExpression init) ;
		startPos: (self copy: aFASTFortranLoopControlExpression startPos) ;
		endPos: (self copy: aFASTFortranLoopControlExpression endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranMapStatement: aFASTFortranMapStatement [
	<generated>
	^FASTFortranMapStatement new
		label: (self copy: aFASTFortranMapStatement label) ;
		startPos: (self copy: aFASTFortranMapStatement startPos) ;
		endPos: (self copy: aFASTFortranMapStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranNameListStatement: aFASTFortranNameListStatement [
	<generated>
	^FASTFortranNameListStatement new
		label: (self copy: aFASTFortranNameListStatement label) ;
		startPos: (self copy: aFASTFortranNameListStatement startPos) ;
		endPos: (self copy: aFASTFortranNameListStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranNumericalConstant: aFASTFortranNumericalConstant [
	<generated>
	^FASTFortranNumericalConstant new
		primitiveValue: (self copy: aFASTFortranNumericalConstant primitiveValue) ;
		startPos: (self copy: aFASTFortranNumericalConstant startPos) ;
		endPos: (self copy: aFASTFortranNumericalConstant endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranOpenStatement: aFASTFortranOpenStatement [
	<generated>
	^FASTFortranOpenStatement new
		ioParameters: (self copy: aFASTFortranOpenStatement ioParameters) ;
		label: (self copy: aFASTFortranOpenStatement label) ;
		startPos: (self copy: aFASTFortranOpenStatement startPos) ;
		endPos: (self copy: aFASTFortranOpenStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranOptionsStatement: aFASTFortranOptionsStatement [
	<generated>
	^FASTFortranOptionsStatement new
		label: (self copy: aFASTFortranOptionsStatement label) ;
		startPos: (self copy: aFASTFortranOptionsStatement startPos) ;
		endPos: (self copy: aFASTFortranOptionsStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranParameterStatement: aFASTFortranParameterStatement [
	<generated>
	^FASTFortranParameterStatement new
		label: (self copy: aFASTFortranParameterStatement label) ;
		declarators: (self copy: aFASTFortranParameterStatement declarators) ;
		startPos: (self copy: aFASTFortranParameterStatement startPos) ;
		endPos: (self copy: aFASTFortranParameterStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranPauseStatement: aFASTFortranPauseStatement [
	<generated>
	^FASTFortranPauseStatement new
		label: (self copy: aFASTFortranPauseStatement label) ;
		displayArgument: (self copy: aFASTFortranPauseStatement displayArgument) ;
		startPos: (self copy: aFASTFortranPauseStatement startPos) ;
		endPos: (self copy: aFASTFortranPauseStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranPragmaStatement: aFASTFortranPragmaStatement [
	<generated>
	^FASTFortranPragmaStatement new
		label: (self copy: aFASTFortranPragmaStatement label) ;
		startPos: (self copy: aFASTFortranPragmaStatement startPos) ;
		endPos: (self copy: aFASTFortranPragmaStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranPrintStatement: aFASTFortranPrintStatement [
	<generated>
	^FASTFortranPrintStatement new
		format: (self copy: aFASTFortranPrintStatement format) ;
		arguments: (self copy: aFASTFortranPrintStatement arguments) ;
		label: (self copy: aFASTFortranPrintStatement label) ;
		startPos: (self copy: aFASTFortranPrintStatement startPos) ;
		endPos: (self copy: aFASTFortranPrintStatement endPos) ;
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
		startPos: (self copy: aFASTFortranProcedure startPos) ;
		endPos: (self copy: aFASTFortranProcedure endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranProgramFile: aFASTFortranProgramFile [
	<generated>
	^FASTFortranProgramFile new
		comments: (self copy: aFASTFortranProgramFile comments) ;
		programUnit: (self copy: aFASTFortranProgramFile programUnit) ;
		startPos: (self copy: aFASTFortranProgramFile startPos) ;
		endPos: (self copy: aFASTFortranProgramFile endPos) ;
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
		startPos: (self copy: aFASTFortranProgramMain startPos) ;
		endPos: (self copy: aFASTFortranProgramMain endPos) ;
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
		startPos: (self copy: aFASTFortranProgramUnit startPos) ;
		endPos: (self copy: aFASTFortranProgramUnit endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranReadStatement: aFASTFortranReadStatement [
	<generated>
	^FASTFortranReadStatement new
		ioParameters: (self copy: aFASTFortranReadStatement ioParameters) ;
		arguments: (self copy: aFASTFortranReadStatement arguments) ;
		label: (self copy: aFASTFortranReadStatement label) ;
		startPos: (self copy: aFASTFortranReadStatement startPos) ;
		endPos: (self copy: aFASTFortranReadStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranRealLiteral: aFASTFortranRealLiteral [
	<generated>
	^FASTFortranRealLiteral new
		primitiveValue: (self copy: aFASTFortranRealLiteral primitiveValue) ;
		startPos: (self copy: aFASTFortranRealLiteral startPos) ;
		endPos: (self copy: aFASTFortranRealLiteral endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranRealType: aFASTFortranRealType [
	<generated>
	^FASTFortranRealType new
		size: (self copy: aFASTFortranRealType size) ;
		startPos: (self copy: aFASTFortranRealType startPos) ;
		endPos: (self copy: aFASTFortranRealType endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranReturnStatement: aFASTFortranReturnStatement [
	<generated>
	^FASTFortranReturnStatement new
		label: (self copy: aFASTFortranReturnStatement label) ;
		expression: (self copy: aFASTFortranReturnStatement expression) ;
		alternateReturnLabel: (self copy: aFASTFortranReturnStatement alternateReturnLabel) ;
		startPos: (self copy: aFASTFortranReturnStatement startPos) ;
		endPos: (self copy: aFASTFortranReturnStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranRewindStatement: aFASTFortranRewindStatement [
	<generated>
	^FASTFortranRewindStatement new
		ioParameters: (self copy: aFASTFortranRewindStatement ioParameters) ;
		label: (self copy: aFASTFortranRewindStatement label) ;
		startPos: (self copy: aFASTFortranRewindStatement startPos) ;
		endPos: (self copy: aFASTFortranRewindStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranSaveStatement: aFASTFortranSaveStatement [
	<generated>
	^FASTFortranSaveStatement new
		label: (self copy: aFASTFortranSaveStatement label) ;
		startPos: (self copy: aFASTFortranSaveStatement startPos) ;
		endPos: (self copy: aFASTFortranSaveStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [
	<generated>
	^FASTFortranScalarVariable new
		name: (self copy: aFASTFortranScalarVariable name) ;
		startPos: (self copy: aFASTFortranScalarVariable startPos) ;
		endPos: (self copy: aFASTFortranScalarVariable endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [
	<generated>
	^FASTFortranStatementBlock new
		comments: (self copy: aFASTFortranStatementBlock comments) ;
		statements: (self copy: aFASTFortranStatementBlock statements) ;
		startPos: (self copy: aFASTFortranStatementBlock startPos) ;
		endPos: (self copy: aFASTFortranStatementBlock endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranStaticStatement: aFASTFortranStaticStatement [
	<generated>
	^FASTFortranStaticStatement new
		label: (self copy: aFASTFortranStaticStatement label) ;
		startPos: (self copy: aFASTFortranStaticStatement startPos) ;
		endPos: (self copy: aFASTFortranStaticStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranStopStatement: aFASTFortranStopStatement [
	<generated>
	^FASTFortranStopStatement new
		label: (self copy: aFASTFortranStopStatement label) ;
		displayArgument: (self copy: aFASTFortranStopStatement displayArgument) ;
		startPos: (self copy: aFASTFortranStopStatement startPos) ;
		endPos: (self copy: aFASTFortranStopStatement endPos) ;
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
		startPos: (self copy: aFASTFortranSubprogram startPos) ;
		endPos: (self copy: aFASTFortranSubprogram endPos) ;
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
		startPos: (self copy: aFASTFortranSubroutine startPos) ;
		endPos: (self copy: aFASTFortranSubroutine endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranSubstring: aFASTFortranSubstring [
	<generated>
	^FASTFortranSubstring new
		startPos: (self copy: aFASTFortranSubstring startPos) ;
		endPos: (self copy: aFASTFortranSubstring endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranType: aFASTFortranType [
	<generated>
	^FASTFortranType new
		size: (self copy: aFASTFortranType size) ;
		startPos: (self copy: aFASTFortranType startPos) ;
		endPos: (self copy: aFASTFortranType endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranUnaryExpression: aFASTFortranUnaryExpression [
	<generated>
	^FASTFortranUnaryExpression new
		expression: (self copy: aFASTFortranUnaryExpression expression) ;
		startPos: (self copy: aFASTFortranUnaryExpression startPos) ;
		endPos: (self copy: aFASTFortranUnaryExpression endPos) ;
		operator: (self copy: aFASTFortranUnaryExpression operator) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranUnionStatement: aFASTFortranUnionStatement [
	<generated>
	^FASTFortranUnionStatement new
		label: (self copy: aFASTFortranUnionStatement label) ;
		startPos: (self copy: aFASTFortranUnionStatement startPos) ;
		endPos: (self copy: aFASTFortranUnionStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranVariable: aFASTFortranVariable [
	<generated>
	^FASTFortranVariable new
		name: (self copy: aFASTFortranVariable name) ;
		startPos: (self copy: aFASTFortranVariable startPos) ;
		endPos: (self copy: aFASTFortranVariable endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranVariableDeclarationStatement: aFASTFortranVariableDeclarationStatement [
	<generated>
	^FASTFortranVariableDeclarationStatement new
		type: (self copy: aFASTFortranVariableDeclarationStatement type) ;
		label: (self copy: aFASTFortranVariableDeclarationStatement label) ;
		declarators: (self copy: aFASTFortranVariableDeclarationStatement declarators) ;
		startPos: (self copy: aFASTFortranVariableDeclarationStatement startPos) ;
		endPos: (self copy: aFASTFortranVariableDeclarationStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranVariableDeclarator: aFASTFortranVariableDeclarator [
	<generated>
	^FASTFortranVariableDeclarator new
		variable: (self copy: aFASTFortranVariableDeclarator variable) ;
		dimensions: (self copy: aFASTFortranVariableDeclarator dimensions) ;
		expression: (self copy: aFASTFortranVariableDeclarator expression) ;
		startPos: (self copy: aFASTFortranVariableDeclarator startPos) ;
		endPos: (self copy: aFASTFortranVariableDeclarator endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranVirtualStatement: aFASTFortranVirtualStatement [
	<generated>
	^FASTFortranVirtualStatement new
		label: (self copy: aFASTFortranVirtualStatement label) ;
		startPos: (self copy: aFASTFortranVirtualStatement startPos) ;
		endPos: (self copy: aFASTFortranVirtualStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranVolatileStatement: aFASTFortranVolatileStatement [
	<generated>
	^FASTFortranVolatileStatement new
		label: (self copy: aFASTFortranVolatileStatement label) ;
		startPos: (self copy: aFASTFortranVolatileStatement startPos) ;
		endPos: (self copy: aFASTFortranVolatileStatement endPos) ;
		yourself

]

{ #category : #'as yet unclassified' }
FASTFortranCopyVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [
	<generated>
	^FASTFortranWriteStatement new
		ioParameters: (self copy: aFASTFortranWriteStatement ioParameters) ;
		arguments: (self copy: aFASTFortranWriteStatement arguments) ;
		label: (self copy: aFASTFortranWriteStatement label) ;
		startPos: (self copy: aFASTFortranWriteStatement startPos) ;
		endPos: (self copy: aFASTFortranWriteStatement endPos) ;
		yourself

]
