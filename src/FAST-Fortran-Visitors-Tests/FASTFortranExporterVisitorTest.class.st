"
A FASTFortranExporterVisitorTest is a test class for testing the behavior of FASTFortranExporterVisitor
"
Class {
	#name : 'FASTFortranExporterVisitorTest',
	#superclass : 'FASTFortranAbstractVisitorTest',
	#category : 'FAST-Fortran-Visitors-Tests-Visitor',
	#package : 'FAST-Fortran-Visitors-Tests',
	#tag : 'Visitor'
}

{ #category : 'running' }
FASTFortranExporterVisitorTest >> assertExport: anEntity equals: expectedString [
	| generated |
	anEntity accept: visitor.
	generated := visitor outputStream contents.
	self assert: generated equals: expectedString
]

{ #category : 'running' }
FASTFortranExporterVisitorTest >> newVisitor [

	^FASTFortranExporterVisitor new
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testArrayDeclaration [
	| stmt |
	stmt := self arrayDeclaration: 'v' dimensions: #( #('1' '10') ).

	self
		assertExport: stmt
		equals: 
'      integer v(1:10)
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testArrayDeclarationImplicitLowerBound [
	| stmt |
	stmt := self arrayDeclaration: 'v' dimensions: #( #('1' '10') ).
	stmt declarators first dimensions first lowerBound: nil.

	self
		assertExport: stmt
		equals: 
'      integer v(10)
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testArrayDeclarationMultipleDimensions [
	| stmt |
	stmt := self arrayDeclaration: 'v' dimensions: #( #('1' '10') #('-10' '-1') ).

	self
		assertExport: stmt
		equals: 
'      integer v(1:10,-10:-1)
'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testArrayRange [
	| stmt |
	stmt := FASTFortranArrayVariable new
		name: 'arr' ;
		indices: { FASTFortranArrayRange new
			lowerBound: (self integerLiteral: '1') ;
			upperBound: (self scalarVariable: 'max') } ;
		yourself.

	self
		assertExport: stmt
		equals: 
'arr(1:max)'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testArrayVariable [
	| stmt |
	stmt := FASTFortranArrayVariable new
		name: 'arr'.

	self
		assertExport: stmt
		equals: 
'arr()'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testAssignementFunctionCall [

	| stmt |
	stmt := self
		assignementStatement: #a 
		value: (self 
			functionCall: 'fct'
			arguments: {
				self integerLiteral: '5' .
				self scalarVariable: 'b' }).

	self
		assertExport: stmt
		equals: 
'      a = fct(5,b)
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testAssignementStatementArrayAssigned [
	| stmt |
	stmt := FASTFortranAssignmentStatement new
		variable: (self 
			array: 'arr' access: { self scalarVariable: 'i' . self integerLiteral: '1'});
		expression: (self makeSimpleExpression: #b);
		yourself.

	self
		assertExport: stmt
		equals: 
'      arr(i,1) = b
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testAssignementStatementLiteralValue [
	| stmt |
	stmt := self assignementStatement: #aVar value: (self logicalLiteral: '.true.').

	self
		assertExport: stmt
		equals: 
'      aVar = .true.
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testAssignementStatementVariable [
	| stmt |
	stmt := self assignementStatement: #a value: #b.

	self
		assertExport: stmt
		equals: 
'      a = b
'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testBinaryExpression [
	| expr |
	expr := FASTFortranBinaryExpression new
		leftOperand: (self scalarVariable: 'a') ;
		operator: '+' ;
		rightOperand: (self integerLiteral: '5').

	self
		assertExport: expr
		equals: 'a + 5'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testBinaryExpressionNe [
	| expr |
	expr := FASTFortranBinaryExpression new
		leftOperand: (self scalarVariable: 'a') ;
		operator: '.ne.' ;
		rightOperand: (self integerLiteral: '5').

	self
		assertExport: expr
		equals: 'a .ne. 5'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testBlockStatementWithCommentAndStatement [
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
		assertExport: block
		equals: 
'C comment before assignement
        i = 1
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testCallStatementExpressionArg [
	| stmt |
	stmt := self callStatement: 'subrtn' arguments: {
		self binary: '*' left: #a right: 5 }.

	self
		assertExport: stmt
		equals: 
'      call subrtn(a * 5)
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testCallStatementNoArgs [
	| stmt |
	stmt := self callStatement: 'subrtn' arguments: #().

	self
		assertExport: stmt
		equals: 
'      call subrtn
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testCallStatementWithArgs [
	| stmt |
	stmt := self callStatement: 'subrtn' arguments: {
		self scalarVariable: 'a' .
		self integerLiteral: '5' }.

	self
		assertExport: stmt
		equals: 
'      call subrtn(a,5)
'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testComment [
	| cmt |
	cmt := self comment: 'C This is a comment'.

	self
		assertExport: cmt
		equals: 
'C This is a comment
'.
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testComment72Characters [
	| cmt |
	cmt := self comment: 'C 3456789 123456789 123456789 123456789 123456789 123456789 123456789 12'.

	self
		assertExport: cmt
		equals: 
'C 3456789 123456789 123456789 123456789 123456789 123456789 123456789 12
'.
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testCommonStatement [

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
		assertExport: stmt
		equals: 
'      common a,b /otherGrp/ c,d
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testContinueStatement [
	| stmt |
	stmt := FASTFortranContinueStatement new
		label: '110'.

	self
		assertExport: stmt
		equals: 
'110   continue
'.
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testDataStatement [

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
		assertExport: stmt
		equals: 
'      data a,b /''un'',''deux''/ ,c /''trois''/ 
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testDimensionStatement [

	| stmt |

	stmt := FASTFortranDimensionStatement new
		declarators: {
			self arrayDeclarator: 'v' dimensions: #( #('1' '10') ) .
			self arrayDeclarator: 'm' dimensions: #( #('100') #('100') ) .
		}.

	self
		assertExport: stmt
		equals: 
'      dimension v(1:10),m(100,100)
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testDoStatement [
	| stmt |

	stmt := self doStatement: #(i 1 max 1) statements: #().

	self
		assertExport: stmt
		equals: 
'      do i = 1,max,1
      end do
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testDoStatementNoIncrement [
	| stmt |

	stmt := self doStatement: #(i 1 max) statements: #().

	self
		assertExport: stmt
		equals: 
'      do i = 1,max
      end do
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testDoStatementWithLabel [
	| stmt |

	stmt := self doStatement:  #(i 1 max) statements: {
		FASTFortranContinueStatement new label: '110'}.

	stmt labelReferences: { self labelReference: '110' }.

	self
		assertExport: stmt
		equals: 
'      do 110 i = 1,max
110     continue
'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testEmptySubroutineNoParameters [
	| sub |
	sub := self subroutine: 'blah'.

	self
		assertExport: sub
		equals: 
'      subroutine blah()
      end
'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testEmptySubroutineTwoParameters [
	| sub |
	sub := self subroutine: 'blah'.
	self
		entity: sub
		parameters: #(i j).

	self
		assertExport: sub
		equals: 
'      subroutine blah(i,j)
      end
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testEntryStatement [

	| stmt |
	stmt := FASTFortranEntryStatement new
		name: 'XYZ' ;
		entryArguments: { self scalarVariable: 'ABC' . FASTFortranAsterisk new } ;
		yourself.

	self
		assertExport: stmt
		equals:
'      entry XYZ(ABC,*)
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testEquivalenceStatement [

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
		assertExport: stmt
		equals: 
'      equivalence (a,b(1)), (c,d,e)
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testExitStatement [
	| stmt |
	stmt := self exitStatement: nil.

	self
		assertExport: stmt
		equals: 
'      exit
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testExternalStatement [
	| stmt |
	stmt := self externalStatement: 'aVar'.

	self
		assertExport: stmt
		equals: 
'      external aVar
'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testFieldAccess [
	| fct varAccess writeStatement |
	fct := self functionDeclaration: 'blah'.
	fct declaredType: nil.

	varAccess := FASTFortranFieldAccess new
		pointer: (self scalarVariable: #p) ;
		field: (self scalarVariable: #x).
	writeStatement := self writeStatement: {  varAccess }.
	fct statementBlock addStatement: writeStatement.

	self
		assertExport: fct
		equals: 
'      function blah()
        write (*,*) p.x
      end
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testFormatStatement [
	| stmt |
	stmt := FASTFortranFormatStatement new
		formatDescription: '(/8x)' ;
		label: '110' ;
		yourself.

	self
		assertExport: stmt
		equals: 
'110   format (/8x)
'.
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testFunctionNoParameterNoStatement [
	| node |
	node := self functionDeclaration: 'BLAH'.

	self
		assertExport: node
		equals: 
'      real function BLAH()
      end
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testFunctionNoParameterWithStatement [
	| node stmt |
	stmt := self returnStatement: (self scalarVariable: 'i').

	node := self functionDeclaration: 'BLAH'.
	node statementBlock: (self statementBlock: { stmt }).

	self
		assertExport: node
		equals: 
'      real function BLAH()
        return i
      end
'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testFunctionNoReturnType [
	| fct |
	fct := self functionDeclaration: 'blah'.
	fct declaredType: nil.

	self
		assertExport: fct
		equals: 
'      function blah()
      end
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testFunctionStatement [
	| node |
	node := FASTFortranFunctionStatement new.
	node name: 'fct'.
	node parameters: (self scalarVariables: #(x y)).
	node expression: (self binary: '+' left: #x right: 2).

	self
		assertExport: node
		equals: 
'      fct(x,y) = x + 2
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testFunctionWithParameterNoStatement [
	| node |
	node := self functionDeclaration: 'BLAH'.
	self entity: node parameters: #(i j).

	self
		assertExport: node
		equals: 
'      real function BLAH(i,j)
      end
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testGotoComputedStatement [
	| stmt |
	stmt := FASTFortranGoToComputedStatement new
		labelReferences: { self labelReference: '110' . self labelReference: '120' . self labelReference: '130'} ;
		selectorExpression: (self scalarVariable: 'i') ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      goto (110,120,130) i
'.
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testGotoStatement [
	| stmt |
	stmt := self gotoStatement: '110'.

	self
		assertExport: stmt
		equals: 
'      goto 110
'.
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testIfArithmeticStatement [
	| stmt |

	stmt := self ifArithmetic: #a negative: 10 null: 20 positive: 30.

	self
		assertExport: stmt
		equals: 
'      if (a) 10, 20, 30
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testIfBlockStatementEmpty [
	| stmt |
	stmt := self ifBlock: (self scalarVariable: 'bool') then: #() else: nil.

	self
		assertExport: stmt
		equals: 
'      if (bool) then
      end if
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testIfBlockStatementEmptyBinaryCondition [
	| stmt cond |
	cond := self binary: '.gt.' left: #a right: 0.
	stmt := self ifBlock: cond then: #() else:  nil.

	self
		assertExport: stmt
		equals: 
'      if (a .gt. 0) then
      end if
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testIfBlockStatementNested [
	| stmt |
	stmt := self
		ifBlock: (self scalarVariable: 'bool1')
		then: { self
			ifBlock: (self scalarVariable: 'bool2')
			then: #()
			else: nil }
		else: nil.

	self
		assertExport: stmt
		equals: 
'      if (bool1) then
        if (bool2) then
        end if
      end if
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testIfBlockStatementWithElseBlock [
	| stmt |
	stmt := self
		ifBlock: (self scalarVariable: 'bool')
		then: #()
		else:  {  self returnStatement: nil }.

	self
		assertExport: stmt
		equals: 
'      if (bool) then
      else
        return 
      end if
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testIfBlockStatementWithThenBlock [
	| stmt |
	stmt := self
		ifBlock: (self scalarVariable: 'bool')
		then: {  self returnStatement: nil }
		else: nil.

	self
		assertExport: stmt
		equals: 
'      if (bool) then
        return 
      end if
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testIfLogicalStatementEmpty [
	| stmt |
	stmt := FASTFortranIfLogicalStatement new
		condition: (self scalarVariable: 'bool') ;
		statement: FASTFortranReturnStatement new ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      if (bool) return 
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testImplicitStatement [
	| stmt |
	stmt := self implicitStatement.

	self
		assertExport: stmt
		equals: 
'      implicit none
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testImplicitStatementSeveralRules [
	| stmt |
	stmt := self implicitStatement.
	stmt addTypingRule: (FASTFortranImplicitTypingRule new
		type: (self logicalType: nil) ;
		ranges: { self implicitRange: 'l' to: 'n'}).
	stmt addTypingRule: (FASTFortranImplicitTypingRule new
		type: (self integerType: nil) ;
		ranges: { self implicitRange: 'c' to: nil . self implicitRange: 's' to: nil }).


	self
		assertExport: stmt
		equals: 
'      implicit logical (l-n), integer (c,s)
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testImpliedDoExpression [
	| expr init |

	expr := FASTFortranImpliedDoExpression new
		loopControl: (self loopControlInit: #(i 1) increment: 1 limit: #max) ;
		variables: (self scalarVariables: #(v i)).

	self
		assertExport: expr
		equals: 
'(v,i,i = 1,max,1)'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testInquireStatement [
	| stmt |
	stmt := FASTFortranInquireStatement new
		ioParameters: {
			self integerLiteral: '3' .
			self assignementExpression: #iostat value: #stat .
			self assignementExpression: #err value: 10
		}.

	self
		assertExport: stmt
		equals: 
'      inquire (3,iostat = stat,err = 10)
'.
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testIntrinsicStatement [

	| stmt |

	stmt := FASTFortranIntrinsicStatement new
		variables: (self scalarVariables: #(sin cos)) ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      intrinsic sin,cos
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testLabelledStatement [
	| stmt |
	stmt := self returnStatement: nil.
	stmt label: '100'.

	self
		assertExport: stmt
		equals: 
'100   return 
'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testLongDataStatementLine [

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
		assertExport: stmt
		equals: 
'      data abcde,fghijk,lmnopq /''---------------'',''---------------'',
     & ''---------------''/ 
'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testLongFormatLine [

	| stmt |

	stmt := FASTFortranFormatStatement new
		formatDescription: '(1h,//36hxabs-(156)intrinsicfunctions--//11x,26habs,iabs(absolutevalue)//20hsubsetref.-15.3)' ;
		label: '110' ;
		yourself.

	self
		assertExport: stmt
		equals: 
'110   format (1h,//36hxabs-(156)intrinsicfunctions--//11x,26habs,
     & iabs(absolutevalue)//20hsubsetref.-15.3)
'.
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testLongLine [
	| stmt |
	stmt := self declarationStatement: #character variables: #(abc1 abc2 abc3 abc4 abc5 abc6 abc7 abc8 abc9 abc10 abc11 abc12 abc13 abc14 abc15 abc16 abc17 abc18 abc19 abc20 abc21 abc22 abc23 abc24 abc25).

	self
		assertExport: stmt
		equals: 
'      character abc1,abc2,abc3,abc4,abc5,abc6,abc7,abc8,abc9,abc10,abc11
     & ,abc12,abc13,abc14,abc15,abc16,abc17,abc18,abc19,abc20,abc21,
     & abc22,abc23,abc24,abc25
'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testLongLineDontBreak [
	| stmt |
	stmt := self declarationStatement: #character variables: #(abc1 abc2 abc3 abc4 abc5 abc6 abc7 abc8 abc9 abc10 abc11 abc12 abc13 abc14 abc15 abc16 abc17 abc18 abc19 abc20 abc21 abc22 abc23 abc24 abc25).

	visitor dontBreakLongLines.

	self
		assertExport: stmt
		equals: 
'      character abc1,abc2,abc3,abc4,abc5,abc6,abc7,abc8,abc9,abc10,abc11,abc12,abc13,abc14,abc15,abc16,abc17,abc18,abc19,abc20,abc21,abc22,abc23,abc24,abc25
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testMainProgram [
	| node |
	node := FASTFortranProgramMain new
		name: 'BLAH' ;
		statementBlock: FASTFortranStatementBlock new
		yourself.

	self
		assertExport: node
		equals: 
'      program BLAH
      end
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationCharacterType [
	| stmt |
	stmt := self declarationStatement: #character variables: #(r).

	self
		assertExport: stmt
		equals: 
'      character r
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationCharacterTypeStarSize [
	| stmt |
	stmt := self declarationStatement: #(character *) variables: #(str).

	self
		assertExport: stmt
		equals: 
'      character*(*) str
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationCharacterTypeWithSize [
	| stmt |
	stmt := self declarationStatement: #(character 10) variables: #(str).

	self
		assertExport: stmt
		equals: 
'      character*10 str
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationDoublePrecisionType [
	| stmt |
	stmt := self declarationStatement: (FASTFortranDoublePrecisionType new) variables: #(r).

	self
		assertExport: stmt
		equals: 
'      double precision r
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationIntegerTypeWithSize [
	| stmt |
	stmt := self declarationStatement: #(integer 8) variables: #(i).

	self
		assertExport: stmt
		equals: 
'      integer*8 i
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationLogicalType [
	| stmt |
	stmt := self declarationStatement: #logical variables: #(r).

	self
		assertExport: stmt
		equals: 
'      logical r
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationRealType [
	| stmt |
	stmt := self declarationStatement: #real variables: #(r).

	self
		assertExport: stmt
		equals: 
'      real r
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationTwoVariables [
	| stmt |
	stmt := FASTFortranFunctionTypeDeclarationStatement new
		declaredType: (self makeType: #integer) ;
		name: 'fct';
		startPos: 1 ;
		endPos: 10.

	self
		assertExport: stmt
		equals: 
'      integer fct
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testOpenStatement [
	| stmt |
	stmt := FASTFortranOpenStatement new
		ioParameters: {
			self integerLiteral: '3' .
			self ioParameter: #file value: 'projectA/data.test'.
			self ioParameter: #err value: 99
		}.

	self
		assertExport: stmt
		equals: 
'      open (3,file = ''projectA/data.test'',err = 99)
'.
]

{ #category : 'tests - operator precedence' }
FASTFortranExporterVisitorTest >> testOperatorsPrecedenceNoParentheses [
	
	| expr |
	expr := self binary: '+' left: #v right: 5.

	self assertExport: expr
		equals: 'v + 5'
]

{ #category : 'tests - operator precedence' }
FASTFortranExporterVisitorTest >> testOperatorsPrecedenceSubHasHigherPrecedence [
	
	| expr |
	expr := self binary: '+' left: #i right: 5.
	expr rightOperand: (self binary: '*' left: #j right: 5).

	self assertExport: expr
		equals: 'i + j * 5'
]

{ #category : 'tests - operator precedence' }
FASTFortranExporterVisitorTest >> testOperatorsPrecedenceSubHasLowerPrecedence [
	
	| expr |
	expr := self binary: '*' left: #i right: 5.
	expr rightOperand: (self binary: '+' left: #j right: 5).

	self assertExport: expr
		equals: 'i * (j + 5)'
]

{ #category : 'tests - operator precedence' }
FASTFortranExporterVisitorTest >> testOperatorsPrecedenceSubUnary [
	
	| expr |
	expr := self binary: '.and.' left: #logical1 right: (self unary: '.not.' operand: #logical2).

	self
		assertExport: expr
		equals: 'logical1 .and. .not. logical2'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testPauseStatementEmpty [
	| stmt |
	stmt := FASTFortranPauseStatement new.

	self
		assertExport: stmt
		equals: 
'      pause 
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testPauseStatementWithInteger [
	| stmt |
	stmt := FASTFortranParameterStatement new
		declarators: (self variableDeclarators: #(pi msg)) ;
		yourself.
	stmt declarators first expression: (self realLiteral: '3.14159').
	stmt declarators second expression: (self characterLiteral: 'hello').

	self
		assertExport: stmt
		equals: 
'      parameter (pi=3.14159,msg=''hello'')
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testPauseStatementWithString [
	| stmt |
	stmt := FASTFortranPauseStatement new
		displayArgument: '''error''' ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      pause ''error''
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testPrintStatement [
	| stmt |
	stmt := self printStatement: { self characterLiteral: 'message' }.

	self
		assertExport: stmt
		equals: 
'      print *, ''message''
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testReadStatement [
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
		assertExport: stmt
		equals: 
'      read (1,rec = 3,iostat = N,err = 8) V
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testReturnStatementEmpty [
	| stmt |
	stmt :=  self returnStatement: nil.

	self
		assertExport: stmt
		equals: 
'      return 
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testReturnStatementLiteralValue [
	| stmt |
	stmt := self returnStatement: (self realLiteral: '3.5').

	self
		assertExport: stmt
		equals: 
'      return 3.5
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testRewindStatement [
	| stmt |
	stmt := FASTFortranRewindStatement new
		ioParameters: {
			self integerLiteral: '3' .
			self assignementExpression: #iostat value: #stat.
			self assignementExpression: #err value: 10
		}.

	self
		assertExport: stmt
		equals: 
'      rewind (3,iostat = stat,err = 10)
'.
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testStopStatementEmpty [
	| stmt |
	stmt := FASTFortranStopStatement new.

	self
		assertExport: stmt
		equals: 
'      stop 
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testStopStatementWithInteger [
	| stmt |
	stmt := FASTFortranStopStatement new
		displayArgument: '1' ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      stop 1
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testStopStatementWithString [
	| stmt |
	stmt := FASTFortranStopStatement new
		displayArgument: '''error''' ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      stop ''error''
'
]

{ #category : 'tests' }
FASTFortranExporterVisitorTest >> testStringConcatOperator [
	| stmt |
	stmt := self binary: '//' left: #texte right: ' a string'.

	self
		assertExport: stmt
		equals: 
'texte // '' a string'''
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testStringLiteralWithQuote [
	| expr |
	expr := self characterLiteral: 'a ''''string'''' with quotes'.

	self
		assertExport: expr
		equals: 
'''a ''''string'''' with quotes'''
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testTwoDeclarationsTwoVariables [
	| sub stmt |
	sub := self subroutine: 'blah'.

	stmt := self
		declarationStatement: #integer
		variables: #(i).
	sub statementBlock addStatement: stmt.

	stmt := self
		declarationStatement: #integer
		variables: #(j).
	stmt startPos: 11.
	stmt endPos: 15.
	sub statementBlock addStatement: stmt.

	self
		assertExport: sub
		equals: 
'      subroutine blah()
        integer i
        integer j
      end
'
]

{ #category : 'tests - statements' }
FASTFortranExporterVisitorTest >> testWriteStatement [
	| stmt |
	stmt := self writeStatement: #( 'message' ).

	self
		assertExport: stmt
		equals: 
'      write (*,*) ''message''
'
]
