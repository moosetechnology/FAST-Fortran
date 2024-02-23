Extension { #name : #FASTTStatementBlock }

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTStatementBlock >> parentDoStatement [
	"Relation named: #parentDoStatement type: #FASTFortranDoStatement opposite: #statementBlock"

	<generated>
	<FMComment: 'Parent do statement'>
	<container>
	<derived>
	<FMProperty: #parentDoStatement type: #FASTFortranDoStatement opposite: #statementBlock>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentDoStatement ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTStatementBlock >> parentDoStatement: anObject [

	<generated>
	(self attributeAt: #parentDoStatement ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentDoStatement.
		self attributeAt: #parentDoStatement put: anObject.
		otherSide statementBlock: nil ]
	ifNotNil: [ 
		self attributeAt: #parentDoStatement put: anObject.
		anObject statementBlock: self ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTStatementBlock >> parentIfBlock [
	"Relation named: #parentIfBlock type: #FASTFortranIfBlockStatement opposite: #thenStatementBlock"

	<generated>
	<FMComment: 'Parent if block'>
	<container>
	<derived>
	<FMProperty: #parentIfBlock type: #FASTFortranIfBlockStatement opposite: #thenStatementBlock>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentIfBlock ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTStatementBlock >> parentIfBlock: anObject [

	<generated>
	(self attributeAt: #parentIfBlock ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentIfBlock.
		self attributeAt: #parentIfBlock put: anObject.
		otherSide thenStatementBlock: nil ]
	ifNotNil: [ 
		self attributeAt: #parentIfBlock put: anObject.
		anObject thenStatementBlock: self ]
]
