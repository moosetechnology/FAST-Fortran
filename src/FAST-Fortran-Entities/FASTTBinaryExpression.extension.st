Extension { #name : #FASTTBinaryExpression }

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTBinaryExpression >> left [
	"Relation named: #left type: #FASTTExpression opposite: #parentExpressionLeft"

	<generated>
	<FMComment: 'left part of a binary expression'>
	<FMProperty: #left type: #FASTTExpression opposite: #parentExpressionLeft>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #left ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTBinaryExpression >> left: anObject [

	<generated>
	(self attributeAt: #left ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self left.
		self attributeAt: #left put: anObject.
		otherSide parentExpressionLeft: nil ]
	ifNotNil: [ 
		self attributeAt: #left put: anObject.
		anObject parentExpressionLeft: self ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTBinaryExpression >> right [
	"Relation named: #right type: #FASTTExpression opposite: #parentExpressionRight"

	<generated>
	<FMComment: 'left part of the expression'>
	<FMProperty: #right type: #FASTTExpression opposite: #parentExpressionRight>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #right ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTBinaryExpression >> right: anObject [

	<generated>
	(self attributeAt: #right ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self right.
		self attributeAt: #right put: anObject.
		otherSide parentExpressionRight: nil ]
	ifNotNil: [ 
		self attributeAt: #right put: anObject.
		anObject parentExpressionRight: self ]
]
