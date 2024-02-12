"
A FASTFortranSSAVisitorTest is a test class for testing the behavior of FASTFortranSSAVisitor
"
Class {
	#name : #FASTFortranSSAVisitorTest,
	#superclass : #FASTFortranAbstractVisitorTest,
	#category : #'FAST-Fortran-Analyses-Tests-SSA'
}

{ #category : #running }
FASTFortranSSAVisitorTest >> newVisitor [

	^FASTFortranSSAVisitor new
]
