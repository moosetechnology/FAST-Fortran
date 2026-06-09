Class {
	#name : 'FASTFortranCFGCheckerTest',
	#superclass : 'TestCase',
	#instVars : [
		'cfg',
		'blocks',
		'builder'
	],
	#category : 'FAST-Fortran-Analyses-Tests-CFG',
	#package : 'FAST-Fortran-Analyses-Tests',
	#tag : 'CFG'
}

{ #category : 'running' }
FASTFortranCFGCheckerTest >> block: blockName [

	^blocks
		at: blockName
		ifAbsentPut: [ self newBlock: blockName ]
]

{ #category : 'running' }
FASTFortranCFGCheckerTest >> chain: block next: next [

	next isAssociation
		ifTrue: [ block nextBlock: (self block: next value) onValue: (next key)]
		ifFalse: [ block nextBlock: (self block: next)  ]
]

{ #category : 'running' }
FASTFortranCFGCheckerTest >> makeCFG: desc [

	desc do: [ :assoc |
		self chain: (self block: assoc key) next: (assoc value)
	]
]

{ #category : 'running' }
FASTFortranCFGCheckerTest >> newBlock: blockName [

	| block |
	block := builder newBasicBlock: ((blockName asString first asLowercase = $c)
		ifTrue: [ FASTConditionalBasicBlock ]
		ifFalse: [ FASTBasicBlock ]).
	
	(blockName asString first asLowercase = $s)
		ifTrue: [ block isStart: true ].

	^block
]

{ #category : 'running' }
FASTFortranCFGCheckerTest >> setUp [
	super setUp.

	builder := FASTFortranCFGBuilder new.
	cfg := FASTFortranCFGVisitor new.
	builder cfgVisitor: cfg.
	blocks := Dictionary new
]

{ #category : 'tests' }
FASTFortranCFGCheckerTest >> testCFGDeadBlock [

	| check |
	self makeCFG: { 
	#s1 -> #b2 .
	#b3 -> #b2 .
	
	}.

	check := FASTFortranCFGChecker on: builder.

	self assert: check size equals: 1.
	self assert: check anyOne equals: (blocks at: #b3).
]

{ #category : 'tests' }
FASTFortranCFGCheckerTest >> testCFGLinear [

	self makeCFG: { 
	#s1 -> #b2 .
	#b2 -> #b3 .
	#b3 -> #b4
	}.

	self assert: (FASTFortranCFGChecker on: builder) size equals: 0
]

{ #category : 'tests' }
FASTFortranCFGCheckerTest >> testCFGWithBranch [

	self makeCFG: { 
	#s1 -> #c2 .
	#c2 -> (true -> #b3) .
	#c2 -> (false -> #b4) .
	}.

	self assert: (FASTFortranCFGChecker on: builder) size equals: 0
]
