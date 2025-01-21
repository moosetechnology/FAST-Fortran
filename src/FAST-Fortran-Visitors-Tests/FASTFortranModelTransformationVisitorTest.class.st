Class {
	#name : 'FASTFortranModelTransformationVisitorTest',
	#superclass : 'FASTFortranAbstractVisitorTest',
	#category : 'FAST-Fortran-Visitors-Tests-Visitor',
	#package : 'FAST-Fortran-Visitors-Tests',
	#tag : 'Visitor'
}

{ #category : 'running' }
FASTFortranModelTransformationVisitorTest >> fooSegment [
	| model foo_seg |
	model := FASTEsopeModel new name: 'esopeModel'.

	foo_seg := model newSegmentNamed: 'foo'.
	foo_seg 
		statements: { 
			model newVariableDeclarationStatement 
				declaredType: (model newIntegerType); 
				declarators: { 
					model newVariableDeclarator 
						name: 'foo'; 
						dimensions: { 
							model newArrayRange 
								upperBound: (model newScalarVariable name: 'N') 
						} 
				} 
		}.
	^foo_seg 
]

{ #category : 'running' }
FASTFortranModelTransformationVisitorTest >> newVisitor [

	^FASTFortranModelTransformationVisitor new
]

{ #category : 'running' }
FASTFortranModelTransformationVisitorTest >> testArrayDeclaration [
	| stmt dst |
	stmt := self arrayDeclaration: 'v' dimensions: #( #('1' '10') ).
	
	dst := stmt accept: visitor.

	self
		assert: dst class
		equals: FASTFortran2kVariableDeclarationStatement.
]

{ #category : 'running' }
FASTFortranModelTransformationVisitorTest >> testAssignementStatementLiteralValue [
	| stmt res |
	stmt := self assignementStatement: #aVar value: (self logicalLiteral: '.true.').
	
	res := stmt accept: visitor.
	
	self assert: res class equals: FASTFortran2kAssignmentStatement.
	self assert: res variable class equals: FASTFortran2kScalarVariable.
	self assert: res expression class equals: FASTFortran2kBooleanLiteral.
	
	self assert: res variable name equals: 'aVar'.
	self assert: res expression primitiveValue equals: '.true.'.
]

{ #category : 'running' }
FASTFortranModelTransformationVisitorTest >> testComment [
	| cmt dst |
	cmt := self comment: 'This is a comment'.
	
	dst := cmt accept: visitor.
	
	self assert: dst class equals: FASTFortran2kComment.
	self assert: dst content equals: 'This is a comment'.
]

{ #category : 'running' }
FASTFortranModelTransformationVisitorTest >> testDoStatement [
	| stmt res loopControl |

	stmt := self doStatement: #(i 1 max 1) statements: #().
	
	res := stmt accept: visitor.

	self assert: res class equals: FASTFortran2kDoStatement.
	
	loopControl := res loopControl.
	
	self assert: loopControl class equals: FASTFortran2kLoopControlExpression.
	self assert: loopControl init class equals: FASTFortran2kAssignmentExpression.
	self assert: loopControl init variable class equals: FASTFortran2kScalarVariable.
	self assert: loopControl init expression class equals: FASTFortran2kIntegerLiteral.
]

{ #category : 'running' }
FASTFortranModelTransformationVisitorTest >> testEsopeSegmentToDerivedTypeInModule [
	"
	segment foo
	integer bar(N)
	end segment
	"

	| stmt res |

	stmt := self fooSegment.
	
	res := stmt accept: visitor.

	self assert: res class equals: FASTFortran2kModule.
	self assert: res name equals: 'foo_m'.
]

{ #category : 'tests-statement' }
FASTFortranModelTransformationVisitorTest >> testFctStatement [
	"
     PROGRAM demo
     fct(x)  = x + 2
     END

program demo
	implicit none
contains
    real function fct(x)
	 real, intent(in) :: x
    fct = x + 2
    end function fct
end program demo
		
	"
	| src dst var fctStatement entity |
	
	var := self scalarVariable: #x.
	
	fctStatement := FASTFortranFunctionStatement new
						name: 'fct';
						parameters: { var };
						expression: (self binary: '+' left: #x right: 2);
						yourself.
	
	
	fctStatement famix: (FamixF77StatementFunction new 
		name: fctStatement name;
		declaredType: (FamixF77TypeIntrinsic new name: 'real');
		yourself
	).
	
	var famixParameter: (FamixF77Parameter new 
		name: 'x'; 
		declaredType: (FamixF77TypeIntrinsic new name: 'real'); 
		yourself
	).
				

	src := FASTFortranProgramMain new 
		name: 'demo'; 
		statementBlock: (
			FASTFortranStatementBlock new
				statements: {fctStatement}
		); 
		yourself.

		
	dst := src accept: visitor.
	
	self assert: dst class equals: FASTFortran2kProgramMain.
	self assert: dst name equals: 'demo'.
	self assert: dst internalProcedures size equals: 1.
	
	entity := dst internalProcedures first.
	self assert: entity class equals: FASTFortran2kInternalFunction.
	self assert: entity name equals: 'fct'.
	self assert: entity returnType class equals: FASTFortran2kRealType.
	self assert: entity statementBlock statements size equals: 2.
	self assert: entity parameters size equals: 1.
	
	entity := entity parameters first.
	self assert: entity class equals: FASTFortran2kScalarVariable.
	self assert: entity name equals: 'x'.

]

{ #category : 'running' }
FASTFortranModelTransformationVisitorTest >> testMultipleProgramUnits [
	"
	subroutine sub
	print*, 'hello'
	end
	program demo
	call sub()
	end


module sub_mod
	implicit none
contains
	subroutine sub()
	print *, 'hello'
	end subroutine sub
end sub_mod

program demo
	use :: sub_mod
	implicit none
	call sub()
end program demo

"

	| sourceFileSrc sourceFileDst subroutine programMain entity |

	self skip: #TODO.
	
	subroutine := FASTFortranSubroutine new 
			name: 'sub'; 
			statementBlock: (FASTFortranStatementBlock new
				statements: {
					FASTFortranPrintStatement new
						format: FASTFortranAsterisk new;
						arguments: { FASTFortranCharacterLiteral new primitiveValue: 'Hello' }; 
						yourself
				}
			); 
			yourself.
			
	programMain := FASTFortranProgramMain new 
			name: 'demo'; 
			statementBlock: (FASTFortranStatementBlock new
				statements: { FASTFortranCallStatement new name: 'sub' ; arguments: {}; yourself }
			); 
			yourself.

	
	sourceFileSrc := FASTFortranProgramFile new "fileName: 'demo.f'"
	 	programUnit: { subroutine . programMain };
		yourself.
	
	
	sourceFileSrc famix: (FamixF77ProgramFile new filename: 'demo.f').
	subroutine famix: (FamixF77PUSubroutine new name: 'sub').
	programMain famix: (FamixF77PUMain new name: 'demo').

	sourceFileDst := sourceFileSrc accept: visitor.
	
	self assert: sourceFileDst class equals: FASTFortran2kProgramFile.
	self assert: sourceFileDst programUnit size equals: 2.
	
	entity := sourceFileDst programUnit first.
	self assert: entity class equals: FASTFortran2kModule.
	self assert: entity name equals: 'demo_mod'.
	self assert: entity procedures size equals: 1.
	
	entity := entity procedures first.
	self assert: entity class equals: FASTFortran2kSubroutine.
	self assert: entity name equals: 'sub'.
	
	entity := sourceFileDst programUnit second.
	self assert: entity class equals: FASTFortran2kProgramMain.
	self assert: entity name equals: 'demo'.
]

{ #category : 'tests-programUnit' }
FASTFortranModelTransformationVisitorTest >> testProgramEmpty [
	| src dst entity |

	src := FASTFortranProgramMain new 
		name: 'demo'; 
		statementBlock: FASTFortranStatementBlock new; 
		yourself.
		
	dst := src accept: visitor.
	
	self assert: dst class equals: FASTFortran2kProgramMain.
	self assert: dst name equals: 'demo'.
	self assert: dst statementBlock statements size equals: 1.
	
	entity := dst statementBlock statements first.
	self assert: entity class equals: FASTFortran2kImplicitStatement.
	
]

{ #category : 'running' }
FASTFortranModelTransformationVisitorTest >> testProgramWithExternalSubroutineInvocation [
	"
C	--------sub.f----------------
	subroutine sub
	print*, 'hello'
	end
C  -----end sub.f --------------
C	--------demo.f----------------
	program demo
	call sub()
	end
C  -----end demo.f --------------


C	--------sub_mod.f90----------------
module sub_mod
	implicit none
contains
	subroutine sub()
	print *, 'hello'
	end subroutine sub
end sub_mod
C	--------end sub_mod.f90----------------

C	--------demo.f90----------------
program demo
	use :: sub_mod
	call sub()
end program demo
C	--------end demo.f90----------------
	"

	| progfilesrc subfilesrc progfiledst subfiledst |

	self skip: #TODO.

	subfilesrc := FASTFortranProgramFile new "fileName: 'sub.f'"
	 	addProgramUnit: (FASTFortranSubroutine new 
			name: 'sub'; 
			statementBlock: (FASTFortranStatementBlock new
				statements: {
					FASTFortranPrintStatement new
						format: FASTFortranAsterisk new;
						arguments: { FASTFortranCharacterLiteral new primitiveValue: 'Hello' }; 
						yourself
				}
			); 
			yourself);
			yourself.
	
	progfilesrc := FASTFortranProgramFile new "fileName: 'demo.f'"
	 	addProgramUnit: (FASTFortranProgramMain new 
			name: 'demo'; 
			statementBlock: (FASTFortranStatementBlock new
				statements: { FASTFortranCallStatement new name: 'sub' ; arguments: {}; yourself }
			); 
			yourself);
			yourself.
		
	subfiledst := subfilesrc accept: visitor.
	progfiledst := progfilesrc accept: visitor.
	
	self assert: progfiledst class equals: FASTFortran2kProgramMain.
	self assert: progfiledst name equals: 'demo'.
]
