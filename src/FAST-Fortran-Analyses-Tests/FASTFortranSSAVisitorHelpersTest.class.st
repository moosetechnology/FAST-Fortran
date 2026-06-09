Class {
	#name : 'FASTFortranSSAVisitorHelpersTest',
	#superclass : 'TestCase',
	#instVars : [
		'variables',
		'branchAB',
		'branchBC',
		'visitor'
	],
	#category : 'FAST-Fortran-Analyses-Tests-SSA',
	#package : 'FAST-Fortran-Analyses-Tests',
	#tag : 'SSA'
}

{ #category : 'running' }
FASTFortranSSAVisitorHelpersTest >> makeVariable: aName [

	^FASTFortranVariable new
		name: aName ;
		localDeclaration: (FASTFortranVariableDeclarator new name: aName) ;
		yourself
]

{ #category : 'running' }
FASTFortranSSAVisitorHelpersTest >> setUp [
	super setUp.

	visitor := FASTFortranSSAVisitor new.

	variables := {
		self makeVariable: 'varA'.
		self makeVariable: 'varB'.
		self makeVariable: 'varC'.
	}.

	branchAB := {
		FASTVariableVersionSSA for: variables first .
		FASTVariableVersionSSA for: variables second
	}.
	branchBC := {
		FASTVariableVersionSSA for: variables second .
		FASTVariableVersionSSA for: variables third
	}.

]

{ #category : 'test' }
FASTFortranSSAVisitorHelpersTest >> testAddChoiceToPhi [

	| phi |

	phi := FASTVariablePhiVersionSSA for: branchAB.

	self assert: phi choices size equals: 2.
	self assertCollection: phi choices equals: branchAB asOrderedCollection
]

{ #category : 'test' }
FASTFortranSSAVisitorHelpersTest >> testAddPhiChoiceToPhi [

	| phi |

	phi := FASTVariablePhiVersionSSA for: {
		branchAB first .
		FASTVariablePhiVersionSSA for: branchBC
	}.

	self assert: phi choices size equals: 3.
	self
		assertCollection: phi choices
		equals: (OrderedCollection
			with: branchAB first
			with: branchBC first
			with: branchBC second )
]

{ #category : 'test' }
FASTFortranSSAVisitorHelpersTest >> testVariableVersionsEmpty1 [

	self assert: (visitor variableVersionsIn: #() notIn: branchAB) size equals: 0
]

{ #category : 'test' }
FASTFortranSSAVisitorHelpersTest >> testVariableVersionsIn1Empty2 [

	self assert: (visitor variableVersionsIn: branchAB notIn: #()) size equals: 2.
	self assertCollection: (visitor variableVersionsIn: branchAB notIn: #()) equals: branchAB.
]

{ #category : 'test' }
FASTFortranSSAVisitorHelpersTest >> testVariableVersionsIn1NotIn2 [

	self assert: (visitor variableVersionsIn: branchAB notIn: branchBC) size equals: 1.
	self assert: (visitor variableVersionsIn: branchAB notIn: branchBC) anyOne name equals: 'varA_0'.
]

{ #category : 'test' }
FASTFortranSSAVisitorHelpersTest >> testVariableVersionsNotIn1In2 [

	self assert: (visitor variableVersionsIn: branchBC notIn: branchAB) size equals: 1.
	self assert: (visitor variableVersionsIn: branchBC notIn: branchAB) anyOne name equals: 'varC_0'.
]
