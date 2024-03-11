Class {
	#name : #FASTFortranSSAVisitor,
	#superclass : #FASTFortranVisitor,
	#instVars : [
		'variableVersions'
	],
	#category : #'FAST-Fortran-Analyses-SSA'
}

{ #category : #visiting }
FASTFortranSSAVisitor class >> visit: anAST [

	^self new
		visit: anAST 
]

{ #category : #'private - ssa' }
FASTFortranSSAVisitor >> createVariableVersion: aFASTFortranVariable [

	| ssaVersion |
	ssaVersion := FASTFortranSSAVariableVersion for: aFASTFortranVariable.
	aFASTFortranVariable localDeclaration activeVersion: ssaVersion.
	
	variableVersions add: aFASTFortranVariable localDeclaration.

	^ssaVersion 
]

{ #category : #'private - ssa' }
FASTFortranSSAVisitor >> threeWaysPhiVersions: preVersions branch1: branch1 branch2: branch2 [
	"compares the current versions of variables (in #branch1 and branch2) with the one that were
	 before the conditional statement (#preVersion)
	 If there is a difference, conditional created a new version and we need to create a
	 phi function joining the versin before (it may not exist) with the new version"

	| only1 only2 |
	
	only1 := self variableVersionsIn: branch1 notIn: branch2.
	only2 := self variableVersionsIn: branch2 notIn: branch1.

	self twoWaysPhiVersions: preVersions  branch: only1.
	self twoWaysPhiVersions: preVersions  branch: only2.

	self twoWaysPhiVersions: (branch1 difference: only1) branch: (branch2 difference: only2)
]

{ #category : #'private - ssa' }
FASTFortranSSAVisitor >> twoWaysPhiVersions: preVersions branch: branch [
	"compares the current versions of variables (in #variableVersions) with the one that were
	 before (the conditional statement)
	 If there is a difference, conditional created a new version and we need to create a
	 phi function joining the versin before (it may not exist) with the new version"
	| phi |

	branch do: [ :newVersion |
		(preVersions includes: newVersion) 
			ifFalse: [
				phi := FASTFortranSSAVariablePhiVersion for:
					(preVersions
						detect: [ :previousVersion | previousVersion sameVariableAs: newVersion ]
						ifOne: [ :previousVersion | { previousVersion . newVersion } ]
						ifNone: [ { newVersion } ]).

				newVersion localDeclaration activeVersion: phi]
	]
]

{ #category : #'private - ssa' }
FASTFortranSSAVisitor >> useVariableVersion: aFASTFortranVariable [

	^aFASTFortranVariable localDeclaration activeVersion
		ifNil: [ self createVariableVersion: aFASTFortranVariable ]

]

{ #category : #'private - ssa' }
FASTFortranSSAVisitor >> variableVersionsIn: versions1 notIn: versions2 [

	^versions1 select: [ :v1 |
		versions2 noneSatisfy: [ :v2 |
			v1 sameVariableAs: v2
		]
	]
]

{ #category : #api }
FASTFortranSSAVisitor >> visit: anAST [

	| copy |
	copy := FASTFortranCopyVisitor visit: anAST.
	FASTFortranLocalResolverVisitor new on: copy.

	variableVersions := Set new.
	
	copy accept: self.

	^copy
]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [

	^self visitFASTFortranVariable: aFASTFortranArrayVariable
]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement [

	self flag: 'DoWhile not correctly modelled yet'.
	^self shouldBeImplemented

]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [
	"For conditional statements, we record the variableVersions before the conditional and compare
	 them to versions after the conditional.
	 If there is a difference, we create phiVersions for them after the statement"

	| preVersions afterThen afterElse |

	aFASTFortranIfBlockStatement condition accept: self.

	preVersions := variableVersions collect: #activeVersion.
	aFASTFortranIfBlockStatement thenStatementBlock accept: self.
	afterThen := variableVersions collect: #activeVersion.

	aFASTFortranIfBlockStatement elseStatementBlock
		ifNotNil: [ :elseBlock |
			elseBlock accept: self.
			afterElse := variableVersions collect: #activeVersion]
		ifNil: [ afterElse := #() ].

	self threeWaysPhiVersions: preVersions branch1: afterThen branch2: afterElse.

]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [
	"For conditional statements, we record the variableVersions before the conditional and compare
	 them to versions after the conditional.
	 If there is a difference, we create phiVersions for them after the statement"

	| preVersions |
	aFASTFortranIfLogicalStatement condition accept: self.

	preVersions := variableVersions collect: #activeVersion.
	aFASTFortranIfLogicalStatement statement accept: self.

	self twoWaysPhiVersions: preVersions branch: (variableVersions collect: #activeVersion)
]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranLoopControlExpression: aFASTFortranLoopControlExpression [

	aFASTFortranLoopControlExpression init accept: self.
	aFASTFortranLoopControlExpression increment ifNotNil: [ :increment | increment accept: self ].
	aFASTFortranLoopControlExpression limit accept: self.
]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [

	^self visitFASTFortranVariable: aFASTFortranScalarVariable
]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [

	self visitFASTFortranTStatementBlock: aFASTFortranStatementBlock.

]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranTAssignment: aFASTFortranTAssignment [

	| fastVariable |
	fastVariable := aFASTFortranTAssignment variable.
	fastVariable ssaVersion:
		(self createVariableVersion: fastVariable).

	aFASTFortranTAssignment expression accept: self
]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranVariable: aFASTFortranVariable [

	aFASTFortranVariable ssaVersion: (self useVariableVersion: aFASTFortranVariable)
]
