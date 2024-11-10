Class {
	#name : 'FASTFortranCopyVisitor',
	#superclass : 'FASTFortranVisitor',
	#category : 'FAST-Fortran-Visitors-Visitor',
	#package : 'FAST-Fortran-Visitors',
	#tag : 'Visitor'
}

{ #category : 'visiting' }
FASTFortranCopyVisitor class >> visit: anAST [

	^anAST accept: self new
]

{ #category : 'copying' }
FASTFortranCopyVisitor >> copy: aNode [
	"Note: Pharo isLiterals are not copied, but FAST isLiteral are"

	aNode ifNil: [ ^nil ].
	(aNode isLiteral and: [aNode isMooseEntity not]) ifTrue: [ ^aNode ].
	aNode isCollection ifFalse: [ ^aNode accept: self ].
	^aNode collect: [ :each | self copy: each ]
]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractExpression: aFASTFortranAbstractExpression [
	<generated>
	^FASTFortranAbstractExpression new
		allTagAssociations: (self copy: aFASTFortranAbstractExpression allTagAssociations) ;
		endPos: (self copy: aFASTFortranAbstractExpression endPos) ;
		startPos: (self copy: aFASTFortranAbstractExpression startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractIOStatement: aFASTFortranAbstractIOStatement [
	<generated>
	^FASTFortranAbstractIOStatement new
		allTagAssociations: (self copy: aFASTFortranAbstractIOStatement allTagAssociations) ;
		ioParameters: (self copy: aFASTFortranAbstractIOStatement ioParameters) ;
		label: (self copy: aFASTFortranAbstractIOStatement label) ;
		startPos: (self copy: aFASTFortranAbstractIOStatement startPos) ;
		endPos: (self copy: aFASTFortranAbstractIOStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractLiteral: aFASTFortranAbstractLiteral [
	<generated>
	^FASTFortranAbstractLiteral new
		allTagAssociations: (self copy: aFASTFortranAbstractLiteral allTagAssociations) ;
		endPos: (self copy: aFASTFortranAbstractLiteral endPos) ;
		startPos: (self copy: aFASTFortranAbstractLiteral startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractStatement: aFASTFortranAbstractStatement [
	<generated>
	^FASTFortranAbstractStatement new
		allTagAssociations: (self copy: aFASTFortranAbstractStatement allTagAssociations) ;
		label: (self copy: aFASTFortranAbstractStatement label) ;
		startPos: (self copy: aFASTFortranAbstractStatement startPos) ;
		endPos: (self copy: aFASTFortranAbstractStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranAcceptStatement: aFASTFortranAcceptStatement [
	<generated>
	^FASTFortranAcceptStatement new
		allTagAssociations: (self copy: aFASTFortranAcceptStatement allTagAssociations) ;
		label: (self copy: aFASTFortranAcceptStatement label) ;
		startPos: (self copy: aFASTFortranAcceptStatement startPos) ;
		endPos: (self copy: aFASTFortranAcceptStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranAmpersand: aFASTFortranAmpersand [
	<generated>
	^FASTFortranAmpersand new
		allTagAssociations: (self copy: aFASTFortranAmpersand allTagAssociations) ;
		primitiveValue: (self copy: aFASTFortranAmpersand primitiveValue) ;
		endPos: (self copy: aFASTFortranAmpersand endPos) ;
		startPos: (self copy: aFASTFortranAmpersand startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranArrayRange: aFASTFortranArrayRange [
	<generated>
	^FASTFortranArrayRange new
		allTagAssociations: (self copy: aFASTFortranArrayRange allTagAssociations) ;
		lowerBound: (self copy: aFASTFortranArrayRange lowerBound) ;
		upperBound: (self copy: aFASTFortranArrayRange upperBound) ;
		endPos: (self copy: aFASTFortranArrayRange endPos) ;
		startPos: (self copy: aFASTFortranArrayRange startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [
	<generated>
	^FASTFortranArrayVariable new
		allTagAssociations: (self copy: aFASTFortranArrayVariable allTagAssociations) ;
		name: (self copy: aFASTFortranArrayVariable name) ;
		indices: (self copy: aFASTFortranArrayVariable indices) ;
		endPos: (self copy: aFASTFortranArrayVariable endPos) ;
		startPos: (self copy: aFASTFortranArrayVariable startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranAssignmentExpression: aFASTFortranAssignmentExpression [
	<generated>
	^FASTFortranAssignmentExpression new
		allTagAssociations: (self copy: aFASTFortranAssignmentExpression allTagAssociations) ;
		variable: (self copy: aFASTFortranAssignmentExpression variable) ;
		expression: (self copy: aFASTFortranAssignmentExpression expression) ;
		endPos: (self copy: aFASTFortranAssignmentExpression endPos) ;
		startPos: (self copy: aFASTFortranAssignmentExpression startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement [
	<generated>
	^FASTFortranAssignmentStatement new
		allTagAssociations: (self copy: aFASTFortranAssignmentStatement allTagAssociations) ;
		variable: (self copy: aFASTFortranAssignmentStatement variable) ;
		label: (self copy: aFASTFortranAssignmentStatement label) ;
		expression: (self copy: aFASTFortranAssignmentStatement expression) ;
		startPos: (self copy: aFASTFortranAssignmentStatement startPos) ;
		endPos: (self copy: aFASTFortranAssignmentStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranAsterisk: aFASTFortranAsterisk [
	<generated>
	^FASTFortranAsterisk new
		allTagAssociations: (self copy: aFASTFortranAsterisk allTagAssociations) ;
		primitiveValue: (self copy: aFASTFortranAsterisk primitiveValue) ;
		endPos: (self copy: aFASTFortranAsterisk endPos) ;
		startPos: (self copy: aFASTFortranAsterisk startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranAutomaticStatement: aFASTFortranAutomaticStatement [
	<generated>
	^FASTFortranAutomaticStatement new
		allTagAssociations: (self copy: aFASTFortranAutomaticStatement allTagAssociations) ;
		label: (self copy: aFASTFortranAutomaticStatement label) ;
		startPos: (self copy: aFASTFortranAutomaticStatement startPos) ;
		endPos: (self copy: aFASTFortranAutomaticStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranBackspaceStatement: aFASTFortranBackspaceStatement [
	<generated>
	^FASTFortranBackspaceStatement new
		allTagAssociations: (self copy: aFASTFortranBackspaceStatement allTagAssociations) ;
		ioParameters: (self copy: aFASTFortranBackspaceStatement ioParameters) ;
		label: (self copy: aFASTFortranBackspaceStatement label) ;
		startPos: (self copy: aFASTFortranBackspaceStatement startPos) ;
		endPos: (self copy: aFASTFortranBackspaceStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [
	<generated>
	^FASTFortranBinaryExpression new
		allTagAssociations: (self copy: aFASTFortranBinaryExpression allTagAssociations) ;
		leftOperand: (self copy: aFASTFortranBinaryExpression leftOperand) ;
		rightOperand: (self copy: aFASTFortranBinaryExpression rightOperand) ;
		endPos: (self copy: aFASTFortranBinaryExpression endPos) ;
		startPos: (self copy: aFASTFortranBinaryExpression startPos) ;
		operator: (self copy: aFASTFortranBinaryExpression operator) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranBlockData: aFASTFortranBlockData [
	<generated>
	^FASTFortranBlockData new
		declarations: (self copy: aFASTFortranBlockData declarations) ;
		comments: (self copy: aFASTFortranBlockData comments) ;
		allTagAssociations: (self copy: aFASTFortranBlockData allTagAssociations) ;
		name: (self copy: aFASTFortranBlockData name) ;
		parameters: (self copy: aFASTFortranBlockData parameters) ;
		statementBlock: (self copy: aFASTFortranBlockData statementBlock) ;
		startPos: (self copy: aFASTFortranBlockData startPos) ;
		endPos: (self copy: aFASTFortranBlockData endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranBooleanLiteral: aFASTFortranBooleanLiteral [
	<generated>
	^FASTFortranBooleanLiteral new
		allTagAssociations: (self copy: aFASTFortranBooleanLiteral allTagAssociations) ;
		primitiveValue: (self copy: aFASTFortranBooleanLiteral primitiveValue) ;
		endPos: (self copy: aFASTFortranBooleanLiteral endPos) ;
		startPos: (self copy: aFASTFortranBooleanLiteral startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranByteType: aFASTFortranByteType [
	<generated>
	^FASTFortranByteType new
		allTagAssociations: (self copy: aFASTFortranByteType allTagAssociations) ;
		size: (self copy: aFASTFortranByteType size) ;
		startPos: (self copy: aFASTFortranByteType startPos) ;
		endPos: (self copy: aFASTFortranByteType endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [
	<generated>
	^FASTFortranCallStatement new
		allTagAssociations: (self copy: aFASTFortranCallStatement allTagAssociations) ;
		name: (self copy: aFASTFortranCallStatement name) ;
		arguments: (self copy: aFASTFortranCallStatement arguments) ;
		label: (self copy: aFASTFortranCallStatement label) ;
		startPos: (self copy: aFASTFortranCallStatement startPos) ;
		endPos: (self copy: aFASTFortranCallStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranCharacterLiteral: aFASTFortranCharacterLiteral [
	<generated>
	^FASTFortranCharacterLiteral new
		allTagAssociations: (self copy: aFASTFortranCharacterLiteral allTagAssociations) ;
		primitiveValue: (self copy: aFASTFortranCharacterLiteral primitiveValue) ;
		endPos: (self copy: aFASTFortranCharacterLiteral endPos) ;
		startPos: (self copy: aFASTFortranCharacterLiteral startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranCharacterType: aFASTFortranCharacterType [
	<generated>
	^FASTFortranCharacterType new
		allTagAssociations: (self copy: aFASTFortranCharacterType allTagAssociations) ;
		size: (self copy: aFASTFortranCharacterType size) ;
		startPos: (self copy: aFASTFortranCharacterType startPos) ;
		endPos: (self copy: aFASTFortranCharacterType endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranCloseStatement: aFASTFortranCloseStatement [
	<generated>
	^FASTFortranCloseStatement new
		allTagAssociations: (self copy: aFASTFortranCloseStatement allTagAssociations) ;
		ioParameters: (self copy: aFASTFortranCloseStatement ioParameters) ;
		label: (self copy: aFASTFortranCloseStatement label) ;
		startPos: (self copy: aFASTFortranCloseStatement startPos) ;
		endPos: (self copy: aFASTFortranCloseStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranComment: aFASTFortranComment [
	<generated>
	^FASTFortranComment new
		allTagAssociations: (self copy: aFASTFortranComment allTagAssociations) ;
		content: (self copy: aFASTFortranComment content) ;
		startPos: (self copy: aFASTFortranComment startPos) ;
		endPos: (self copy: aFASTFortranComment endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranCommonGroup: aFASTFortranCommonGroup [
	<generated>
	^FASTFortranCommonGroup new
		allTagAssociations: (self copy: aFASTFortranCommonGroup allTagAssociations) ;
		name: (self copy: aFASTFortranCommonGroup name) ;
		declarators: (self copy: aFASTFortranCommonGroup declarators) ;
		startPos: (self copy: aFASTFortranCommonGroup startPos) ;
		endPos: (self copy: aFASTFortranCommonGroup endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranCommonStatement: aFASTFortranCommonStatement [
	<generated>
	^FASTFortranCommonStatement new
		allTagAssociations: (self copy: aFASTFortranCommonStatement allTagAssociations) ;
		groups: (self copy: aFASTFortranCommonStatement groups) ;
		label: (self copy: aFASTFortranCommonStatement label) ;
		startPos: (self copy: aFASTFortranCommonStatement startPos) ;
		endPos: (self copy: aFASTFortranCommonStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranComplexLiteral: aFASTFortranComplexLiteral [
	<generated>
	^FASTFortranComplexLiteral new
		allTagAssociations: (self copy: aFASTFortranComplexLiteral allTagAssociations) ;
		primitiveValue: (self copy: aFASTFortranComplexLiteral primitiveValue) ;
		endPos: (self copy: aFASTFortranComplexLiteral endPos) ;
		startPos: (self copy: aFASTFortranComplexLiteral startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranComplexType: aFASTFortranComplexType [
	<generated>
	^FASTFortranComplexType new
		allTagAssociations: (self copy: aFASTFortranComplexType allTagAssociations) ;
		size: (self copy: aFASTFortranComplexType size) ;
		startPos: (self copy: aFASTFortranComplexType startPos) ;
		endPos: (self copy: aFASTFortranComplexType endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranConditionalStatement: aFASTFortranConditionalStatement [
	<generated>
	^FASTFortranConditionalStatement new
		condition: (self copy: aFASTFortranConditionalStatement condition) ;
		allTagAssociations: (self copy: aFASTFortranConditionalStatement allTagAssociations) ;
		label: (self copy: aFASTFortranConditionalStatement label) ;
		startPos: (self copy: aFASTFortranConditionalStatement startPos) ;
		endPos: (self copy: aFASTFortranConditionalStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranContinueStatement: aFASTFortranContinueStatement [
	<generated>
	^FASTFortranContinueStatement new
		allTagAssociations: (self copy: aFASTFortranContinueStatement allTagAssociations) ;
		label: (self copy: aFASTFortranContinueStatement label) ;
		startPos: (self copy: aFASTFortranContinueStatement startPos) ;
		endPos: (self copy: aFASTFortranContinueStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranDataGroup: aFASTFortranDataGroup [
	<generated>
	^FASTFortranDataGroup new
		dataConstants: (self copy: aFASTFortranDataGroup dataConstants) ;
		allTagAssociations: (self copy: aFASTFortranDataGroup allTagAssociations) ;
		variables: (self copy: aFASTFortranDataGroup variables) ;
		startPos: (self copy: aFASTFortranDataGroup startPos) ;
		endPos: (self copy: aFASTFortranDataGroup endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranDataStatement: aFASTFortranDataStatement [
	<generated>
	^FASTFortranDataStatement new
		allTagAssociations: (self copy: aFASTFortranDataStatement allTagAssociations) ;
		variableGroups: (self copy: aFASTFortranDataStatement variableGroups) ;
		label: (self copy: aFASTFortranDataStatement label) ;
		startPos: (self copy: aFASTFortranDataStatement startPos) ;
		endPos: (self copy: aFASTFortranDataStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranDecodeStatement: aFASTFortranDecodeStatement [
	<generated>
	^FASTFortranDecodeStatement new
		allTagAssociations: (self copy: aFASTFortranDecodeStatement allTagAssociations) ;
		ioParameters: (self copy: aFASTFortranDecodeStatement ioParameters) ;
		label: (self copy: aFASTFortranDecodeStatement label) ;
		startPos: (self copy: aFASTFortranDecodeStatement startPos) ;
		endPos: (self copy: aFASTFortranDecodeStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranDimensionStatement: aFASTFortranDimensionStatement [
	<generated>
	^FASTFortranDimensionStatement new
		allTagAssociations: (self copy: aFASTFortranDimensionStatement allTagAssociations) ;
		label: (self copy: aFASTFortranDimensionStatement label) ;
		declarators: (self copy: aFASTFortranDimensionStatement declarators) ;
		startPos: (self copy: aFASTFortranDimensionStatement startPos) ;
		endPos: (self copy: aFASTFortranDimensionStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [
	<generated>
	^FASTFortranDoStatement new
		labelReferences: (self copy: aFASTFortranDoStatement labelReferences) ;
		allTagAssociations: (self copy: aFASTFortranDoStatement allTagAssociations) ;
		loopControl: (self copy: aFASTFortranDoStatement loopControl) ;
		label: (self copy: aFASTFortranDoStatement label) ;
		statementBlock: (self copy: aFASTFortranDoStatement statementBlock) ;
		startPos: (self copy: aFASTFortranDoStatement startPos) ;
		endPos: (self copy: aFASTFortranDoStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement [
	<generated>
	^FASTFortranDoWhileStatement new
		condition: (self copy: aFASTFortranDoWhileStatement condition) ;
		allTagAssociations: (self copy: aFASTFortranDoWhileStatement allTagAssociations) ;
		label: (self copy: aFASTFortranDoWhileStatement label) ;
		startPos: (self copy: aFASTFortranDoWhileStatement startPos) ;
		endPos: (self copy: aFASTFortranDoWhileStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranDoubleComplexLiteral: aFASTFortranDoubleComplexLiteral [
	<generated>
	^FASTFortranDoubleComplexLiteral new
		allTagAssociations: (self copy: aFASTFortranDoubleComplexLiteral allTagAssociations) ;
		primitiveValue: (self copy: aFASTFortranDoubleComplexLiteral primitiveValue) ;
		endPos: (self copy: aFASTFortranDoubleComplexLiteral endPos) ;
		startPos: (self copy: aFASTFortranDoubleComplexLiteral startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranDoubleComplexType: aFASTFortranDoubleComplexType [
	<generated>
	^FASTFortranDoubleComplexType new
		allTagAssociations: (self copy: aFASTFortranDoubleComplexType allTagAssociations) ;
		size: (self copy: aFASTFortranDoubleComplexType size) ;
		startPos: (self copy: aFASTFortranDoubleComplexType startPos) ;
		endPos: (self copy: aFASTFortranDoubleComplexType endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranDoublePrecisionLiteral: aFASTFortranDoublePrecisionLiteral [
	<generated>
	^FASTFortranDoublePrecisionLiteral new
		allTagAssociations: (self copy: aFASTFortranDoublePrecisionLiteral allTagAssociations) ;
		primitiveValue: (self copy: aFASTFortranDoublePrecisionLiteral primitiveValue) ;
		endPos: (self copy: aFASTFortranDoublePrecisionLiteral endPos) ;
		startPos: (self copy: aFASTFortranDoublePrecisionLiteral startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranDoublePrecisionType: aFASTFortranDoublePrecisionType [
	<generated>
	^FASTFortranDoublePrecisionType new
		allTagAssociations: (self copy: aFASTFortranDoublePrecisionType allTagAssociations) ;
		size: (self copy: aFASTFortranDoublePrecisionType size) ;
		startPos: (self copy: aFASTFortranDoublePrecisionType startPos) ;
		endPos: (self copy: aFASTFortranDoublePrecisionType endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranElseStatement: aFASTFortranElseStatement [
	<generated>
	^FASTFortranElseStatement new
		allTagAssociations: (self copy: aFASTFortranElseStatement allTagAssociations) ;
		label: (self copy: aFASTFortranElseStatement label) ;
		startPos: (self copy: aFASTFortranElseStatement startPos) ;
		endPos: (self copy: aFASTFortranElseStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranEncodeStatement: aFASTFortranEncodeStatement [
	<generated>
	^FASTFortranEncodeStatement new
		allTagAssociations: (self copy: aFASTFortranEncodeStatement allTagAssociations) ;
		ioParameters: (self copy: aFASTFortranEncodeStatement ioParameters) ;
		label: (self copy: aFASTFortranEncodeStatement label) ;
		startPos: (self copy: aFASTFortranEncodeStatement startPos) ;
		endPos: (self copy: aFASTFortranEncodeStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranEndFileStatement: aFASTFortranEndFileStatement [
	<generated>
	^FASTFortranEndFileStatement new
		allTagAssociations: (self copy: aFASTFortranEndFileStatement allTagAssociations) ;
		ioParameters: (self copy: aFASTFortranEndFileStatement ioParameters) ;
		label: (self copy: aFASTFortranEndFileStatement label) ;
		startPos: (self copy: aFASTFortranEndFileStatement startPos) ;
		endPos: (self copy: aFASTFortranEndFileStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranEntity: aFASTFortranEntity [
	<generated>
	^FASTFortranEntity new
		allTagAssociations: (self copy: aFASTFortranEntity allTagAssociations) ;
		startPos: (self copy: aFASTFortranEntity startPos) ;
		endPos: (self copy: aFASTFortranEntity endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranEntryStatement: aFASTFortranEntryStatement [
	<generated>
	^FASTFortranEntryStatement new
		allTagAssociations: (self copy: aFASTFortranEntryStatement allTagAssociations) ;
		name: (self copy: aFASTFortranEntryStatement name) ;
		label: (self copy: aFASTFortranEntryStatement label) ;
		entryArguments: (self copy: aFASTFortranEntryStatement entryArguments) ;
		startPos: (self copy: aFASTFortranEntryStatement startPos) ;
		endPos: (self copy: aFASTFortranEntryStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranEquivalenceGroup: aFASTFortranEquivalenceGroup [
	<generated>
	^FASTFortranEquivalenceGroup new
		allTagAssociations: (self copy: aFASTFortranEquivalenceGroup allTagAssociations) ;
		variables: (self copy: aFASTFortranEquivalenceGroup variables) ;
		startPos: (self copy: aFASTFortranEquivalenceGroup startPos) ;
		endPos: (self copy: aFASTFortranEquivalenceGroup endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranEquivalenceStatement: aFASTFortranEquivalenceStatement [
	<generated>
	^FASTFortranEquivalenceStatement new
		allTagAssociations: (self copy: aFASTFortranEquivalenceStatement allTagAssociations) ;
		variableGroups: (self copy: aFASTFortranEquivalenceStatement variableGroups) ;
		label: (self copy: aFASTFortranEquivalenceStatement label) ;
		startPos: (self copy: aFASTFortranEquivalenceStatement startPos) ;
		endPos: (self copy: aFASTFortranEquivalenceStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [
	<generated>
	^FASTFortranExitStatement new
		allTagAssociations: (self copy: aFASTFortranExitStatement allTagAssociations) ;
		label: (self copy: aFASTFortranExitStatement label) ;
		startPos: (self copy: aFASTFortranExitStatement startPos) ;
		endPos: (self copy: aFASTFortranExitStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranExternalStatement: aFASTFortranExternalStatement [
	<generated>
	^FASTFortranExternalStatement new
		allTagAssociations: (self copy: aFASTFortranExternalStatement allTagAssociations) ;
		name: (self copy: aFASTFortranExternalStatement name) ;
		label: (self copy: aFASTFortranExternalStatement label) ;
		startPos: (self copy: aFASTFortranExternalStatement startPos) ;
		endPos: (self copy: aFASTFortranExternalStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranFormatStatement: aFASTFortranFormatStatement [
	<generated>
	^FASTFortranFormatStatement new
		allTagAssociations: (self copy: aFASTFortranFormatStatement allTagAssociations) ;
		format: (self copy: aFASTFortranFormatStatement format) ;
		label: (self copy: aFASTFortranFormatStatement label) ;
		formatDescription: (self copy: aFASTFortranFormatStatement formatDescription) ;
		startPos: (self copy: aFASTFortranFormatStatement startPos) ;
		endPos: (self copy: aFASTFortranFormatStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranFunction: aFASTFortranFunction [
	<generated>
	^FASTFortranFunction new
		declarations: (self copy: aFASTFortranFunction declarations) ;
		comments: (self copy: aFASTFortranFunction comments) ;
		allTagAssociations: (self copy: aFASTFortranFunction allTagAssociations) ;
		name: (self copy: aFASTFortranFunction name) ;
		parameters: (self copy: aFASTFortranFunction parameters) ;
		returnType: (self copy: aFASTFortranFunction returnType) ;
		statementBlock: (self copy: aFASTFortranFunction statementBlock) ;
		startPos: (self copy: aFASTFortranFunction startPos) ;
		endPos: (self copy: aFASTFortranFunction endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranFunctionCall: aFASTFortranFunctionCall [
	<generated>
	^FASTFortranFunctionCall new
		allTagAssociations: (self copy: aFASTFortranFunctionCall allTagAssociations) ;
		name: (self copy: aFASTFortranFunctionCall name) ;
		arguments: (self copy: aFASTFortranFunctionCall arguments) ;
		endPos: (self copy: aFASTFortranFunctionCall endPos) ;
		startPos: (self copy: aFASTFortranFunctionCall startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranFunctionStatement: aFASTFortranFunctionStatement [
	<generated>
	^FASTFortranFunctionStatement new
		allTagAssociations: (self copy: aFASTFortranFunctionStatement allTagAssociations) ;
		name: (self copy: aFASTFortranFunctionStatement name) ;
		arguments: (self copy: aFASTFortranFunctionStatement arguments) ;
		label: (self copy: aFASTFortranFunctionStatement label) ;
		expression: (self copy: aFASTFortranFunctionStatement expression) ;
		startPos: (self copy: aFASTFortranFunctionStatement startPos) ;
		endPos: (self copy: aFASTFortranFunctionStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranGoToAssignedStatement: aFASTFortranGoToAssignedStatement [
	<generated>
	^FASTFortranGoToAssignedStatement new
		labelReferences: (self copy: aFASTFortranGoToAssignedStatement labelReferences) ;
		allTagAssociations: (self copy: aFASTFortranGoToAssignedStatement allTagAssociations) ;
		label: (self copy: aFASTFortranGoToAssignedStatement label) ;
		selectorExpression: (self copy: aFASTFortranGoToAssignedStatement selectorExpression) ;
		startPos: (self copy: aFASTFortranGoToAssignedStatement startPos) ;
		endPos: (self copy: aFASTFortranGoToAssignedStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [
	<generated>
	^FASTFortranGoToComputedStatement new
		labelReferences: (self copy: aFASTFortranGoToComputedStatement labelReferences) ;
		allTagAssociations: (self copy: aFASTFortranGoToComputedStatement allTagAssociations) ;
		label: (self copy: aFASTFortranGoToComputedStatement label) ;
		selectorExpression: (self copy: aFASTFortranGoToComputedStatement selectorExpression) ;
		startPos: (self copy: aFASTFortranGoToComputedStatement startPos) ;
		endPos: (self copy: aFASTFortranGoToComputedStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [
	<generated>
	^FASTFortranGoToStatement new
		labelReferences: (self copy: aFASTFortranGoToStatement labelReferences) ;
		allTagAssociations: (self copy: aFASTFortranGoToStatement allTagAssociations) ;
		label: (self copy: aFASTFortranGoToStatement label) ;
		startPos: (self copy: aFASTFortranGoToStatement startPos) ;
		endPos: (self copy: aFASTFortranGoToStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [
	<generated>
	^FASTFortranIfArithmeticStatement new
		condition: (self copy: aFASTFortranIfArithmeticStatement condition) ;
		allTagAssociations: (self copy: aFASTFortranIfArithmeticStatement allTagAssociations) ;
		lessLabel: (self copy: aFASTFortranIfArithmeticStatement lessLabel) ;
		label: (self copy: aFASTFortranIfArithmeticStatement label) ;
		equalLabel: (self copy: aFASTFortranIfArithmeticStatement equalLabel) ;
		startPos: (self copy: aFASTFortranIfArithmeticStatement startPos) ;
		endPos: (self copy: aFASTFortranIfArithmeticStatement endPos) ;
		greaterLabel: (self copy: aFASTFortranIfArithmeticStatement greaterLabel) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [
	<generated>
	^FASTFortranIfBlockStatement new
		condition: (self copy: aFASTFortranIfBlockStatement condition) ;
		allTagAssociations: (self copy: aFASTFortranIfBlockStatement allTagAssociations) ;
		thenStatementBlock: (self copy: aFASTFortranIfBlockStatement thenStatementBlock) ;
		elseStatementBlock: (self copy: aFASTFortranIfBlockStatement elseStatementBlock) ;
		label: (self copy: aFASTFortranIfBlockStatement label) ;
		startPos: (self copy: aFASTFortranIfBlockStatement startPos) ;
		endPos: (self copy: aFASTFortranIfBlockStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [
	<generated>
	^FASTFortranIfLogicalStatement new
		condition: (self copy: aFASTFortranIfLogicalStatement condition) ;
		allTagAssociations: (self copy: aFASTFortranIfLogicalStatement allTagAssociations) ;
		statement: (self copy: aFASTFortranIfLogicalStatement statement) ;
		label: (self copy: aFASTFortranIfLogicalStatement label) ;
		startPos: (self copy: aFASTFortranIfLogicalStatement startPos) ;
		endPos: (self copy: aFASTFortranIfLogicalStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranImplicitLocalDeclaration: aFASTFortranImplicitLocalDeclaration [
	<generated>
	^FASTFortranImplicitLocalDeclaration new
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranImplicitRange: aFASTFortranImplicitRange [
	<generated>
	^FASTFortranImplicitRange new
		allTagAssociations: (self copy: aFASTFortranImplicitRange allTagAssociations) ;
		to: (self copy: aFASTFortranImplicitRange to) ;
		from: (self copy: aFASTFortranImplicitRange from) ;
		startPos: (self copy: aFASTFortranImplicitRange startPos) ;
		endPos: (self copy: aFASTFortranImplicitRange endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranImplicitStatement: aFASTFortranImplicitStatement [
	<generated>
	^FASTFortranImplicitStatement new
		allTagAssociations: (self copy: aFASTFortranImplicitStatement allTagAssociations) ;
		label: (self copy: aFASTFortranImplicitStatement label) ;
		typingRules: (self copy: aFASTFortranImplicitStatement typingRules) ;
		startPos: (self copy: aFASTFortranImplicitStatement startPos) ;
		endPos: (self copy: aFASTFortranImplicitStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranImplicitTypingRule: aFASTFortranImplicitTypingRule [
	<generated>
	^FASTFortranImplicitTypingRule new
		allTagAssociations: (self copy: aFASTFortranImplicitTypingRule allTagAssociations) ;
		type: (self copy: aFASTFortranImplicitTypingRule type) ;
		ranges: (self copy: aFASTFortranImplicitTypingRule ranges) ;
		startPos: (self copy: aFASTFortranImplicitTypingRule startPos) ;
		endPos: (self copy: aFASTFortranImplicitTypingRule endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranImpliedDoExpression: aFASTFortranImpliedDoExpression [
	<generated>
	^FASTFortranImpliedDoExpression new
		allTagAssociations: (self copy: aFASTFortranImpliedDoExpression allTagAssociations) ;
		loopControl: (self copy: aFASTFortranImpliedDoExpression loopControl) ;
		variables: (self copy: aFASTFortranImpliedDoExpression variables) ;
		endPos: (self copy: aFASTFortranImpliedDoExpression endPos) ;
		startPos: (self copy: aFASTFortranImpliedDoExpression startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranIncludeStatement: aFASTFortranIncludeStatement [
	<generated>
	^FASTFortranIncludeStatement new
		allTagAssociations: (self copy: aFASTFortranIncludeStatement allTagAssociations) ;
		label: (self copy: aFASTFortranIncludeStatement label) ;
		startPos: (self copy: aFASTFortranIncludeStatement startPos) ;
		endPos: (self copy: aFASTFortranIncludeStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranInquireStatement: aFASTFortranInquireStatement [
	<generated>
	^FASTFortranInquireStatement new
		allTagAssociations: (self copy: aFASTFortranInquireStatement allTagAssociations) ;
		ioParameters: (self copy: aFASTFortranInquireStatement ioParameters) ;
		label: (self copy: aFASTFortranInquireStatement label) ;
		startPos: (self copy: aFASTFortranInquireStatement startPos) ;
		endPos: (self copy: aFASTFortranInquireStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranIntegerLiteral: aFASTFortranIntegerLiteral [
	<generated>
	^FASTFortranIntegerLiteral new
		allTagAssociations: (self copy: aFASTFortranIntegerLiteral allTagAssociations) ;
		primitiveValue: (self copy: aFASTFortranIntegerLiteral primitiveValue) ;
		endPos: (self copy: aFASTFortranIntegerLiteral endPos) ;
		startPos: (self copy: aFASTFortranIntegerLiteral startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranIntegerType: aFASTFortranIntegerType [
	<generated>
	^FASTFortranIntegerType new
		allTagAssociations: (self copy: aFASTFortranIntegerType allTagAssociations) ;
		size: (self copy: aFASTFortranIntegerType size) ;
		startPos: (self copy: aFASTFortranIntegerType startPos) ;
		endPos: (self copy: aFASTFortranIntegerType endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranIntrinsicStatement: aFASTFortranIntrinsicStatement [
	<generated>
	^FASTFortranIntrinsicStatement new
		allTagAssociations: (self copy: aFASTFortranIntrinsicStatement allTagAssociations) ;
		variables: (self copy: aFASTFortranIntrinsicStatement variables) ;
		label: (self copy: aFASTFortranIntrinsicStatement label) ;
		startPos: (self copy: aFASTFortranIntrinsicStatement startPos) ;
		endPos: (self copy: aFASTFortranIntrinsicStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranLabelReference: aFASTFortranLabelReference [
	<generated>
	^FASTFortranLabelReference new
		allTagAssociations: (self copy: aFASTFortranLabelReference allTagAssociations) ;
		label: (self copy: aFASTFortranLabelReference label) ;
		startPos: (self copy: aFASTFortranLabelReference startPos) ;
		endPos: (self copy: aFASTFortranLabelReference endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranLogicalType: aFASTFortranLogicalType [
	<generated>
	^FASTFortranLogicalType new
		allTagAssociations: (self copy: aFASTFortranLogicalType allTagAssociations) ;
		size: (self copy: aFASTFortranLogicalType size) ;
		startPos: (self copy: aFASTFortranLogicalType startPos) ;
		endPos: (self copy: aFASTFortranLogicalType endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranLoopControlExpression: aFASTFortranLoopControlExpression [
	<generated>
	^FASTFortranLoopControlExpression new
		increment: (self copy: aFASTFortranLoopControlExpression increment) ;
		allTagAssociations: (self copy: aFASTFortranLoopControlExpression allTagAssociations) ;
		limit: (self copy: aFASTFortranLoopControlExpression limit) ;
		init: (self copy: aFASTFortranLoopControlExpression init) ;
		startPos: (self copy: aFASTFortranLoopControlExpression startPos) ;
		endPos: (self copy: aFASTFortranLoopControlExpression endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranMapStatement: aFASTFortranMapStatement [
	<generated>
	^FASTFortranMapStatement new
		allTagAssociations: (self copy: aFASTFortranMapStatement allTagAssociations) ;
		label: (self copy: aFASTFortranMapStatement label) ;
		startPos: (self copy: aFASTFortranMapStatement startPos) ;
		endPos: (self copy: aFASTFortranMapStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranNameListStatement: aFASTFortranNameListStatement [
	<generated>
	^FASTFortranNameListStatement new
		allTagAssociations: (self copy: aFASTFortranNameListStatement allTagAssociations) ;
		label: (self copy: aFASTFortranNameListStatement label) ;
		startPos: (self copy: aFASTFortranNameListStatement startPos) ;
		endPos: (self copy: aFASTFortranNameListStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranNumericalConstant: aFASTFortranNumericalConstant [
	<generated>
	^FASTFortranNumericalConstant new
		allTagAssociations: (self copy: aFASTFortranNumericalConstant allTagAssociations) ;
		primitiveValue: (self copy: aFASTFortranNumericalConstant primitiveValue) ;
		endPos: (self copy: aFASTFortranNumericalConstant endPos) ;
		startPos: (self copy: aFASTFortranNumericalConstant startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranOpenStatement: aFASTFortranOpenStatement [
	<generated>
	^FASTFortranOpenStatement new
		allTagAssociations: (self copy: aFASTFortranOpenStatement allTagAssociations) ;
		ioParameters: (self copy: aFASTFortranOpenStatement ioParameters) ;
		label: (self copy: aFASTFortranOpenStatement label) ;
		startPos: (self copy: aFASTFortranOpenStatement startPos) ;
		endPos: (self copy: aFASTFortranOpenStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranOptionsStatement: aFASTFortranOptionsStatement [
	<generated>
	^FASTFortranOptionsStatement new
		allTagAssociations: (self copy: aFASTFortranOptionsStatement allTagAssociations) ;
		label: (self copy: aFASTFortranOptionsStatement label) ;
		startPos: (self copy: aFASTFortranOptionsStatement startPos) ;
		endPos: (self copy: aFASTFortranOptionsStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranParameterStatement: aFASTFortranParameterStatement [
	<generated>
	^FASTFortranParameterStatement new
		allTagAssociations: (self copy: aFASTFortranParameterStatement allTagAssociations) ;
		label: (self copy: aFASTFortranParameterStatement label) ;
		declarators: (self copy: aFASTFortranParameterStatement declarators) ;
		startPos: (self copy: aFASTFortranParameterStatement startPos) ;
		endPos: (self copy: aFASTFortranParameterStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranPauseStatement: aFASTFortranPauseStatement [
	<generated>
	^FASTFortranPauseStatement new
		allTagAssociations: (self copy: aFASTFortranPauseStatement allTagAssociations) ;
		label: (self copy: aFASTFortranPauseStatement label) ;
		displayArgument: (self copy: aFASTFortranPauseStatement displayArgument) ;
		startPos: (self copy: aFASTFortranPauseStatement startPos) ;
		endPos: (self copy: aFASTFortranPauseStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranPragmaStatement: aFASTFortranPragmaStatement [
	<generated>
	^FASTFortranPragmaStatement new
		allTagAssociations: (self copy: aFASTFortranPragmaStatement allTagAssociations) ;
		label: (self copy: aFASTFortranPragmaStatement label) ;
		startPos: (self copy: aFASTFortranPragmaStatement startPos) ;
		endPos: (self copy: aFASTFortranPragmaStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranPrintStatement: aFASTFortranPrintStatement [
	<generated>
	^FASTFortranPrintStatement new
		allTagAssociations: (self copy: aFASTFortranPrintStatement allTagAssociations) ;
		format: (self copy: aFASTFortranPrintStatement format) ;
		arguments: (self copy: aFASTFortranPrintStatement arguments) ;
		label: (self copy: aFASTFortranPrintStatement label) ;
		startPos: (self copy: aFASTFortranPrintStatement startPos) ;
		endPos: (self copy: aFASTFortranPrintStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranProcedure: aFASTFortranProcedure [
	<generated>
	^FASTFortranProcedure new
		declarations: (self copy: aFASTFortranProcedure declarations) ;
		comments: (self copy: aFASTFortranProcedure comments) ;
		allTagAssociations: (self copy: aFASTFortranProcedure allTagAssociations) ;
		name: (self copy: aFASTFortranProcedure name) ;
		parameters: (self copy: aFASTFortranProcedure parameters) ;
		statementBlock: (self copy: aFASTFortranProcedure statementBlock) ;
		startPos: (self copy: aFASTFortranProcedure startPos) ;
		endPos: (self copy: aFASTFortranProcedure endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranProgramFile: aFASTFortranProgramFile [
	<generated>
	^FASTFortranProgramFile new
		declarations: (self copy: aFASTFortranProgramFile declarations) ;
		comments: (self copy: aFASTFortranProgramFile comments) ;
		allTagAssociations: (self copy: aFASTFortranProgramFile allTagAssociations) ;
		programUnit: (self copy: aFASTFortranProgramFile programUnit) ;
		startPos: (self copy: aFASTFortranProgramFile startPos) ;
		endPos: (self copy: aFASTFortranProgramFile endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranProgramMain: aFASTFortranProgramMain [
	<generated>
	^FASTFortranProgramMain new
		declarations: (self copy: aFASTFortranProgramMain declarations) ;
		comments: (self copy: aFASTFortranProgramMain comments) ;
		allTagAssociations: (self copy: aFASTFortranProgramMain allTagAssociations) ;
		name: (self copy: aFASTFortranProgramMain name) ;
		parameters: (self copy: aFASTFortranProgramMain parameters) ;
		statementBlock: (self copy: aFASTFortranProgramMain statementBlock) ;
		startPos: (self copy: aFASTFortranProgramMain startPos) ;
		endPos: (self copy: aFASTFortranProgramMain endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [
	<generated>
	^FASTFortranProgramUnit new
		declarations: (self copy: aFASTFortranProgramUnit declarations) ;
		comments: (self copy: aFASTFortranProgramUnit comments) ;
		allTagAssociations: (self copy: aFASTFortranProgramUnit allTagAssociations) ;
		name: (self copy: aFASTFortranProgramUnit name) ;
		parameters: (self copy: aFASTFortranProgramUnit parameters) ;
		statementBlock: (self copy: aFASTFortranProgramUnit statementBlock) ;
		startPos: (self copy: aFASTFortranProgramUnit startPos) ;
		endPos: (self copy: aFASTFortranProgramUnit endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranReadStatement: aFASTFortranReadStatement [
	<generated>
	^FASTFortranReadStatement new
		allTagAssociations: (self copy: aFASTFortranReadStatement allTagAssociations) ;
		ioParameters: (self copy: aFASTFortranReadStatement ioParameters) ;
		arguments: (self copy: aFASTFortranReadStatement arguments) ;
		label: (self copy: aFASTFortranReadStatement label) ;
		startPos: (self copy: aFASTFortranReadStatement startPos) ;
		endPos: (self copy: aFASTFortranReadStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranRealLiteral: aFASTFortranRealLiteral [
	<generated>
	^FASTFortranRealLiteral new
		allTagAssociations: (self copy: aFASTFortranRealLiteral allTagAssociations) ;
		primitiveValue: (self copy: aFASTFortranRealLiteral primitiveValue) ;
		endPos: (self copy: aFASTFortranRealLiteral endPos) ;
		startPos: (self copy: aFASTFortranRealLiteral startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranRealType: aFASTFortranRealType [
	<generated>
	^FASTFortranRealType new
		allTagAssociations: (self copy: aFASTFortranRealType allTagAssociations) ;
		size: (self copy: aFASTFortranRealType size) ;
		startPos: (self copy: aFASTFortranRealType startPos) ;
		endPos: (self copy: aFASTFortranRealType endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranReturnStatement: aFASTFortranReturnStatement [
	<generated>
	^FASTFortranReturnStatement new
		allTagAssociations: (self copy: aFASTFortranReturnStatement allTagAssociations) ;
		label: (self copy: aFASTFortranReturnStatement label) ;
		expression: (self copy: aFASTFortranReturnStatement expression) ;
		alternateReturnLabel: (self copy: aFASTFortranReturnStatement alternateReturnLabel) ;
		startPos: (self copy: aFASTFortranReturnStatement startPos) ;
		endPos: (self copy: aFASTFortranReturnStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranRewindStatement: aFASTFortranRewindStatement [
	<generated>
	^FASTFortranRewindStatement new
		allTagAssociations: (self copy: aFASTFortranRewindStatement allTagAssociations) ;
		ioParameters: (self copy: aFASTFortranRewindStatement ioParameters) ;
		label: (self copy: aFASTFortranRewindStatement label) ;
		startPos: (self copy: aFASTFortranRewindStatement startPos) ;
		endPos: (self copy: aFASTFortranRewindStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranSaveStatement: aFASTFortranSaveStatement [
	<generated>
	^FASTFortranSaveStatement new
		allTagAssociations: (self copy: aFASTFortranSaveStatement allTagAssociations) ;
		label: (self copy: aFASTFortranSaveStatement label) ;
		startPos: (self copy: aFASTFortranSaveStatement startPos) ;
		endPos: (self copy: aFASTFortranSaveStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [
	<generated>
	^FASTFortranScalarVariable new
		allTagAssociations: (self copy: aFASTFortranScalarVariable allTagAssociations) ;
		name: (self copy: aFASTFortranScalarVariable name) ;
		endPos: (self copy: aFASTFortranScalarVariable endPos) ;
		startPos: (self copy: aFASTFortranScalarVariable startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranSegment: aFASTFortranSegment [
	<generated>
	^FASTFortranSegment new
		allTagAssociations: (self copy: aFASTFortranSegment allTagAssociations) ;
		size: (self copy: aFASTFortranSegment size) ;
		name: (self copy: aFASTFortranSegment name) ;
		statements: (self copy: aFASTFortranSegment statements) ;
		startPos: (self copy: aFASTFortranSegment startPos) ;
		endPos: (self copy: aFASTFortranSegment endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [
	<generated>
	^FASTFortranStatementBlock new
		comments: (self copy: aFASTFortranStatementBlock comments) ;
		allTagAssociations: (self copy: aFASTFortranStatementBlock allTagAssociations) ;
		statements: (self copy: aFASTFortranStatementBlock statements) ;
		startPos: (self copy: aFASTFortranStatementBlock startPos) ;
		endPos: (self copy: aFASTFortranStatementBlock endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranStaticStatement: aFASTFortranStaticStatement [
	<generated>
	^FASTFortranStaticStatement new
		allTagAssociations: (self copy: aFASTFortranStaticStatement allTagAssociations) ;
		label: (self copy: aFASTFortranStaticStatement label) ;
		startPos: (self copy: aFASTFortranStaticStatement startPos) ;
		endPos: (self copy: aFASTFortranStaticStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranStopStatement: aFASTFortranStopStatement [
	<generated>
	^FASTFortranStopStatement new
		allTagAssociations: (self copy: aFASTFortranStopStatement allTagAssociations) ;
		label: (self copy: aFASTFortranStopStatement label) ;
		displayArgument: (self copy: aFASTFortranStopStatement displayArgument) ;
		startPos: (self copy: aFASTFortranStopStatement startPos) ;
		endPos: (self copy: aFASTFortranStopStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranSubprogram: aFASTFortranSubprogram [
	<generated>
	^FASTFortranSubprogram new
		declarations: (self copy: aFASTFortranSubprogram declarations) ;
		comments: (self copy: aFASTFortranSubprogram comments) ;
		allTagAssociations: (self copy: aFASTFortranSubprogram allTagAssociations) ;
		name: (self copy: aFASTFortranSubprogram name) ;
		parameters: (self copy: aFASTFortranSubprogram parameters) ;
		statementBlock: (self copy: aFASTFortranSubprogram statementBlock) ;
		startPos: (self copy: aFASTFortranSubprogram startPos) ;
		endPos: (self copy: aFASTFortranSubprogram endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranSubroutine: aFASTFortranSubroutine [
	<generated>
	^FASTFortranSubroutine new
		declarations: (self copy: aFASTFortranSubroutine declarations) ;
		comments: (self copy: aFASTFortranSubroutine comments) ;
		allTagAssociations: (self copy: aFASTFortranSubroutine allTagAssociations) ;
		name: (self copy: aFASTFortranSubroutine name) ;
		parameters: (self copy: aFASTFortranSubroutine parameters) ;
		statementBlock: (self copy: aFASTFortranSubroutine statementBlock) ;
		startPos: (self copy: aFASTFortranSubroutine startPos) ;
		endPos: (self copy: aFASTFortranSubroutine endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranSubstring: aFASTFortranSubstring [
	<generated>
	^FASTFortranSubstring new
		allTagAssociations: (self copy: aFASTFortranSubstring allTagAssociations) ;
		endPos: (self copy: aFASTFortranSubstring endPos) ;
		startPos: (self copy: aFASTFortranSubstring startPos) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTFortranTDeclaration: aFASTFortranTDeclaration [
	<generated>
	^FASTFortranTDeclaration new
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTFortranTEntityCreator: aFASTFortranTEntityCreator [
	<generated>
	^FASTFortranTEntityCreator new
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTFortranTEntryArgument: aFASTFortranTEntryArgument [
	<generated>
	^FASTFortranTEntryArgument new
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTFortranTFormat: aFASTFortranTFormat [
	<generated>
	^FASTFortranTFormat new
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTFortranTIOParameter: aFASTFortranTIOParameter [
	<generated>
	^FASTFortranTIOParameter new
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTFortranTVariableGroup: aFASTFortranTVariableGroup [
	<generated>
	^FASTFortranTVariableGroup new
		variables: (self copy: aFASTFortranTVariableGroup variables) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTFortranTWithDeclarations: aFASTFortranTWithDeclarations [
	<generated>
	^FASTFortranTWithDeclarations new
		declarations: (self copy: aFASTFortranTWithDeclarations declarations) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTFortranTWithDeclarators: aFASTFortranTWithDeclarators [
	<generated>
	^FASTFortranTWithDeclarators new
		declarators: (self copy: aFASTFortranTWithDeclarators declarators) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTFortranTWithFormat: aFASTFortranTWithFormat [
	<generated>
	^FASTFortranTWithFormat new
		format: (self copy: aFASTFortranTWithFormat format) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTFortranTWithLabelReferences: aFASTFortranTWithLabelReferences [
	<generated>
	^FASTFortranTWithLabelReferences new
		labelReferences: (self copy: aFASTFortranTWithLabelReferences labelReferences) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTFortranTWithLoopControl: aFASTFortranTWithLoopControl [
	<generated>
	^FASTFortranTWithLoopControl new
		loopControl: (self copy: aFASTFortranTWithLoopControl loopControl) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTFortranTWithVariableGroups: aFASTFortranTWithVariableGroups [
	<generated>
	^FASTFortranTWithVariableGroups new
		variableGroups: (self copy: aFASTFortranTWithVariableGroups variableGroups) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranType: aFASTFortranType [
	<generated>
	^FASTFortranType new
		allTagAssociations: (self copy: aFASTFortranType allTagAssociations) ;
		size: (self copy: aFASTFortranType size) ;
		startPos: (self copy: aFASTFortranType startPos) ;
		endPos: (self copy: aFASTFortranType endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranUnaryExpression: aFASTFortranUnaryExpression [
	<generated>
	^FASTFortranUnaryExpression new
		allTagAssociations: (self copy: aFASTFortranUnaryExpression allTagAssociations) ;
		expression: (self copy: aFASTFortranUnaryExpression expression) ;
		endPos: (self copy: aFASTFortranUnaryExpression endPos) ;
		startPos: (self copy: aFASTFortranUnaryExpression startPos) ;
		operator: (self copy: aFASTFortranUnaryExpression operator) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranUnionStatement: aFASTFortranUnionStatement [
	<generated>
	^FASTFortranUnionStatement new
		allTagAssociations: (self copy: aFASTFortranUnionStatement allTagAssociations) ;
		label: (self copy: aFASTFortranUnionStatement label) ;
		startPos: (self copy: aFASTFortranUnionStatement startPos) ;
		endPos: (self copy: aFASTFortranUnionStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranVariable: aFASTFortranVariable [
	<generated>
	^FASTFortranVariable new
		allTagAssociations: (self copy: aFASTFortranVariable allTagAssociations) ;
		name: (self copy: aFASTFortranVariable name) ;
		endPos: (self copy: aFASTFortranVariable endPos) ;
		startPos: (self copy: aFASTFortranVariable startPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranVariableDeclarationStatement: aFASTFortranVariableDeclarationStatement [
	<generated>
	^FASTFortranVariableDeclarationStatement new
		allTagAssociations: (self copy: aFASTFortranVariableDeclarationStatement allTagAssociations) ;
		type: (self copy: aFASTFortranVariableDeclarationStatement type) ;
		label: (self copy: aFASTFortranVariableDeclarationStatement label) ;
		declarators: (self copy: aFASTFortranVariableDeclarationStatement declarators) ;
		startPos: (self copy: aFASTFortranVariableDeclarationStatement startPos) ;
		endPos: (self copy: aFASTFortranVariableDeclarationStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranVariableDeclarator: aFASTFortranVariableDeclarator [
	<generated>
	^FASTFortranVariableDeclarator new
		allTagAssociations: (self copy: aFASTFortranVariableDeclarator allTagAssociations) ;
		dimensions: (self copy: aFASTFortranVariableDeclarator dimensions) ;
		name: (self copy: aFASTFortranVariableDeclarator name) ;
		expression: (self copy: aFASTFortranVariableDeclarator expression) ;
		startPos: (self copy: aFASTFortranVariableDeclarator startPos) ;
		endPos: (self copy: aFASTFortranVariableDeclarator endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranVirtualStatement: aFASTFortranVirtualStatement [
	<generated>
	^FASTFortranVirtualStatement new
		allTagAssociations: (self copy: aFASTFortranVirtualStatement allTagAssociations) ;
		label: (self copy: aFASTFortranVirtualStatement label) ;
		startPos: (self copy: aFASTFortranVirtualStatement startPos) ;
		endPos: (self copy: aFASTFortranVirtualStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranVolatileStatement: aFASTFortranVolatileStatement [
	<generated>
	^FASTFortranVolatileStatement new
		allTagAssociations: (self copy: aFASTFortranVolatileStatement allTagAssociations) ;
		label: (self copy: aFASTFortranVolatileStatement label) ;
		startPos: (self copy: aFASTFortranVolatileStatement startPos) ;
		endPos: (self copy: aFASTFortranVolatileStatement endPos) ;
		yourself

]

{ #category : 'visiting' }
FASTFortranCopyVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [
	<generated>
	^FASTFortranWriteStatement new
		allTagAssociations: (self copy: aFASTFortranWriteStatement allTagAssociations) ;
		ioParameters: (self copy: aFASTFortranWriteStatement ioParameters) ;
		arguments: (self copy: aFASTFortranWriteStatement arguments) ;
		label: (self copy: aFASTFortranWriteStatement label) ;
		startPos: (self copy: aFASTFortranWriteStatement startPos) ;
		endPos: (self copy: aFASTFortranWriteStatement endPos) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTFortranCopyVisitor >> visitFASTTVariableEntity: aFASTTVariableEntity [
	<generated>
	^FASTTVariableEntity new
		name: (self copy: aFASTTVariableEntity name) ;
		startPos: (self copy: aFASTTVariableEntity startPos) ;
		endPos: (self copy: aFASTTVariableEntity endPos) ;
		yourself

]
