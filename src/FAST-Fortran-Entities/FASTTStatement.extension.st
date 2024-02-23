Extension { #name : #FASTTStatement }

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTStatement >> parentIfStatement [
	"Relation named: #parentIfStatement type: #FASTFortranIfLogicalStatement opposite: #statement"

	<generated>
	<FMComment: 'Parent if statement'>
	<container>
	<derived>
	<FMProperty: #parentIfStatement type: #FASTFortranIfLogicalStatement opposite: #statement>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentIfStatement ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTStatement >> parentIfStatement: anObject [

	<generated>
	(self attributeAt: #parentIfStatement ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentIfStatement.
		self attributeAt: #parentIfStatement put: anObject.
		otherSide statement: nil ]
	ifNotNil: [ 
		self attributeAt: #parentIfStatement put: anObject.
		anObject statement: self ]
]
