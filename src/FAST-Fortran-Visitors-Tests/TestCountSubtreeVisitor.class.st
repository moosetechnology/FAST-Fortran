Class {
	#name : 'TestCountSubtreeVisitor',
	#superclass : 'TestCase',
	#instVars : [
		'visitor'
	],
	#category : 'FAST-Fortran-Visitors-Tests',
	#package : 'FAST-Fortran-Visitors-Tests'
}

{ #category : 'accessing' }
TestCountSubtreeVisitor >> initialize [ 

	visitor := CountSubtreeVisitor new.
]

{ #category : 'tests' }
TestCountSubtreeVisitor >> testSoubroutine [
"SUBROUTINE SIMPLESUBROUTINE( a, b)
 END"

	| fastModel result | 
	
	fastModel := FASTFortranImporter new onFile: '/Users/lsafina/Documents/Pharo/images/M13/test.json'.
	1 halt.
	result := visitor visit: fastModel entities. 
	self assert: result equals: 3
	
]
