Class {
	#name : 'FASTFortranArrayRangeVisitor',
	#superclass : 'FASTFortranModelTransformationVisitor',
	#category : 'FAST-Fortran-Visitors-Visitor',
	#package : 'FAST-Fortran-Visitors',
	#tag : 'Visitor'
}

{ #category : 'visiting' }
FASTFortranArrayRangeVisitor >> visitFASTFortranArrayRange: aFASTFortranArrayRange [

	^ aFASTFortranArrayRange upperBound accept: self
]

{ #category : 'visiting' }
FASTFortranArrayRangeVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [

	^ (aFASTFortranBinaryExpression leftOperand accept: self)
	  , aFASTFortranBinaryExpression operator
	  , (aFASTFortranBinaryExpression rightOperand accept: self)
]

{ #category : 'visiting' }
FASTFortranArrayRangeVisitor >> visitFASTFortranIntegerLiteral: aFASTFortranIntegerLiteral [

	^ aFASTFortranIntegerLiteral primitiveValue
]

{ #category : 'visiting' }
FASTFortranArrayRangeVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [

	^ aFASTFortranScalarVariable name
]
