Class {
	#name : #FASTFortranDataStatementConstant,
	#superclass : #FASTFortranAbstractExpression,
	#instVars : [
		'occurrence',
		'constant'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #accessing }
FASTFortranDataStatementConstant >> constant [

	^ constant
]

{ #category : #accessing }
FASTFortranDataStatementConstant >> constant: anObject [

	constant := anObject
]

{ #category : #accessing }
FASTFortranDataStatementConstant >> occurrence [

	^ occurrence
]

{ #category : #accessing }
FASTFortranDataStatementConstant >> occurrence: anObject [

	occurrence := anObject
]
