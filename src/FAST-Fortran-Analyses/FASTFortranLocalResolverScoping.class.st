Class {
	#name : 'FASTFortranLocalResolverScoping',
	#superclass : 'FASTLocalResolverScoping',
	#category : 'FAST-Fortran-Analyses-Resolver',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'Resolver'
}

{ #category : 'private' }
FASTFortranLocalResolverScoping >> nonLocalDeclaration: name [
	"In Fortran a non declared identifier can be an implicit identifier"

	^ FASTFortranImplicitLocalDeclaration new
]

{ #category : 'api' }
FASTFortranLocalResolverScoping >> scopeAdd: aName declaration: aFASTNode [
	"overrides because there may be a parameter definition already registered as a declaration
	 if this is the case, removes it to add a real declaration"

	self currentScope
		at: aName
		ifPresent: [ :found |
			found isParameter
				ifTrue: [
					self substituteParameterDefinition: found named: aName by: aFASTNode
				]
				ifFalse: [ self duplicateDeclarationError: aName ] ]
		ifAbsent: [
			"declaring a normal variable"
			aFASTNode clearLocalUses.
			self currentScope at: aName put: aFASTNode
		].
	
]

{ #category : 'api' }
FASTFortranLocalResolverScoping >> scopeAddNonLocalDeclaration: name [
	"makes a non-local declaration kind of local by adding
	 a FASTNonLocalDeclaration into the top-most scope"

	| currentScope nonLocalDeclaration |
	currentScope := self popScope.
	scopes
		ifEmpty: [
			self pushScope: currentScope.
			nonLocalDeclaration := self nonLocalDeclaration: name.
			self scopeAdd: name declaration: nonLocalDeclaration ]
		ifNotEmpty: [
			nonLocalDeclaration := self scopeAddNonLocalDeclaration: name.
			self pushScope: currentScope ].
	^ nonLocalDeclaration
]

{ #category : 'api' }
FASTFortranLocalResolverScoping >> scopeAddParameterDefinition: name [
	"a bit like #scopeAddNonLocalDeclaration:
	 - does not need to search for the top-most scope, for parameters we are already in it
	 - a parameter definition is considered as a first use"

	| parameterDefinition |

	parameterDefinition := FASTFortranParameterLocalDefinition new name: name.
	self scopeAdd: name declaration: parameterDefinition.

	^ parameterDefinition
]

{ #category : 'private' }
FASTFortranLocalResolverScoping >> substituteParameterDefinition: found named: aName by: aFASTNode [

	aFASTNode clearLocalUses.
	self currentScope at: aName put: aFASTNode.
	self addUse: found firstUse toLocalDeclaration: aFASTNode
]
