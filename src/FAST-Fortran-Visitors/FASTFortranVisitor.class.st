"
An abstract visitor on FASTFortran tree
"
Class {
	#name : 'FASTFortranVisitor',
	#superclass : 'FASTCoreVisitor',
	#category : 'FAST-Fortran-Visitors-Visitor',
	#package : 'FAST-Fortran-Visitors',
	#tag : 'Visitor'
}

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranAbstractConditionalStatement: aFASTFortranAbstractConditionalStatement [

	aFASTFortranAbstractConditionalStatement condition accept: self
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranAcceptStatement: aFASTFortranAcceptStatement [

	self visitFASTFortranTStatement: aFASTFortranAcceptStatement
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranAmpersand: aFASTFortranAmpersand [
	<generated>

	self visitFASTFortranTCharacterLiteral: aFASTFortranAmpersand
]

{ #category : 'visiting' }
FASTFortranVisitor >> visitFASTFortranArrayBound: aFASTFortranArrayBound [
	"visiting an expression in a FASTFortranArrayRange"

	^ aFASTFortranArrayBound
		  ifNil: [ nil ]
		  ifNotNil: [ aFASTFortranArrayBound accept: self ]
]

{ #category : 'visiting' }
FASTFortranVisitor >> visitFASTFortranArrayRange: aFASTFortranArrayRange [

	^ {
		  (self visitFASTFortranArrayBound:
			   aFASTFortranArrayRange lowerBound).
		  (self visitFASTFortranArrayBound:
			   aFASTFortranArrayRange upperBound) }
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [
	<generated>

]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranAssignmentExpression: aFASTFortranAssignmentExpression [

	self visitFASTFortranTAssignment: aFASTFortranAssignmentExpression
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement [

	self visitFASTFortranTAssignment: aFASTFortranAssignmentStatement.
	self visitFASTFortranTStatement: aFASTFortranAssignmentStatement
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranAsterisk: aFASTFortranAsterisk [

	self visitFASTFortranTNumericalLiteral: aFASTFortranAsterisk
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranAutomaticStatement: aFASTFortranAutomaticStatement [

	self visitFASTFortranTStatement: aFASTFortranAutomaticStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranBackspaceStatement: aFASTFortranBackspaceStatement [

	self visitFASTFortranTWithIOParameters: aFASTFortranBackspaceStatement.
	self visitFASTFortranTStatement: aFASTFortranBackspaceStatement
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [

	self visitFASTFortranTExpression: aFASTFortranBinaryExpression.
	self visitFASTFortranTFortranBinaryExpression:
		aFASTFortranBinaryExpression.
	aFASTFortranBinaryExpression leftOperand accept: self.
	aFASTFortranBinaryExpression rightOperand accept: self
]

{ #category : 'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranBlockData: aFASTFortranBlockData [
	<generated>

]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranBooleanLiteral: aFASTFortranBooleanLiteral [
	<generated>

	self visitFASTFortranTBooleanLiteral: aFASTFortranBooleanLiteral
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranByteType: aFASTFortranByteType [
	<generated>

]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [

	self visitFASTFortranTWithArguments: aFASTFortranCallStatement.
	self visitFASTFortranTStatement: aFASTFortranCallStatement
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranCharacterLiteral: aFASTFortranCharacterLiteral [
	<generated>

	self visitFASTFortranTCharacterLiteral: aFASTFortranCharacterLiteral
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranCharacterType: aFASTFortranCharacterType [
	<generated>

]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranCloseStatement: aFASTFortranCloseStatement [

	self visitFASTFortranTWithIOParameters: aFASTFortranCloseStatement.
	self visitFASTFortranTStatement: aFASTFortranCloseStatement
]

{ #category : 'visiting' }
FASTFortranVisitor >> visitFASTFortranComment: aFASTFortranComment [

	self visitFASTFortranTComment: aFASTFortranComment
]

{ #category : 'visiting' }
FASTFortranVisitor >> visitFASTFortranCommonGroup: aFASTFortranCommonGroup [

	aFASTFortranCommonGroup declarators do: [ :var | var accept: self ]
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranCommonStatement: aFASTFortranCommonStatement [

	self visitFASTFortranTStatement: aFASTFortranCommonStatement
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranComplexLiteral: aFASTFortranComplexLiteral [
	<generated>

	self visitFASTFortranTNumericalLiteral: aFASTFortranComplexLiteral
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranComplexType: aFASTFortranComplexType [
	<generated>

]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranContinueStatement: aFASTFortranContinueStatement [

	self visitFASTFortranTStatement: aFASTFortranContinueStatement
]

{ #category : 'visiting' }
FASTFortranVisitor >> visitFASTFortranDataGroup: aFASTFortranDataGroup [

	aFASTFortranDataGroup variables do: [ :var | var accept: self ].
	aFASTFortranDataGroup dataConstants do: [ :const |
		const accept: self ]
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranDataStatement: aFASTFortranDataStatement [

	self visitFASTFortranTStatement: aFASTFortranDataStatement.
	aFASTFortranDataStatement variableGroups do: [ :group |
		group accept: self ]
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranDecodeStatement: aFASTFortranDecodeStatement [

	self visitFASTFortranTWithIOParameters: aFASTFortranDecodeStatement.
	self visitFASTFortranTStatement: aFASTFortranDecodeStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranDimensionStatement: aFASTFortranDimensionStatement [

	aFASTFortranDimensionStatement declarators do: [ :declarator |
		declarator accept: self ].
	self visitFASTFortranTStatement: aFASTFortranDimensionStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [

	self visitFASTFortranTStatement: aFASTFortranDoStatement.
	aFASTFortranDoStatement loopControl accept: self.
	aFASTFortranDoStatement body accept: self
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement [

	self visitFASTFortranAbstractConditionalStatement: aFASTFortranDoWhileStatement.
	self visitFASTFortranTStatement: aFASTFortranDoWhileStatement
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranDoubleComplexLiteral: aFASTFortranDoubleComplexLiteral [
	<generated>

	self visitFASTFortranTNumericalLiteral:
		aFASTFortranDoubleComplexLiteral
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranDoubleComplexType: aFASTFortranDoubleComplexType [
	<generated>

]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranDoublePrecisionLiteral: aFASTFortranDoublePrecisionLiteral [
	<generated>

	self visitFASTFortranTNumericalLiteral:
		aFASTFortranDoublePrecisionLiteral
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranDoublePrecisionType: aFASTFortranDoublePrecisionType [
	<generated>

]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranElseStatement: aFASTFortranElseStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranElseStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranEncodeStatement: aFASTFortranEncodeStatement [

	self visitFASTFortranTWithIOParameters: aFASTFortranEncodeStatement.
	self visitFASTFortranTStatement: aFASTFortranEncodeStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranEndFileStatement: aFASTFortranEndFileStatement [

	self visitFASTFortranTWithIOParameters: aFASTFortranEndFileStatement.
	self visitFASTFortranTStatement: aFASTFortranEndFileStatement
]

{ #category : 'visiting' }
FASTFortranVisitor >> visitFASTFortranEntity: aFASTFortranEntity [

	self visitFASTFortranTEntity: aFASTFortranEntity
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranEntryStatement: aFASTFortranEntryStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranEntryStatement
]

{ #category : 'visiting' }
FASTFortranVisitor >> visitFASTFortranEquivalenceGroup: aFASTFortranEquivalenceGroup [

	aFASTFortranEquivalenceGroup variables do: [ :var | var accept: self ]
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranEquivalenceStatement: aFASTFortranEquivalenceStatement [

	aFASTFortranEquivalenceStatement variableGroups do: [ :group |
		group accept: self ].
	self visitFASTFortranTStatement: aFASTFortranEquivalenceStatement.
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [

	self visitFASTFortranTStatement: aFASTFortranExitStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranExternalStatement: aFASTFortranExternalStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranExternalStatement
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranFieldAccess: aFASTFortranFieldAccess [ 

	aFASTFortranFieldAccess pointer accept: self.
	aFASTFortranFieldAccess field accept: self.
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranFormatStatement: aFASTFortranFormatStatement [
	<generated>

	self visitFASTFortranTFormatIdentifier: aFASTFortranFormatStatement.
	self visitFASTFortranTStatement: aFASTFortranFormatStatement
]

{ #category : 'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranFunction: aFASTFortranFunction [

	self visitFASTFortranProcedure: aFASTFortranFunction.
	"aFASTFortranFunction famix declaredType accept: self."
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranFunctionCall: aFASTFortranFunctionCall [
	<generated>

	self visitFASTFortranTExpression: aFASTFortranFunctionCall.
	self visitFASTFortranTWithArguments: aFASTFortranFunctionCall
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranFunctionStatement: aFASTFortranFunctionStatement [

	self visitFASTFortranTWithParameters: aFASTFortranFunctionStatement.
	aFASTFortranFunctionStatement expression accept: self.
	self visitFASTFortranTStatement: aFASTFortranFunctionStatement.
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranFunctionTypeDeclarationStatement: aFASTFortranFunctionTypeDeclarationStatement [

	aFASTFortranFunctionTypeDeclarationStatement declaredType accept: self.
	self visitFASTFortranTStatement: aFASTFortranFunctionTypeDeclarationStatement.
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranGoToAssignedStatement: aFASTFortranGoToAssignedStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranGoToAssignedStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [

	aFASTFortranGoToComputedStatement selectorExpression accept: self.
	self visitFASTFortranTStatement: aFASTFortranGoToComputedStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranGoToStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranIOParameter: aFASTFortranIOParameter [

	self visitFASTTNamedEntity: aFASTFortranIOParameter
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [

	self visitFASTFortranAbstractConditionalStatement: aFASTFortranIfArithmeticStatement.
	self visitFASTFortranTStatement: aFASTFortranIfArithmeticStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [

	self visitFASTFortranAbstractConditionalStatement: aFASTFortranIfBlockStatement.
	aFASTFortranIfBlockStatement thenStatementBlock accept: self.
	aFASTFortranIfBlockStatement elseStatementBlock ifNotNil: [
		:elseBlock | elseBlock accept: self ].
	self visitFASTFortranTStatement: aFASTFortranIfBlockStatement.
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [

	self visitFASTFortranAbstractConditionalStatement: aFASTFortranIfLogicalStatement.
	aFASTFortranIfLogicalStatement statement accept: self.
	self visitFASTFortranTStatement: aFASTFortranIfLogicalStatement
]

{ #category : 'visiting' }
FASTFortranVisitor >> visitFASTFortranImplicitRange: aFASTFortranImplicitRange [

	aFASTFortranImplicitRange from accept: self.
	aFASTFortranImplicitRange to ifNotNil: [ :to | to accept: self ]
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranImplicitStatement: aFASTFortranImplicitStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranImplicitStatement
]

{ #category : 'visiting' }
FASTFortranVisitor >> visitFASTFortranImplicitTypingRule: aFortranImplicitTypingRule [

	aFortranImplicitTypingRule type accept: self.
	aFortranImplicitTypingRule ranges do: [ :range | range accept: self ]
]

{ #category : 'visiting' }
FASTFortranVisitor >> visitFASTFortranImpliedDoExpression: aFASTFortranImpliedDoExpression [ 

	aFASTFortranImpliedDoExpression variables do: [ :var | var accept: self ].
	aFASTFortranImpliedDoExpression loopControl accept: self
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranIncludeStatement: aFASTFortranIncludeStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranIncludeStatement
]

{ #category : 'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranIncludedFile: aFASTFortranIncludedFile [

	self visitFASTFortranTWithDeclarations: aFASTFortranIncludedFile.
	aFASTFortranIncludedFile statementBlock accept: self
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranInquireStatement: aFASTFortranInquireStatement [

	self visitFASTFortranTWithIOParameters: aFASTFortranInquireStatement.
	self visitFASTFortranTStatement: aFASTFortranInquireStatement
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranIntegerLiteral: aFASTFortranIntegerLiteral [
	<generated>

	self visitFASTFortranTNumericalLiteral: aFASTFortranIntegerLiteral
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranIntegerType: aFASTFortranIntegerType [
	<generated>

]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranIntrinsicStatement: aFASTFortranIntrinsicStatement [

	aFASTFortranIntrinsicStatement variables do: [ :var |
		var accept: self ].
	self visitFASTFortranTStatement: aFASTFortranIntrinsicStatement
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranLabelReference: aFASTFortranLabelReference [

]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranLogicalType: aFASTFortranLogicalType [
	<generated>

]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranLoopControlExpression: aFASTFortranLoopControlExpression [

	self visitFASTFortranTExpression: aFASTFortranLoopControlExpression.
	aFASTFortranLoopControlExpression init accept: self.
	aFASTFortranLoopControlExpression increment ifNotNil: [ :increment |
		increment accept: self ].
	aFASTFortranLoopControlExpression limit accept: self
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranMapStatement: aFASTFortranMapStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranMapStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranNameListStatement: aFASTFortranNameListStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranNameListStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranOpenStatement: aFASTFortranOpenStatement [

	self visitFASTFortranTWithIOParameters: aFASTFortranOpenStatement.
	self visitFASTFortranTStatement: aFASTFortranOpenStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranOptionsStatement: aFASTFortranOptionsStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranOptionsStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranParameterStatement: aFASTFortranParameterStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranParameterStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranPauseStatement: aFASTFortranPauseStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranPauseStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranPragmaStatement: aFASTFortranPragmaStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranPragmaStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranPrintStatement: aFASTFortranPrintStatement [
	<generated>

	self visitFASTFortranTWithArguments: aFASTFortranPrintStatement.
	self visitFASTFortranTStatement: aFASTFortranPrintStatement
]

{ #category : 'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranProcedure: aFASTFortranProcedure [

	self visitFASTFortranTWithParameters: aFASTFortranProcedure.
	self visitFASTFortranSubprogram: aFASTFortranProcedure.
]

{ #category : 'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranProgramFile: aFASTFortranProgramFile [

	self visitFASTFortranTWithComments: aFASTFortranProgramFile.

	aFASTFortranProgramFile programUnits do: [ :pu | pu accept: self ]
]

{ #category : 'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranProgramMain: aFASTFortranProgramMain [

	self visitFASTFortranProgramUnit: aFASTFortranProgramMain
]

{ #category : 'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [

	self visitFASTFortranTNamedBehaviouralEntity: aFASTFortranProgramUnit.
	self visitFASTFortranTWithComments: aFASTFortranProgramUnit
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranReadStatement: aFASTFortranReadStatement [

	self visitFASTFortranTWithIOParameters: aFASTFortranReadStatement.
	self visitFASTFortranTWithArguments: aFASTFortranReadStatement.
	self visitFASTFortranTStatement: aFASTFortranReadStatement
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranRealLiteral: aFASTFortranRealLiteral [
	<generated>

	self visitFASTFortranTNumericalLiteral: aFASTFortranRealLiteral
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranRealType: aFASTFortranRealType [
	<generated>

]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranReturnStatement: aFASTFortranReturnStatement [

	aFASTFortranReturnStatement expression ifNotNil: [ :expr |
		expr accept: self].
	self visitFASTFortranTReturnStatement: aFASTFortranReturnStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranRewindStatement: aFASTFortranRewindStatement [

	self visitFASTFortranTWithIOParameters: aFASTFortranRewindStatement.
	self visitFASTFortranTStatement: aFASTFortranRewindStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranSaveStatement: aFASTFortranSaveStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranSaveStatement
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [
	<generated>

]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [

	self visitFASTFortranTStatement: aFASTFortranStatementBlock.
	self visitFASTFortranTWithComments: aFASTFortranStatementBlock
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranStaticStatement: aFASTFortranStaticStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranStaticStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranStopStatement: aFASTFortranStopStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranStopStatement
]

{ #category : 'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranSubprogram: aFASTFortranSubprogram [

	self visitFASTFortranProgramUnit: aFASTFortranSubprogram
]

{ #category : 'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranSubroutine: aFASTFortranSubroutine [

	self visitFASTFortranProcedure: aFASTFortranSubroutine
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranSubstring: aFASTFortranSubstring [
	<generated>

	self visitFASTFortranTExpression: aFASTFortranSubstring
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTAssignment: aFASTFortranTAssignment [

	aFASTFortranTAssignment variable accept: self.
	aFASTFortranTAssignment expression accept: self
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTBehaviouralEntity: aFASTFortranTBehaviouralEntity [

	self visitFASTFortranTScopableEntity: aFASTFortranTBehaviouralEntity.

	aFASTFortranTBehaviouralEntity statementBlock accept: self
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTBooleanLiteral: aFASTFortranTBooleanLiteral [
	<generated>

	self visitFASTFortranTLiteral: aFASTFortranTBooleanLiteral
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTCharacterLiteral: aFASTFortranTCharacterLiteral [
	<generated>

	self visitFASTFortranTLiteral: aFASTFortranTCharacterLiteral
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTComment: aFASTFortranTComment [
	<generated>

]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTEntity: aFASTFortranTEntity [
	<generated>

	self visitFASTTEntity: aFASTFortranTEntity
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTEntityCreator: aFASTFortranTEntityCreator [
	<generated>

]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTExpression: aFASTFortranTExpression [
	<generated>

	self visitFASTFortranTEntity: aFASTFortranTExpression
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTExpressionStatement: aFASTFortranTExpressionStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranTExpressionStatement
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTFormatIdentifier: aFASTFortranTFormatIdentifier [
	<generated>

]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTFortranBinaryExpression: aFASTFortranTFortranBinaryExpression [
	<generated>

]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTFortranUnaryExpression: aFASTFortranTFortranUnaryExpression [
	<generated>

]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTInvocation: aFASTFortranTInvocation [
	<generated>

	self visitFASTFortranTExpression: aFASTFortranTInvocation.
	self visitFASTFortranTWithArguments: aFASTFortranTInvocation
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTLiteral: aFASTFortranTLiteral [
	<generated>

	self visitFASTFortranTExpression: aFASTFortranTLiteral
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTNamedBehaviouralEntity: aFASTFortranTNamedBehaviouralEntity [
	<generated>

	self visitFASTFortranTBehaviouralEntity: aFASTFortranTNamedBehaviouralEntity.
	self visitFASTFortranTNamedEntity: aFASTFortranTNamedBehaviouralEntity
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTNamedEntity: aFASTFortranTNamedEntity [

]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTNullPointerLiteral: aFASTFortranTNullPointerLiteral [
	<generated>

	self visitFASTFortranTLiteral: aFASTFortranTNullPointerLiteral
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTNumericalLiteral: aFASTFortranTNumericalLiteral [
	<generated>

	self visitFASTFortranTLiteral: aFASTFortranTNumericalLiteral
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTReturnStatement: aFASTFortranTReturnStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranTReturnStatement
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTScopableEntity: aFASTFortranTScopableEntity [

]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTStatement: aFASTFortranTStatement [
	<generated>

	self visitFASTFortranTEntity: aFASTFortranTStatement
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTStatementBlock: aFASTFortranTStatementBlock [

	aFASTFortranTStatementBlock statements do: [ :statement |
		statement accept: self ]
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTStringLiteral: aFASTFortranTStringLiteral [
	<generated>

	self visitFASTFortranTLiteral: aFASTFortranTStringLiteral
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTVariableEntity: aFASTFortranTVariableEntity [
	<generated>

	self visitFASTFortranTNamedEntity: aFASTFortranTVariableEntity
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTVariableExpression: aFASTFortranTVariableExpression [
	<generated>

	self visitFASTFortranTExpression: aFASTFortranTVariableExpression.
	self visitFASTFortranTNamedEntity: aFASTFortranTVariableExpression
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTWithArguments: aFASTFortranTWithArguments [

	aFASTFortranTWithArguments arguments do: [ :arg | arg accept: self ]
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTWithComments: aFASTFortranTWithComments [
	<generated>

]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTWithDeclarations: aFASTFortranTWithDeclarations [

	aFASTFortranTWithDeclarations declarations 
		do: [ :declaration | declaration accept: self ]
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTWithIOParameters: aFASTFortranTWithIOParameters [

	aFASTFortranTWithIOParameters ioParameters do: [ :parameter |
		parameter accept: self ]
]

{ #category : 'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTWithParameters: aFASTFortranTWithParameters [
	"introducing #visitParameter:"

	aFASTFortranTWithParameters parameters do: [ :param |
		self visitParameter: param ]
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranType: aFASTFortranType [

	^ aFASTFortranType size
		  ifNil: [ nil ]
		  ifNotNil: [ :length | length accept: self ]
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranUnaryExpression: aFASTFortranUnaryExpression [
	<generated>

	self visitFASTFortranTExpression: aFASTFortranUnaryExpression.
	self visitFASTFortranTFortranUnaryExpression:
		aFASTFortranUnaryExpression
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranUnionStatement: aFASTFortranUnionStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranUnionStatement
]

{ #category : 'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranVariable: aFASTFortranVariable [
	<generated>

	self visitFASTFortranTExpression: aFASTFortranVariable.
	self visitFASTFortranTVariableEntity: aFASTFortranVariable
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranVariableDeclarationStatement: aFASTFortranVariableDeclarationStatement [

	aFASTFortranVariableDeclarationStatement declaredType accept: self.
	aFASTFortranVariableDeclarationStatement declarators do: [ :decl |
		decl accept: self ].
	self visitFASTFortranTStatement: aFASTFortranVariableDeclarationStatement.
]

{ #category : 'visiting' }
FASTFortranVisitor >> visitFASTFortranVariableDeclarator: aFASTFortranVariableDeclarator [

	^ aFASTFortranVariableDeclarator expression
		  ifNotNil: [ :expression | expression accept: self ]
		  ifNil: [ nil ]
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranVirtualStatement: aFASTFortranVirtualStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranVirtualStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranVolatileStatement: aFASTFortranVolatileStatement [
	<generated>

	self visitFASTFortranTStatement: aFASTFortranVolatileStatement
]

{ #category : 'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [

	self visitFASTFortranTWithIOParameters: aFASTFortranWriteStatement.
	self visitFASTFortranTWithArguments: aFASTFortranWriteStatement.
	self visitFASTFortranTStatement: aFASTFortranWriteStatement.
]

{ #category : 'visiting - programUnits' }
FASTFortranVisitor >> visitParameter: aFASTFortranScalarVariable [
	"no special type for parameters, but worth having its own visit method
	 (see #visitFASTFortranTWithParameters:)"

	aFASTFortranScalarVariable accept: self
]
