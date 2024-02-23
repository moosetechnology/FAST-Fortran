Extension { #name : #FASTTUnaryExpression }

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTUnaryExpression >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #parentExpression"

	<generated>
	<FMComment: 'expression'>
	<FMProperty: #expression type: #FASTTExpression opposite: #parentExpression>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTUnaryExpression >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide parentExpression: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject parentExpression: self ]
]
