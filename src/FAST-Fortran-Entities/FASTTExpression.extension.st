Extension { #name : 'FASTTExpression' }

{ #category : '*FAST-Fortran-Entities-accessing' }
FASTTExpression >> ioSpecifier [
	"Relation named: #ioSpecifier type: #FASTFortranIOParameter opposite: #expression"

	<generated>
	<FMComment: 'name of the parameter (keyword argument)'>
	<container>
	<derived>
	<FMProperty: #ioSpecifier type: #FASTFortranIOParameter opposite: #expression>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #ioSpecifier ifAbsent: [ nil ]
]

{ #category : '*FAST-Fortran-Entities-accessing' }
FASTTExpression >> ioSpecifier: anObject [

	<generated>
	(self attributeAt: #ioSpecifier ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ioSpecifier.
		self attributeAt: #ioSpecifier put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #ioSpecifier put: anObject.
		anObject expression: self ]
]
