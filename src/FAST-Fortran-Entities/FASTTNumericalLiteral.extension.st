Extension { #name : #FASTTNumericalLiteral }

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTNumericalLiteral >> parentTypeSize [
	"Relation named: #parentTypeSize type: #FASTFortranType opposite: #size"

	<generated>
	<container>
	<derived>
	<FMProperty: #parentTypeSize type: #FASTFortranType opposite: #size>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentTypeSize ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTNumericalLiteral >> parentTypeSize: anObject [

	<generated>
	(self attributeAt: #parentTypeSize ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentTypeSize.
		self attributeAt: #parentTypeSize put: anObject.
		otherSide size: nil ]
	ifNotNil: [ 
		self attributeAt: #parentTypeSize put: anObject.
		anObject size: self ]
]
