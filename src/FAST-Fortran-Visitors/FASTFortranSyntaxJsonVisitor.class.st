Class {
	#name : #FASTFortranSyntaxJsonVisitor,
	#superclass : #SyntaxAbstractJsonVisitor,
	#instVars : [
		'lineSizes',
		'model',
		'nestedDoEndLabel'
	],
	#category : #'FAST-Fortran-Visitors-Importer'
}

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> createPosition: start end: end [ 

	^ { start . end }
]

{ #category : #initialization }
FASTFortranSyntaxJsonVisitor >> initLineSizes: fortranSource [

	lineSizes := fortranSource lines collect: #size
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> newEntity: aFASTFortranClass [

	| node |
	node := aFASTFortranClass new.
	node mooseModel: model.
	^ node
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> newEntity: aFASTFortranClass atPosition: aPoint [

	| node |
	node := aFASTFortranClass new.
	node mooseModel: model.
	self set: node startEnd: aPoint.
	^ node
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> pointToPosition: lineColumn [

	| position |
	position := 0.
	1 to: lineColumn x - 1 do: [ :i |
	position := position + (lineSizes at: i) + 1 ].
	^ position + lineColumn y
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> set: aFASTFortranNode startEnd: startEndPoints [

	aFASTFortranNode
		startPos: (self pointToPosition: startEndPoints first);
		endPos: (self pointToPosition: startEndPoints second) - 1
]

{ #category : #helpers }
FASTFortranSyntaxJsonVisitor >> setBodyPosition: aProgramUnit fromProgramUnitPosition: startEndPoints [

	"sets a reasonnable start/end position for a statementBlock:
	 - startPos = first character of parent node second line (first line + 1)
	 - endPos = first character of parent node last line
	(note: set:startEnd: substract 1 to end position so we give it the 2nd character of this line)"

	| body bodyStartEnd |
	body := aProgramUnit statementBlock.
	
	body ifNil: [ ^nil ].
	
	bodyStartEnd := {
		startEndPoints first x +1 @ 1 .
		startEndPoints second x @ 2
	}.
	self set: body startEnd: bodyStartEnd

]

{ #category : #'visit statement' }
FASTFortranSyntaxJsonVisitor >> visitContinue_statement: aContinueStatement [

	^ self newEntity: FASTFortranContinueStatement
]

{ #category : #'visit statement' }
FASTFortranSyntaxJsonVisitor >> visitMain: aMain [
	"#(start_pos parameters end_pos statement_list name)"

	| data main position |
	data := super visitMain: aMain.

	position := self createPosition: data first end: data third.
	main := (self newEntity: FASTFortranProgramMain atPosition: position)
		        name: data fifth;
		        statementBlock: (FASTFortranStatementBlock new
				         statements: data fourth;
				         yourself);
		        yourself.

	self setBodyPosition: main fromProgramUnitPosition: position.

	^ main
]

{ #category : #'visit statement' }
FASTFortranSyntaxJsonVisitor >> visitParameter: aParameter [

	^ (self newEntity: FASTFortranScalarVariable)
		name: (aParameter at: 'name'); 
		yourself
]

{ #category : #'visit statement' }
FASTFortranSyntaxJsonVisitor >> visitProgramFile: aProgramFile [
	
	model := FASTFortranModel new.
	^ (super visitProgramFile: aProgramFile) first.
	
]

{ #category : #'visit statement' }
FASTFortranSyntaxJsonVisitor >> visitSubroutine: aSubroutine [
	"#(start_pos parameters end_pos statement_list name)"

	| data subroutine position |
	data := super visitSubroutine: aSubroutine.
	position := self createPosition: data first end: data third.
	subroutine := (self
		               newEntity: FASTFortranSubroutine
		               atPosition: position)
		              name: data fifth;
		              statementBlock: (FASTFortranStatementBlock new
				               statements: data fourth;
				               yourself);
		              parameters: data second;
		              yourself.

	self setBodyPosition: subroutine fromProgramUnitPosition: position.

	^ subroutine
]
