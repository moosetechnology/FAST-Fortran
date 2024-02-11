Class {
	#name : #FASTFortranCopyVisitor,
	#superclass : #FASTFortranVisitor,
	#category : #'FAST-Fortran-Analyses-SSA'
}

{ #category : #copying }
FASTFortranCopyVisitor >> copy: aNode [

	aNode ifNil: [ ^nil ].
	aNode isCollection ifFalse: [ ^aNode accept: self ].
	^aNode collect: [ :each | self copy: each ]
]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractExpression: aFASTFortranAbstractExpression [
	<generated>
	^(aFASTFortranAbstractExpression copy)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractLiteral: aFASTFortranAbstractLiteral [
	<generated>
	^(self visitFASTFortranAbstractExpression: aFASTFortranAbstractLiteral)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranAbstractStatement: aFASTFortranAbstractStatement [
	<generated>
	^(aFASTFortranAbstractStatement copy)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranAcceptStatement: aFASTFortranAcceptStatement [
	<generated>
	^(aFASTFortranAcceptStatement copy)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranAmpersand: aFASTFortranAmpersand [
	<generated>
	^(self visitFASTFortranAbstractLiteral: aFASTFortranAmpersand)
		yourself

]

{ #category : #visiting }
FASTFortranCopyVisitor >> visitFASTFortranArrayRange: aFASTFortranArrayRange [
	<generated>
	^(aFASTFortranArrayRange copy)
		upperBound: (self copy: aFASTFortranArrayRange upperBound)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [
	<generated>
	^(self visitFASTFortranVariable: aFASTFortranArrayVariable)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranAssignmentExpression: aFASTFortranAssignmentExpression [
	<generated>
	^(self visitFASTFortranAbstractExpression: aFASTFortranAssignmentExpression)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranAssignmentStatement)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranAsterisk: aFASTFortranAsterisk [
	<generated>
	^(aFASTFortranAsterisk copy)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranAutomaticStatement: aFASTFortranAutomaticStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranAutomaticStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranBackspaceStatement: aFASTFortranBackspaceStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranBackspaceStatement)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [
	<generated>
	^(self visitFASTFortranAbstractExpression: aFASTFortranBinaryExpression)
		yourself

]

{ #category : #'visiting - programUnits' }
FASTFortranCopyVisitor >> visitFASTFortranBlockData: aFASTFortranBlockData [
	<generated>
	^(self visitFASTFortranSubprogram: aFASTFortranBlockData)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranBooleanLiteral: aFASTFortranBooleanLiteral [
	<generated>
	^(self visitFASTFortranAbstractLiteral: aFASTFortranBooleanLiteral)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranByteType: aFASTFortranByteType [
	<generated>
	^(self visitFASTFortranType: aFASTFortranByteType)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranCallStatement)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranCharacterLiteral: aFASTFortranCharacterLiteral [
	<generated>
	^(self visitFASTFortranAbstractLiteral: aFASTFortranCharacterLiteral)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranCharacterType: aFASTFortranCharacterType [
	<generated>
	^(self visitFASTFortranType: aFASTFortranCharacterType)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranCloseStatement: aFASTFortranCloseStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranCloseStatement)
		yourself

]

{ #category : #visiting }
FASTFortranCopyVisitor >> visitFASTFortranComment: aFASTFortranComment [
	<generated>
	^(aFASTFortranComment copy)
		yourself

]

{ #category : #visiting }
FASTFortranCopyVisitor >> visitFASTFortranCommonGroup: aFASTFortranCommonGroup [
	<generated>
	^(aFASTFortranCommonGroup copy)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranCommonStatement: aFASTFortranCommonStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranCommonStatement)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranComplexLiteral: aFASTFortranComplexLiteral [
	<generated>
	^(self visitFASTFortranAbstractLiteral: aFASTFortranComplexLiteral)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranComplexType: aFASTFortranComplexType [
	<generated>
	^(self visitFASTFortranType: aFASTFortranComplexType)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranContinueStatement: aFASTFortranContinueStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranContinueStatement)
		yourself

]

{ #category : #visiting }
FASTFortranCopyVisitor >> visitFASTFortranDataGroup: aFASTFortranDataGroup [
	<generated>
	^(aFASTFortranDataGroup copy)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranDataStatement: aFASTFortranDataStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranDataStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranDecodeStatement: aFASTFortranDecodeStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranDecodeStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranDimensionStatement: aFASTFortranDimensionStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranDimensionStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranDoStatement)
		statementBlock: (self copy: aFASTFortranDoStatement statementBlock)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranDoWhileStatement)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranDoubleComplexLiteral: aFASTFortranDoubleComplexLiteral [
	<generated>
	^(self visitFASTFortranAbstractLiteral: aFASTFortranDoubleComplexLiteral)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranDoubleComplexType: aFASTFortranDoubleComplexType [
	<generated>
	^(self visitFASTFortranType: aFASTFortranDoubleComplexType)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranDoublePrecisionLiteral: aFASTFortranDoublePrecisionLiteral [
	<generated>
	^(self visitFASTFortranAbstractLiteral: aFASTFortranDoublePrecisionLiteral)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranDoublePrecisionType: aFASTFortranDoublePrecisionType [
	<generated>
	^(self visitFASTFortranType: aFASTFortranDoublePrecisionType)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranElseStatement: aFASTFortranElseStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranElseStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranEncodeStatement: aFASTFortranEncodeStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranEncodeStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranEndFileStatement: aFASTFortranEndFileStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranEndFileStatement)
		yourself

]

{ #category : #visiting }
FASTFortranCopyVisitor >> visitFASTFortranEntity: aFASTFortranEntity [
	<generated>
	^(aFASTFortranEntity copy)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranEntryStatement: aFASTFortranEntryStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranEntryStatement)
		yourself

]

{ #category : #visiting }
FASTFortranCopyVisitor >> visitFASTFortranEquivalenceGroup: aFASTFortranEquivalenceGroup [
	<generated>
	^(aFASTFortranEquivalenceGroup copy)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranEquivalenceStatement: aFASTFortranEquivalenceStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranEquivalenceStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranExitStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranExternalStatement: aFASTFortranExternalStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranExternalStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranFormatStatement: aFASTFortranFormatStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranFormatStatement)
		yourself

]

{ #category : #'visiting - programUnits' }
FASTFortranCopyVisitor >> visitFASTFortranFunction: aFASTFortranFunction [
	<generated>
	^(self visitFASTFortranProcedure: aFASTFortranFunction)
		returnType: (self copy: aFASTFortranFunction returnType)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranFunctionCall: aFASTFortranFunctionCall [
	<generated>
	^(self visitFASTFortranAbstractExpression: aFASTFortranFunctionCall)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranFunctionStatement: aFASTFortranFunctionStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranFunctionStatement)
		expression: (self copy: aFASTFortranFunctionStatement expression)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranGoToAssignedStatement: aFASTFortranGoToAssignedStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranGoToAssignedStatement)
		selectorExpression: (self copy: aFASTFortranGoToAssignedStatement selectorExpression)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranGoToComputedStatement)
		selectorExpression: (self copy: aFASTFortranGoToComputedStatement selectorExpression)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranGoToStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranIfArithmeticStatement)
		greaterLabel: (self copy: aFASTFortranIfArithmeticStatement greaterLabel) ;
		lessLabel: (self copy: aFASTFortranIfArithmeticStatement lessLabel) ;
		equalLabel: (self copy: aFASTFortranIfArithmeticStatement equalLabel) ;
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranIfBlockStatement)
		elseStatementBlock: (self copy: aFASTFortranIfBlockStatement elseStatementBlock)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranIfLogicalStatement)
		statement: (self copy: aFASTFortranIfLogicalStatement statement)
		yourself

]

{ #category : #visiting }
FASTFortranCopyVisitor >> visitFASTFortranImplicitRange: aFASTFortranImplicitRange [
	<generated>
	^(aFASTFortranImplicitRange copy)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranImplicitStatement: aFASTFortranImplicitStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranImplicitStatement)
		yourself

]

{ #category : #visiting }
FASTFortranCopyVisitor >> visitFASTFortranImplicitTypingRule: aFASTFortranImplicitTypingRule [
	<generated>
	^(aFASTFortranImplicitTypingRule copy)
		type: (self copy: aFASTFortranImplicitTypingRule type)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranImpliedDo: aFASTFortranImpliedDo [

	^(aFASTFortranImpliedDo copy)
		variables: (self copy: aFASTFortranImpliedDo variables) ;
		loopControl: (self copy: aFASTFortranImpliedDo loopControl) ;
		yourself
]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranImpliedDoExpression: aFASTFortranImpliedDoExpression [
	<generated>
	^(aFASTFortranImpliedDoExpression copy)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranIncludeStatement: aFASTFortranIncludeStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranIncludeStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranInquireStatement: aFASTFortranInquireStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranInquireStatement)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranIntegerLiteral: aFASTFortranIntegerLiteral [
	<generated>
	^(self visitFASTFortranAbstractLiteral: aFASTFortranIntegerLiteral)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranIntegerType: aFASTFortranIntegerType [
	<generated>
	^(self visitFASTFortranType: aFASTFortranIntegerType)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranIntrinsicStatement: aFASTFortranIntrinsicStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranIntrinsicStatement)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranLabelReference: aFASTFortranLabelReference [
	<generated>
	^(aFASTFortranLabelReference copy)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranLogicalType: aFASTFortranLogicalType [
	<generated>
	^(self visitFASTFortranType: aFASTFortranLogicalType)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranLoopControlExpression: aFASTFortranLoopControlExpression [
	<generated>
	^(aFASTFortranLoopControlExpression copy)
		init: (self copy: aFASTFortranLoopControlExpression init) ;
		limit: (self copy: aFASTFortranLoopControlExpression limit) ;
		increment: (self copy: aFASTFortranLoopControlExpression increment) ;
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranMapStatement: aFASTFortranMapStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranMapStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranNameListStatement: aFASTFortranNameListStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranNameListStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranOpenStatement: aFASTFortranOpenStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranOpenStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranOptionsStatement: aFASTFortranOptionsStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranOptionsStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranParameterStatement: aFASTFortranParameterStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranParameterStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranPauseStatement: aFASTFortranPauseStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranPauseStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranPragmaStatement: aFASTFortranPragmaStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranPragmaStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranPrintStatement: aFASTFortranPrintStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranPrintStatement)
		yourself

]

{ #category : #'visiting - programUnits' }
FASTFortranCopyVisitor >> visitFASTFortranProcedure: aFASTFortranProcedure [
	<generated>
	^(self visitFASTFortranSubprogram: aFASTFortranProcedure)
		yourself

]

{ #category : #'visiting - programUnits' }
FASTFortranCopyVisitor >> visitFASTFortranProgramFile: aFASTFortranProgramFile [
	<generated>
	^(aFASTFortranProgramFile copy)
		yourself

]

{ #category : #'visiting - programUnits' }
FASTFortranCopyVisitor >> visitFASTFortranProgramMain: aFASTFortranProgramMain [
	<generated>
	^(self visitFASTFortranProgramUnit: aFASTFortranProgramMain)
		yourself

]

{ #category : #'visiting - programUnits' }
FASTFortranCopyVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [
	<generated>
	^(aFASTFortranProgramUnit copy)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranReadStatement: aFASTFortranReadStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranReadStatement)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranRealLiteral: aFASTFortranRealLiteral [
	<generated>
	^(self visitFASTFortranAbstractLiteral: aFASTFortranRealLiteral)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranRealType: aFASTFortranRealType [
	<generated>
	^(self visitFASTFortranType: aFASTFortranRealType)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranReturnStatement: aFASTFortranReturnStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranReturnStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranRewindStatement: aFASTFortranRewindStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranRewindStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranSaveStatement: aFASTFortranSaveStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranSaveStatement)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [
	<generated>
	^(self visitFASTFortranVariable: aFASTFortranScalarVariable)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [
	<generated>
	^(aFASTFortranStatementBlock copy)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranStaticStatement: aFASTFortranStaticStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranStaticStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranStopStatement: aFASTFortranStopStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranStopStatement)
		yourself

]

{ #category : #'visiting - programUnits' }
FASTFortranCopyVisitor >> visitFASTFortranSubprogram: aFASTFortranSubprogram [
	<generated>
	^(self visitFASTFortranProgramUnit: aFASTFortranSubprogram)
		yourself

]

{ #category : #'visiting - programUnits' }
FASTFortranCopyVisitor >> visitFASTFortranSubroutine: aFASTFortranSubroutine [
	<generated>
	^(self visitFASTFortranProcedure: aFASTFortranSubroutine)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranSubstring: aFASTFortranSubstring [
	<generated>
	^(self visitFASTFortranAbstractExpression: aFASTFortranSubstring)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranType: aFASTFortranType [
	<generated>
	^(aFASTFortranType copy)
		size: (self copy: aFASTFortranType size)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranUnaryExpression: aFASTFortranUnaryExpression [
	<generated>
	^(self visitFASTFortranAbstractExpression: aFASTFortranUnaryExpression)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranUnionStatement: aFASTFortranUnionStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranUnionStatement)
		yourself

]

{ #category : #'visiting - expressions' }
FASTFortranCopyVisitor >> visitFASTFortranVariable: aFASTFortranVariable [
	<generated>
	^(self visitFASTFortranAbstractExpression: aFASTFortranVariable)
		parentVariableGroup: (self copy: aFASTFortranVariable parentVariableGroup)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranVariableDeclarationStatement: aFASTFortranVariableDeclarationStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranVariableDeclarationStatement)
		type: (self copy: aFASTFortranVariableDeclarationStatement type)
		yourself

]

{ #category : #visiting }
FASTFortranCopyVisitor >> visitFASTFortranVariableDeclarator: aFASTFortranVariableDeclarator [
	<generated>
	^(aFASTFortranVariableDeclarator copy)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranVirtualStatement: aFASTFortranVirtualStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranVirtualStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranVolatileStatement: aFASTFortranVolatileStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranVolatileStatement)
		yourself

]

{ #category : #'visiting - statements' }
FASTFortranCopyVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [
	<generated>
	^(self visitFASTFortranAbstractStatement: aFASTFortranWriteStatement)
		yourself

]
