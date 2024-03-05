Class {
	#name : #FASTFortranSSAVisitorHelpersTest,
	#superclass : #TestCase,
	#instVars : [
		'variables',
		'branchAB',
		'branchBC',
		'visitor'
	],
	#category : #'FAST-Fortran-Analyses-Tests-SSA'
}

{ #category : #running }
FASTFortranSSAVisitorHelpersTest >> makeVariable: aName [

	^FASTFortranVariable new
		name: aName ;
		localDeclaration: (FASTFortranVariableDeclarator new variable: aName) ;
		yourself
]

{ #category : #running }
FASTFortranSSAVisitorHelpersTest >> setUp [
	super setUp.

	visitor := FASTFortranSSAVisitor new.

	variables := {
		self makeVariable: 'varA'.
		self makeVariable: 'varB'.
		self makeVariable: 'varC'.
	}.

	branchAB := {
		FASTFortranSSAVariableVersion for: variables first .
		FASTFortranSSAVariableVersion for: variables second
	}.
	branchBC := {
		FASTFortranSSAVariableVersion for: variables second .
		FASTFortranSSAVariableVersion for: variables third
	}.

]

{ #category : #test }
FASTFortranSSAVisitorHelpersTest >> testVariableVersionsEmpty1 [

	self assert: (visitor variableVersionsIn: #() notIn: branchAB) size equals: 0
]

{ #category : #test }
FASTFortranSSAVisitorHelpersTest >> testVariableVersionsIn1Empty2 [

	self assert: (visitor variableVersionsIn: branchAB notIn: #()) size equals: 2.
	self assertCollection: (visitor variableVersionsIn: branchAB notIn: #()) equals: branchAB.
]

{ #category : #test }
FASTFortranSSAVisitorHelpersTest >> testVariableVersionsIn1NotIn2 [

	self assert: (visitor variableVersionsIn: branchAB notIn: branchBC) size equals: 1.
	self assert: (visitor variableVersionsIn: branchAB notIn: branchBC) anyOne name equals: 'varA_1'.
]

{ #category : #test }
FASTFortranSSAVisitorHelpersTest >> testVariableVersionsNotIn1In2 [

	self assert: (visitor variableVersionsIn: branchBC notIn: branchAB) size equals: 1.
	self assert: (visitor variableVersionsIn: branchBC notIn: branchAB) anyOne name equals: 'varC_1'.
]