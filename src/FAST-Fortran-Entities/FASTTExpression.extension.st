Extension { #name : #FASTTExpression }

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> assignementExpressionOwner [
	"Relation named: #assignementExpressionOwner type: #FASTFortranFunctionStatement opposite: #expression"

	<generated>
	<FMComment: 'The AssignementExpression owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #assignementExpressionOwner type: #FASTFortranFunctionStatement opposite: #expression>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #assignementExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> assignementExpressionOwner: anObject [

	<generated>
	(self attributeAt: #assignementExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self assignementExpressionOwner.
		self attributeAt: #assignementExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #assignementExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentArrayDimensionDeclarator [
	"Relation named: #parentArrayDimensionDeclarator type: #FASTFortranArrayRange opposite: #upperBound"

	<generated>
	<FMComment: 'Parent array dimension declarator'>
	<container>
	<derived>
	<FMProperty: #parentArrayDimensionDeclarator type: #FASTFortranArrayRange opposite: #upperBound>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentArrayDimensionDeclarator ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentArrayDimensionDeclarator: anObject [

	<generated>
	(self attributeAt: #parentArrayDimensionDeclarator ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentArrayDimensionDeclarator.
		self attributeAt: #parentArrayDimensionDeclarator put: anObject.
		otherSide upperBound: nil ]
	ifNotNil: [ 
		self attributeAt: #parentArrayDimensionDeclarator put: anObject.
		anObject upperBound: self ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentArrayExpression [
	"Relation named: #parentArrayExpression type: #FASTFortranArrayVariable opposite: #indices"

	<generated>
	<FMComment: 'an ArrayVariable expression of which I am an indice'>
	<FMProperty: #parentArrayExpression type: #FASTFortranArrayVariable opposite: #indices>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentArrayExpression ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentArrayExpression: anObject [

	<generated>
	self attributeAt: #parentArrayExpression put: (FMMultivalueLink on: self update: #indices from: self parentArrayExpression to: anObject).
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentConditionalStatement [
	"Relation named: #parentConditionalStatement type: #FASTFortranTConditionalStatement opposite: #condition"

	<generated>
	<FMComment: 'Parent conditional statement (if-block, if-logical, ...)'>
	<container>
	<derived>
	<FMProperty: #parentConditionalStatement type: #FASTFortranTConditionalStatement opposite: #condition>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentConditionalStatement ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentConditionalStatement: anObject [

	<generated>
	(self attributeAt: #parentConditionalStatement ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentConditionalStatement.
		self attributeAt: #parentConditionalStatement put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self attributeAt: #parentConditionalStatement put: anObject.
		anObject condition: self ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentDataStatement [
	"Relation named: #parentDataStatement type: #FASTFortranDataGroup opposite: #dataConstants"

	<generated>
	<FMProperty: #parentDataStatement type: #FASTFortranDataGroup opposite: #dataConstants>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentDataStatement ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentDataStatement: anObject [

	<generated>
	self attributeAt: #parentDataStatement put: (FMMultivalueLink on: self update: #dataConstants from: self parentDataStatement to: anObject).
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentExpression [
	"Relation named: #parentExpression type: #FASTTUnaryExpression opposite: #expression"

	<generated>
	<FMComment: 'Parent expression (if possible)'>
	<container>
	<derived>
	<FMProperty: #parentExpression type: #FASTTUnaryExpression opposite: #expression>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentExpression ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentExpression: anObject [

	<generated>
	(self attributeAt: #parentExpression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentExpression.
		self attributeAt: #parentExpression put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #parentExpression put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentExpressionLeft [
	"Relation named: #parentExpressionLeft type: #FASTTBinaryExpression opposite: #left"

	<generated>
	<FMComment: 'Parent (binary) expression of which I am left side'>
	<container>
	<derived>
	<FMProperty: #parentExpressionLeft type: #FASTTBinaryExpression opposite: #left>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentExpressionLeft ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentExpressionLeft: anObject [

	<generated>
	(self attributeAt: #parentExpressionLeft ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentExpressionLeft.
		self attributeAt: #parentExpressionLeft put: anObject.
		otherSide left: nil ]
	ifNotNil: [ 
		self attributeAt: #parentExpressionLeft put: anObject.
		anObject left: self ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentExpressionRight [
	"Relation named: #parentExpressionRight type: #FASTTBinaryExpression opposite: #right"

	<generated>
	<FMComment: 'Parent (binary) expression of which I am right side'>
	<container>
	<derived>
	<FMProperty: #parentExpressionRight type: #FASTTBinaryExpression opposite: #right>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentExpressionRight ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentExpressionRight: anObject [

	<generated>
	(self attributeAt: #parentExpressionRight ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentExpressionRight.
		self attributeAt: #parentExpressionRight put: anObject.
		otherSide right: nil ]
	ifNotNil: [ 
		self attributeAt: #parentExpressionRight put: anObject.
		anObject right: self ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentGotoAssignedStatement [
	"Relation named: #parentGotoAssignedStatement type: #FASTFortranGoToAssignedStatement opposite: #selectorExpression"

	<generated>
	<derived>
	<FMProperty: #parentGotoAssignedStatement type: #FASTFortranGoToAssignedStatement opposite: #selectorExpression>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentGotoAssignedStatement ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentGotoAssignedStatement: anObject [

	<generated>
	(self attributeAt: #parentGotoAssignedStatement ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentGotoAssignedStatement.
		self attributeAt: #parentGotoAssignedStatement put: anObject.
		otherSide selectorExpression: nil ]
	ifNotNil: [ 
		self attributeAt: #parentGotoAssignedStatement put: anObject.
		anObject selectorExpression: self ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentGotoComputedStatement [
	"Relation named: #parentGotoComputedStatement type: #FASTFortranGoToComputedStatement opposite: #selectorExpression"

	<generated>
	<derived>
	<FMProperty: #parentGotoComputedStatement type: #FASTFortranGoToComputedStatement opposite: #selectorExpression>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentGotoComputedStatement ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentGotoComputedStatement: anObject [

	<generated>
	(self attributeAt: #parentGotoComputedStatement ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentGotoComputedStatement.
		self attributeAt: #parentGotoComputedStatement put: anObject.
		otherSide selectorExpression: nil ]
	ifNotNil: [ 
		self attributeAt: #parentGotoComputedStatement put: anObject.
		anObject selectorExpression: self ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentLoopControlIncrement [
	"Relation named: #parentLoopControlIncrement type: #FASTFortranLoopControlExpression opposite: #increment"

	<generated>
	<container>
	<derived>
	<FMProperty: #parentLoopControlIncrement type: #FASTFortranLoopControlExpression opposite: #increment>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentLoopControlIncrement ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentLoopControlIncrement: anObject [

	<generated>
	(self attributeAt: #parentLoopControlIncrement ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentLoopControlIncrement.
		self attributeAt: #parentLoopControlIncrement put: anObject.
		otherSide increment: nil ]
	ifNotNil: [ 
		self attributeAt: #parentLoopControlIncrement put: anObject.
		anObject increment: self ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentLoopControlLimit [
	"Relation named: #parentLoopControlLimit type: #FASTFortranLoopControlExpression opposite: #limit"

	<generated>
	<container>
	<derived>
	<FMProperty: #parentLoopControlLimit type: #FASTFortranLoopControlExpression opposite: #limit>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentLoopControlLimit ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> parentLoopControlLimit: anObject [

	<generated>
	(self attributeAt: #parentLoopControlLimit ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentLoopControlLimit.
		self attributeAt: #parentLoopControlLimit put: anObject.
		otherSide limit: nil ]
	ifNotNil: [ 
		self attributeAt: #parentLoopControlLimit put: anObject.
		anObject limit: self ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> variableDeclaratorOwner [
	"Relation named: #variableDeclaratorOwner type: #FASTFortranTVariableDeclarator opposite: #expression"

	<generated>
	<container>
	<derived>
	<FMProperty: #variableDeclaratorOwner type: #FASTFortranTVariableDeclarator opposite: #expression>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #variableDeclaratorOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTExpression >> variableDeclaratorOwner: anObject [

	<generated>
	(self attributeAt: #variableDeclaratorOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self variableDeclaratorOwner.
		self attributeAt: #variableDeclaratorOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #variableDeclaratorOwner put: anObject.
		anObject expression: self ]
]
