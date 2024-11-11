Class {
	#name : 'FASTFortranCopyVisitorTest',
	#superclass : 'FASTFortranAbstractVisitorTest',
	#category : 'FAST-Fortran-Visitors-Tests-Visitor',
	#package : 'FAST-Fortran-Visitors-Tests',
	#tag : 'Visitor'
}

{ #category : 'running' }
FASTFortranCopyVisitorTest >> assertExportCopy: stmt equals: string [
	"raising explicit error to remember which tests have not been reimplemented yet"

	self skip.
	self shouldNotImplement 
]

{ #category : 'running' }
FASTFortranCopyVisitorTest >> newVisitor [

	^FASTFortranCopyVisitor new
]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testArrayDeclaration [
	| stmt |
	stmt := self arrayDeclaration: 'v' dimensions: #( #('1' '10') ).

	self
		assertExportCopy: stmt
		equals: 
'      integer v(1:10)
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testArrayDeclarationImplicitLowerBound [
	| stmt |
	stmt := self arrayDeclaration: 'v' dimensions: #( #('1' '10') ).
	stmt declarators first dimensions first lowerBound: nil.

	self
		assertExportCopy: stmt
		equals: 
'      integer v(10)
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testArrayDeclarationMultipleDimensions [
	| stmt |
	stmt := self arrayDeclaration: 'v' dimensions: #( #('1' '10') #('-10' '-1') ).

	self
		assertExportCopy: stmt
		equals: 
'      integer v(1:10,-10:-1)
'
]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testArrayRange [
	| stmt |
	stmt := FASTFortranArrayVariable new
		name: 'arr' ;
		indices: { FASTFortranArrayRange new
			lowerBound: (self integerLiteral: '1') ;
			upperBound: (self scalarVariable: 'max') } ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'arr(1:max)'
]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testArrayVariable [
	| stmt copy |
	stmt := FASTFortranArrayVariable new
		name: 'arr'.

	copy := visitor copy: stmt.

	self deny: copy equals: stmt.
	self assert: copy name equals: stmt name.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testAssignementFunctionCall [
	"a = fct(5,b)"

	| node copy |
	node := self
		assignementStatement: #a 
		value: (self 
			functionCall: 'fct'
			arguments: {
				self integerLiteral: '5' .
				self scalarVariable: 'b' }).

	copy := visitor copy: node.

	self deny: copy equals: node.

	self deny: copy variable equals: node variable.
	self assert: copy variable name equals: node variable name.

	self deny: copy expression equals: node expression.
	self assert: copy expression name equals: node expression name.

	self assert: copy expression arguments size equals: node expression arguments size.

	self assert: copy expression arguments isNotNil.
	copy expression arguments with: node expression arguments do: [ :copyArg :nodeArg |
		self deny: copyArg equals: nodeArg.
		self assert: copyArg class equals: nodeArg class.
	]

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testAssignementStatementArrayAssigned [
	| stmt |
	stmt := self
		assignementStatement: (self
			array: 'arr' access: { self scalarVariable: 'i' . self integerLiteral: '1'})
		value: #b.

	self
		assertExportCopy: stmt
		equals: 
'      arr(i,1) = b
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testAssignementStatementLiteralValue [
	"aVar = .true."

	| stmt copy |
	stmt := self assignementStatement: #aVar value: (self logicalLiteral: '.true.').

	copy := visitor copy: stmt.

	self deny: copy equals: stmt.

	self deny: copy expression equals: stmt expression.
	self assert: copy expression primitiveValue equals: stmt expression primitiveValue.

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testAssignementStatementVariable [
	"a = b"

	| stmt copy |
	stmt := self assignementStatement: #a value: #b.

	copy := visitor copy: stmt.

	self deny: copy equals: stmt.

	self deny: copy variable equals: stmt variable.
	self assert: copy variable name equals: stmt variable name.

	self deny: copy expression equals: stmt expression.
	self assert: copy expression name equals: stmt expression name.

]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testBinaryExpression [
	"a + 5"

	| node copy |
	node := FASTFortranBinaryExpression new
		leftOperand: (self scalarVariable: 'a') ;
		operator: '+' ;
		rightOperand: (self integerLiteral: '5').

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy class equals: node class.

	self assert: copy operator equals: node operator.

	self deny: copy leftOperand equals: node leftOperand.
	self assert: copy leftOperand class equals: node leftOperand class.
	self assert: copy leftOperand name equals: node leftOperand name.

	self deny: copy rightOperand equals: node rightOperand.
	self assert: copy rightOperand class equals: node rightOperand class.
	self assert: copy rightOperand primitiveValue equals: node rightOperand primitiveValue

]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testBinaryExpressionNe [
	"a .ne. 5"

	| node copy |
	node := FASTFortranBinaryExpression new
		leftOperand: (self scalarVariable: 'a') ;
		operator: '.ne.' ;
		rightOperand: (self integerLiteral: '5').

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy class equals: node class.

	self assert: copy operator equals: node operator.

	self deny: copy leftOperand equals: node leftOperand.
	self assert: copy leftOperand class equals: node leftOperand class.
	self assert: copy leftOperand name equals: node leftOperand name.

	self deny: copy rightOperand equals: node rightOperand.
	self assert: copy rightOperand class equals: node rightOperand class.
	self assert: copy rightOperand primitiveValue equals: node rightOperand primitiveValue

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testBlockStatementWithCommentAndStatement [
	"note: positions are approximate, all we need is that the assignement is after the comment"
	| stmt cmt block |

	stmt := self assignementStatement: #i value: 1.
	stmt startPos: 34.
	stmt endPos: 38.

	cmt := self comment: 'C comment before assignement'.
	cmt startPos: 1.
	cmt endPos: 26.

	block := self statementBlock: { stmt }.
	block addComment: cmt.

	self
		assertExportCopy: block
		equals: 
'C comment before assignement
        i = 1
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testCallStatementExpressionArg [
	"call subrtn(a * 5)"

	| node copy |
	node := self callStatement: 'subrtn' arguments: {
		self binary: '*' left: #a right: 5 }.

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy name equals: node name.

	self assert: copy arguments size equals: node arguments size.

	self deny: copy arguments anyOne equals: node arguments anyOne.
	self assert: copy arguments anyOne class equals: node arguments anyOne class.
	self assert: copy arguments anyOne class equals: node arguments anyOne class.

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testCallStatementNoArgs [
	"call subrtn"

	| node copy |
	node := self callStatement: 'subrtn' arguments: #().

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy name equals: node name.

	self assert: copy arguments size equals: node arguments size.

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testCallStatementWithArgs [
	"call subrtn(a,5)"

	| node copy |
	node := self callStatement: 'subrtn' arguments: {
		self scalarVariable: 'a' .
		self integerLiteral: '5' }.

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy name equals: node name.

	self assert: copy arguments size equals: node arguments size.

	self assert: copy arguments isNotNil.
	copy arguments with: node arguments do: [ :copyArg :nodeArg |
		self deny: copyArg equals: nodeArg.
		self assert: copyArg class equals: nodeArg class.
	]

]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testComment [
	| cmt |
	cmt := self comment: 'C This is a comment'.

	self
		assertExportCopy: cmt
		equals: 
'C This is a comment
'.
]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testComment72Characters [
	| cmt |
	cmt := self comment: 'C 3456789 123456789 123456789 123456789 123456789 123456789 123456789 12'.

	self
		assertExportCopy: cmt
		equals: 
'C 3456789 123456789 123456789 123456789 123456789 123456789 123456789 12
'.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testCommonStatement [

	| stmt |

	stmt := FASTFortranCommonStatement new
		groups: {
			FASTFortranCommonGroup new
				declarators: (self variableDeclarators: #(a b))
			.
			FASTFortranCommonGroup new
				name: 'otherGrp' ;
				declarators: (self variableDeclarators: #(c d))
		} ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'      common a,b /otherGrp/ c,d
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testContinueStatement [
	| stmt |
	stmt := FASTFortranContinueStatement new
		label: '110'.

	self
		assertExportCopy: stmt
		equals: 
'110   continue
'.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testDataStatement [

	| stmt |

	stmt := FASTFortranDataStatement new
		variableGroups: {
			FASTFortranDataGroup new
				variables: (self scalarVariables: #(a b)) ;
				dataConstants: { self characterLiteral: 'un' . self characterLiteral: 'deux' }
			.
			FASTFortranDataGroup new
				variables: (self scalarVariables: #(c)) ;
				dataConstants: { self characterLiteral: 'trois' }
		} ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'      data a,b /''un'',''deux''/ ,c /''trois''/ 
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testDimensionStatement [

	| stmt |

	stmt := FASTFortranDimensionStatement new
		declarators: {
			self arrayDeclarator: 'v' dimensions: #( #('1' '10') ) .
			self arrayDeclarator: 'm' dimensions: #( #('100') #('100') ) .
		}.

	self
		assertExportCopy: stmt
		equals: 
'      dimension v(1:10),m(100,100)
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testDoStatement [
	| stmt |

	stmt := self doStatement: #(i 1 max 1) statements: #().

	self
		assertExportCopy: stmt
		equals: 
'      do i = 1,max,1
      end do
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testDoStatementNoIncrement [
	| stmt |

	stmt := self doStatement: #(i 1 max) statements: #().

	self
		assertExportCopy: stmt
		equals: 
'      do i = 1,max
      end do
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testDoStatementWithLabel [
	| stmt |

	stmt := self doStatement:  #(i 1 max) statements: {
		FASTFortranContinueStatement new label: '110'}.

	stmt labelReferences: { self labelReference: '110' }.

	self
		assertExportCopy: stmt
		equals: 
'      do 110 i = 1,max
110     continue
'
]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testEmptySubroutineNoParameters [
	| sub |
	sub := self subroutine: 'blah'.

	self
		assertExportCopy: sub
		equals: 
'      subroutine blah()
      end
'
]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testEmptySubroutineTwoParameters [
	| sub |
	sub := self subroutine: 'blah'.
	self
		entity: sub
		parameters: #(i j).

	self
		assertExportCopy: sub
		equals: 
'      subroutine blah(i,j)
      end
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testEntryStatement [

	| stmt |
	stmt := FASTFortranEntryStatement new
		name: 'XYZ' ;
		entryArguments: { self scalarVariable: 'ABC' . FASTFortranAsterisk new } ;
		yourself.

	self
		assertExportCopy: stmt
		equals:
'      entry XYZ(ABC,*)
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testEquivalenceStatement [

	| stmt |

	stmt := FASTFortranEquivalenceStatement new
		variableGroups: {
			FASTFortranEquivalenceGroup new
				variables: {
					self scalarVariable: #a .
					self arrayVariable: #b indice: '1'
				}
			.
			FASTFortranEquivalenceGroup new
				variables: (self scalarVariables: #(c d e))
		} ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'      equivalence (a,b(1)), (c,d,e)
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testExitStatement [
	| stmt |
	stmt := self exitStatement: nil.

	self
		assertExportCopy: stmt
		equals: 
'      exit
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testExternalStatement [
	| stmt |
	stmt := self externalStatement: 'aVar'.

	self
		assertExportCopy: stmt
		equals: 
'      external aVar
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testFormatStatement [
	| stmt |
	stmt := FASTFortranFormatStatement new
		formatDescription: '(/8x)' ;
		label: '110' ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'110   format (/8x)
'.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testFunctionNoParameterNoStatement [
	| node copy |
	node := self functionDeclaration: 'BLAH'.

	copy := visitor copy: node.

	self deny: copy equals: node.
	
	self deny: copy returnType equals: node returnType.
	self assert: copy returnType class equals: node returnType class.

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testFunctionNoParameterWithStatement [
	"real function BLAH()
  	return i
   end
	"
	| node stmt copy |

	stmt := self returnStatement: (self scalarVariable: 'i').

	node := self functionDeclaration: 'BLAH'.
	node statementBlock: (self statementBlock: { stmt }).

	copy := visitor copy: node.

	self deny: copy equals: node.

	self deny: copy statementBlock equals: node statementBlock.
	self assert: copy statementBlock statements size equals: node statementBlock statements size.

	self assert:copy statementBlock statements isNotEmpty. 
	copy statementBlock statements with: node statementBlock statements do: [ :copyStmt :nodeStmt |
		self deny: copyStmt equals: nodeStmt.
		self assert: copyStmt class equals: nodeStmt class.
	]

]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testFunctionNoReturnType [
	"function blah()
      end
	"

	| fct copy |
	fct := self functionDeclaration: 'blah'.
	fct returnType: nil.

	copy := visitor copy: fct.

	self deny: copy equals: fct.
	self assert: copy name equals: fct name.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testFunctionStatement [
	| node |
	node := FASTFortranFunctionStatement new.
	node name: 'fct'.
	node arguments: (self scalarVariables: #(x y)).
	node expression: (self binary: '+' left: #x right: 2).

	self
		assertExportCopy: node
		equals: 
'      fct(x,y) = x + 2
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testFunctionWithParameterNoStatement [
	"real function BLAH(i,j)
      end"
	| node copy |
	node := self functionDeclaration: 'BLAH'.
	self entity: node parameters: #(i j).

	copy := visitor copy: node.

	self deny: copy equals: node.

	self deny: copy parameters equals: node parameters.
	self assert: copy parameters size equals: node parameters size.

	copy parameters with: node parameters do: [ :copyParam :nodeParam |
		self deny: copyParam equals: nodeParam.
		self assert: copyParam class equals: nodeParam class.
		self assert: copyParam name equals: nodeParam name	
	]

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testGotoComputedStatement [
	| stmt |
	stmt := FASTFortranGoToComputedStatement new
		labelReferences: { self labelReference: '110' . self labelReference: '120' . self labelReference: '130'} ;
		selectorExpression: (self scalarVariable: 'i') ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'      goto (110,120,130) i
'.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testGotoStatement [
	| stmt |
	stmt := self gotoStatement: '110'.

	self
		assertExportCopy: stmt
		equals: 
'      goto 110
'.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testIfArithmeticStatement [
	| stmt |

	stmt := self ifArithmetic: #a negative: 10 null: 20 positive: 30.

	self
		assertExportCopy: stmt
		equals: 
'      if (a) 10, 20, 30
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testIfBlockStatementEmpty [
	"if (bool) then
      end if"

	| node copy |
	node := self ifBlock: (self scalarVariable: 'bool') then: #() else: nil.

	copy := visitor copy: node.

	self deny: copy equals: node.

	self deny: copy condition equals: node condition.
	self assert: copy condition class equals: node condition class.
	self assert: copy condition name equals: node condition name.

	self deny: copy thenStatementBlock equals: node thenStatementBlock.
	self assert: copy thenStatementBlock class equals: node thenStatementBlock class.
	self assert: copy thenStatementBlock statements size equals: node thenStatementBlock statements size.

	self assert: copy elseStatementBlock equals: node elseStatementBlock.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testIfBlockStatementEmptyBinaryCondition [
	"if (a .gt. 0) then
      end if"

	| node copy |
	node := self
		ifBlock: (self binary: '.gt.' left: #a right: 0)
		then: #(  )
		else: nil.

	copy := visitor copy: node.

	self deny: copy equals: node.

	self deny: copy condition equals: node condition.
	self assert: copy condition class equals: node condition class.
	self assert: copy condition operator equals: node condition operator.

	self deny: copy thenStatementBlock equals: node thenStatementBlock.
	self assert: copy thenStatementBlock statements size equals: node thenStatementBlock statements size.

	self assert: copy elseStatementBlock equals: node elseStatementBlock.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testIfBlockStatementNested [
	"if (bool1) then
        if (bool2) then
        end if
      end if"

	| node copy copyIf nodeIf |
	node := self
		ifBlock: (self scalarVariable: 'bool1')
		then: { self
			ifBlock: (self scalarVariable: 'bool2')
			then: #()
			else: nil }
		else: nil.

	copy := visitor copy: node.

	self deny: copy equals: node.

	copyIf := copy.
	nodeIf := node.

	self deny: copyIf thenStatementBlock equals: nodeIf thenStatementBlock.
	self assert: copyIf thenStatementBlock statements size equals: nodeIf thenStatementBlock statements size.
	self deny: copyIf thenStatementBlock statements anyOne equals: nodeIf thenStatementBlock statements anyOne.
	self assert: copyIf thenStatementBlock statements anyOne class equals: nodeIf thenStatementBlock statements anyOne class.
	self assert: copyIf elseStatementBlock equals: nodeIf elseStatementBlock.

	copyIf := copyIf thenStatementBlock statements anyOne.
	nodeIf := nodeIf thenStatementBlock statements anyOne.

	self deny: copyIf thenStatementBlock equals: nodeIf thenStatementBlock.
	self assert: copyIf thenStatementBlock statements size equals: nodeIf thenStatementBlock statements size.
	self assert: copyIf elseStatementBlock equals: nodeIf elseStatementBlock.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testIfBlockStatementWithElseBlock [
	"if (bool) then
      else
        return 
      end if"

	| node copy |
	node := self
		ifBlock: (self scalarVariable: 'bool')
		then: #()
		else:  {  self returnStatement: nil }.

	copy := visitor copy: node.

	self deny: copy equals: node.

	self deny: copy thenStatementBlock equals: node thenStatementBlock.
	self assert: copy thenStatementBlock statements size equals: node thenStatementBlock statements size.

	self deny: copy elseStatementBlock equals: node elseStatementBlock.
	self assert: copy elseStatementBlock statements size equals: node elseStatementBlock statements size.
	self deny: copy elseStatementBlock statements anyOne equals: node elseStatementBlock statements anyOne.
	self assert: copy elseStatementBlock statements anyOne class equals: node elseStatementBlock statements anyOne class.

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testIfBlockStatementWithThenBlock [
	"if (bool) then
        return 
      end if"

	| node copy |
	node := self
		ifBlock: (self scalarVariable: 'bool')
		then: {  self returnStatement: nil }
		else: nil.

	copy := visitor copy: node.

	self deny: copy equals: node.

	self deny: copy thenStatementBlock equals: node thenStatementBlock.
	self assert: copy thenStatementBlock statements size equals: node thenStatementBlock statements size.
	self deny: copy thenStatementBlock statements anyOne equals: node thenStatementBlock statements anyOne.
	self assert: copy thenStatementBlock statements anyOne class equals: node thenStatementBlock statements anyOne class.

	self assert: copy elseStatementBlock equals: node elseStatementBlock.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testIfLogicalStatementEmpty [
	| stmt |
	stmt := FASTFortranIfLogicalStatement new
		condition: (self scalarVariable: 'bool') ;
		statement: FASTFortranReturnStatement new ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'      if (bool) return 
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testImplicitStatement [
	| stmt |
	stmt := self implicitStatement.

	self
		assertExportCopy: stmt
		equals: 
'      implicit none
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testImplicitStatementSeveralRules [
	| stmt |
	stmt := self implicitStatement.
	stmt addTypingRule: (FASTFortranImplicitTypingRule new
		type: (self logicalType: nil) ;
		ranges: { self implicitRange: 'l' to: 'n'}).
	stmt addTypingRule: (FASTFortranImplicitTypingRule new
		type: (self integerType: nil) ;
		ranges: { self implicitRange: 'c' to: nil . self implicitRange: 's' to: nil }).


	self
		assertExportCopy: stmt
		equals: 
'      implicit logical (l-n), integer (c,s)
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testImpliedDoExpression [
	| expr |

	expr := FASTFortranImpliedDoExpression new
		loopControl: (self loopControlInit: #(i 1) increment: 1 limit: #max) ;
		variables: (self scalarVariables: #(v i)).

	self
		assertExportCopy: expr
		equals: 
'(v,i,i = 1,max,1)'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testInquireStatement [
	| stmt |
	stmt := FASTFortranInquireStatement new
		ioParameters: {
			self integerLiteral: '3' .
			self assignementExpression: #iostat value: #stat .
			self assignementExpression: #err value: 10
		}.

	self
		assertExportCopy: stmt
		equals: 
'      inquire (3,iostat = stat,err = 10)
'.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testIntrinsicStatement [

	| stmt |

	stmt := FASTFortranIntrinsicStatement new
		variables: (self scalarVariables: #(sin cos)) ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'      intrinsic sin,cos
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testLabelledStatement [
	| stmt |
	stmt := self returnStatement: nil.
	stmt label: '100'.

	self
		assertExportCopy: stmt
		equals: 
'100   return 
'
]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testLongDataStatementLine [

	| stmt |

	stmt := FASTFortranDataStatement new
		variableGroups: {
			FASTFortranDataGroup new
				variables: (self scalarVariables: #(abcde fghijk lmnopq)) ;
				dataConstants: {
					self characterLiteral: '---------------' .
					self characterLiteral: '---------------' .
					self characterLiteral: '---------------' }
		} ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'      data abcde,fghijk,lmnopq /''---------------'',''---------------'',
     & ''---------------''/ 
'
]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testLongFormatLine [

	| stmt |

	stmt := FASTFortranFormatStatement new
		formatDescription: '(1h,//36hxabs-(156)intrinsicfunctions--//11x,26habs,iabs(absolutevalue)//20hsubsetref.-15.3)' ;
		label: '110' ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'110   format (1h,//36hxabs-(156)intrinsicfunctions--//11x,26habs,
     & iabs(absolutevalue)//20hsubsetref.-15.3)
'.
]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testLongLine [
	| stmt |
	stmt := self declarationStatement: #character variables: #(abc1 abc2 abc3 abc4 abc5 abc6 abc7 abc8 abc9 abc10 abc11 abc12 abc13 abc14 abc15 abc16 abc17 abc18 abc19 abc20 abc21 abc22 abc23 abc24 abc25).

	self
		assertExportCopy: stmt
		equals: 
'      character abc1,abc2,abc3,abc4,abc5,abc6,abc7,abc8,abc9,abc10,abc11
     & ,abc12,abc13,abc14,abc15,abc16,abc17,abc18,abc19,abc20,abc21,
     & abc22,abc23,abc24,abc25
'
]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testLongLineDontBreak [
	| stmt |
	self skip.

	stmt := self declarationStatement: #character variables: #(abc1 abc2 abc3 abc4 abc5 abc6 abc7 abc8 abc9 abc10 abc11 abc12 abc13 abc14 abc15 abc16 abc17 abc18 abc19 abc20 abc21 abc22 abc23 abc24 abc25).

	visitor dontBreakLongLines.

	self
		assertExportCopy: stmt
		equals: 
'      character abc1,abc2,abc3,abc4,abc5,abc6,abc7,abc8,abc9,abc10,abc11,abc12,abc13,abc14,abc15,abc16,abc17,abc18,abc19,abc20,abc21,abc22,abc23,abc24,abc25
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testMainProgram [
	| node |
	node := FASTFortranProgramMain new
		name: 'BLAH' ;
		statementBlock: FASTFortranStatementBlock new
		yourself.

	self
		assertExportCopy: node
		equals: 
'      program BLAH
      end
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testOneDeclarationCharacterType [
	"character* str"

	| node copy |
	node := self declarationStatement: #character variables: #(r).

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy class equals: node class.

	self deny: copy type equals: node type.
	self assert: copy type class equals: node type class.
		
	self assert: copy declarators size equals: node declarators size.

	self deny: copy declarators anyOne equals: node declarators anyOne.
	self assert: copy declarators anyOne class equals: node declarators anyOne class.
	self assert: copy declarators anyOne name equals: node declarators anyOne name.

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testOneDeclarationCharacterTypeStarSize [
	"character*(*) str"

	| node copy |
	node := self declarationStatement: #(character *) variables: #(str).

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy class equals: node class.

	self deny: copy type equals: node type.
	self assert: copy type class equals: node type class.
	self assert: copy type size class equals: node type size class.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testOneDeclarationCharacterTypeWithSize [
	"character*10 str"

	| node copy |
	node := self declarationStatement: #(character 10) variables: #(str).

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy class equals: node class.

	self deny: copy type equals: node type.
	self assert: copy type class equals: node type class.

	self deny: copy type size equals: node type size.
	self assert: copy type size class equals: node type size class.
	self assert: copy type size primitiveValue equals: node type size primitiveValue
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testOneDeclarationDoublePrecisionType [
	"double precision r"

	| node copy |
	node := self declarationStatement: (FASTFortranDoublePrecisionType new) variables: #(r).

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy class equals: node class.

	self deny: copy type equals: node type.
	self assert: copy type class equals: node type class.
		
	self assert: copy declarators size equals: node declarators size.

	self deny: copy declarators anyOne equals: node declarators anyOne.
	self assert: copy declarators anyOne class equals: node declarators anyOne class.
	self assert: copy declarators anyOne name equals: node declarators anyOne name.

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testOneDeclarationIntegerTypeWithSize [
	"integer*8 i"

	| node copy |
	node := self declarationStatement: #(integer 8) variables: #(i).

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy class equals: node class.

	self deny: copy type equals: node type.
	self assert: copy type class equals: node type class.

	self deny: copy type size equals: node type size.
	self assert: copy type size class equals: node type size class.
	self assert: copy type size primitiveValue equals: node type size primitiveValue
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testOneDeclarationLogicalType [
	"logical r"

	| node copy |
	node := self declarationStatement: #logical variables: #(r).

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy class equals: node class.

	self deny: copy type equals: node type.
	self assert: copy type class equals: node type class.
		
	self assert: copy declarators size equals: node declarators size.

	self deny: copy declarators anyOne equals: node declarators anyOne.
	self assert: copy declarators anyOne class equals: node declarators anyOne class.
	self assert: copy declarators anyOne name equals: node declarators anyOne name.

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testOneDeclarationRealType [
	| node copy |
	node := self declarationStatement: #real variables: #(r).

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy class equals: node class.

	self deny: copy type equals: node type.
	self assert: copy type class equals: node type class.
		
	self assert: copy declarators size equals: node declarators size.

	self deny: copy declarators anyOne equals: node declarators anyOne.
	self assert: copy declarators anyOne class equals: node declarators anyOne class.
	self assert: copy declarators anyOne name equals: node declarators anyOne name.

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testOneDeclarationTwoVariables [
	"integer i,j"

	| node copy |
	node := self declarationStatement: #integer variables: #(i j).

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy class equals: node class.

	self deny: copy type equals: node type.
	self assert: copy type class equals: node type class.

	self assert: copy declarators size equals: node declarators size.

	self assert: copy declarators isNotEmpty.
	copy declarators with: node declarators do: [ :copyDecl :nodeDecl |
		self deny: copyDecl equals: nodeDecl.
		self assert: copyDecl class equals: nodeDecl class.
		self assert: copyDecl name equals: nodeDecl name.
	]

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testOpenStatement [
	| stmt |
	stmt := FASTFortranOpenStatement new
		ioParameters: {
			self integerLiteral: '3' .
			self assignementExpression: #file value: 'projectA/data.test'.
			self assignementExpression: #err value: 99
		}.

	self
		assertExportCopy: stmt
		equals: 
'      open (3,file = ''projectA/data.test'',err = 99)
'.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testPauseStatementWithInteger [
	| stmt |
	stmt := FASTFortranParameterStatement new
		declarators: (self variableDeclarators: #(pi msg)) ;
		yourself.
	stmt declarators first expression: (self realLiteral: '3.14159').
	stmt declarators second expression: (self characterLiteral: 'hello').

	self
		assertExportCopy: stmt
		equals: 
'      parameter (pi=3.14159,msg=''hello'')
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testPauseStatementWithString [
	| stmt |
	stmt := FASTFortranPauseStatement new
		displayArgument: '''error''' ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'      pause ''error''
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testPrintStatement [
	| stmt |
	stmt := self printStatement: { self characterLiteral: 'message' }.

	self
		assertExportCopy: stmt
		equals: 
'      print *, ''message''
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testReadStatement [
	| stmt |
	stmt := self
		readStatement: #(V)
		ioParams: {
			1 .
			self assignementExpression: #rec value: 3 .
			self assignementExpression: #iostat value: #N .
			self assignementExpression: #err value: 8
		}.

	self
		assertExportCopy: stmt
		equals: 
'      read (1,rec = 3,iostat = N,err = 8) V
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testReturnStatementEmpty [
	| node copy |
	node :=  self returnStatement: nil.

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy class equals: node class.
	self assert: copy expression equals: node expression.
		
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testReturnStatementLiteralValue [
	| node copy |
	node := self returnStatement: (self realLiteral: '3.5').

	copy := visitor copy: node.

	self deny: copy equals: node.
	self assert: copy class equals: node class.

	self deny: copy expression equals: node expression.
	self assert: copy expression primitiveValue equals: node expression primitiveValue
		
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testRewindStatement [
	| stmt |
	stmt := FASTFortranRewindStatement new
		ioParameters: {
			self integerLiteral: '3' .
			self assignementExpression: #iostat value: #stat.
			self assignementExpression: #err value: 10
		}.

	self
		assertExportCopy: stmt
		equals: 
'      rewind (3,iostat = stat,err = 10)
'.
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testStopStatementEmpty [
	| stmt |
	stmt := FASTFortranStopStatement new.

	self
		assertExportCopy: stmt
		equals: 
'      stop 
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testStopStatementWithInteger [
	| stmt |
	stmt := FASTFortranStopStatement new
		displayArgument: '1' ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'      stop 1
'
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testStopStatementWithString [
	| stmt |
	stmt := FASTFortranStopStatement new
		displayArgument: '''error''' ;
		yourself.

	self
		assertExportCopy: stmt
		equals: 
'      stop ''error''
'
]

{ #category : 'tests' }
FASTFortranCopyVisitorTest >> testStringConcatOperator [
	| stmt |
	stmt := self binary: '//' left: #texte right: ' a string'.

	self
		assertExportCopy: stmt
		equals: 
'texte // '' a string'''
]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testStringLiteralWithQuote [
	" 'a ''string'' with quotes' "

	| expr copy |
	expr := self characterLiteral: 'a ''''string'''' with quotes'.

	copy := visitor copy: expr.

	self deny: copy equals: expr.

	self assert: copy class equals: expr class.
	self assert: copy primitiveValue equals: expr primitiveValue.

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testTwoDeclarationsTwoVariables [
	"subroutine blah()
        integer i
        integer j
      end"

	| sub stmt copy |
	sub := self subroutine: 'blah'.

	stmt := self
		declarationStatement: #integer
		variables: #(i).
	sub statementBlock addStatement: stmt.

	stmt := self
		declarationStatement: #integer
		variables: #(j).
	sub statementBlock addStatement: stmt.

	copy := visitor copy: sub.

	self deny: copy equals: sub.

	self deny: copy statementBlock equals: sub statementBlock.
	self assert: copy statementBlock statements size equals: sub statementBlock statements size.

	self assert: copy statementBlock statements isNotEmpty. 
	copy statementBlock statements with: sub statementBlock statements do: [ :copyStmt :nodeStmt |
		self deny: copyStmt equals: nodeStmt.
		self assert: copyStmt class equals: nodeStmt class.
	]

]

{ #category : 'tests - statements' }
FASTFortranCopyVisitorTest >> testWriteStatement [
	| stmt |
	stmt := self writeStatement: #( 'message' ).

	self
		assertExportCopy: stmt
		equals: 
'      write (*,*) ''message''
'
]
