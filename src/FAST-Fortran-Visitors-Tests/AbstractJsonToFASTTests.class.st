Class {
	#name : #AbstractJsonToFASTTests,
	#superclass : #TestCase,
	#instVars : [
		'fortranCode',
		'jsonCode',
		'visitor'
	],
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #running }
AbstractJsonToFASTTests >> jsonVisitor [
	self subclassResponsibility 
]

{ #category : #running }
AbstractJsonToFASTTests >> visitJsonCode [

	visitor := self jsonVisitor new.
	visitor initLineSizes: fortranCode.
	^ visitor onFile: (NeoJSONReader fromString: jsonCode)
]
