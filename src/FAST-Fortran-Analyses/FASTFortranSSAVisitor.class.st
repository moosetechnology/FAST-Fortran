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
FASTFortranSSAVisitor >> createPhiVersions: anteriorVersions [
	| phi |

	variableVersions do: [ :newVersion |
		phi := FASTFortranSSAVariablePhiVersion for:
			(anteriorVersions
				detect: [ :previousVersion | previousVersion sameVariableAs: newVersion ]
				ifOne: [ :previousVersion | {previousVersion . newVersion activeVersion} ]
				ifNone: [ {newVersion activeVersion} ]).

		newVersion localDeclaration activeVersion: phi
	]
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
FASTFortranSSAVisitor >> useVariableVersion: aFASTFortranVariable [

	^aFASTFortranVariable localDeclaration activeVersion

]

{ #category : #api }
FASTFortranSSAVisitor >> visit: anAST [

	| copy |
	copy := FASTFortranCopyVisitor visit: anAST.
	copy accept: FASTFortranLocalResolverVisitor new.

	variableVersions := Set new.
	
	copy accept: self.

	^copy
]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [

	^self visitFASTFortranVariable: aFASTFortranArrayVariable
]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement [
	| fastVariable |

	fastVariable := aFASTFortranAssignmentStatement variable.
	fastVariable ssaVersion: (self createVariableVersion: fastVariable).

	aFASTFortranAssignmentStatement expression accept: self.
]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [

	^super visitFASTFortranDoStatement: aFASTFortranDoStatement

]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement [

	^super visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement

]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [

	^super visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement

]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [
	"For IF statements, we record in variableVersions the SSAVariable created in the branches
	 These variable will produce a phiVersion after the statement"

	| anteriorVersions |

	anteriorVersions := variableVersions collect: #activeVersion.
	variableVersions := Set new.
	
	aFASTFortranIfLogicalStatement condition accept: self.
	aFASTFortranIfLogicalStatement statement accept: self.

	self createPhiVersions: anteriorVersions.

	anteriorVersions do: [ :ssaVersion |
		variableVersions add: ssaVersion localDeclaration ].

]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [

	^self visitFASTFortranVariable: aFASTFortranScalarVariable
]

{ #category : #'visiting - statements' }
FASTFortranSSAVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [

	self visitFASTFortranTStatementBlock: aFASTFortranStatementBlock.

]

{ #category : #'visiting - expressions' }
FASTFortranSSAVisitor >> visitFASTFortranVariable: aFASTFortranVariable [

	aFASTFortranVariable ssaVersion: (self useVariableVersion: aFASTFortranVariable)
]
