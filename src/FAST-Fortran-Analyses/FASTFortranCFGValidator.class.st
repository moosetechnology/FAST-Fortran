"
Calls `FASTFortranCFGChecker` on all Fortran files in a directory and reports errors
"
Class {
	#name : 'FASTFortranCFGValidator',
	#superclass : 'FASTAbstractValidator',
	#instVars : [
		'importer'
	],
	#category : 'FAST-Fortran-Analyses-CFG',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'CFG'
}

{ #category : 'utilities' }
FASTFortranCFGValidator >> getASTFromString: string [
	^(importer getFASTFor: string) first
]

{ #category : 'initialization' }
FASTFortranCFGValidator >> initialize [

	super initialize.

	importer := FamixFortranImporter new
]

{ #category : 'testing' }
FASTFortranCFGValidator >> isSourceFile: aFileReference [
	"for lack of a better idea"

	^ #(f F FOR) includes: aFileReference extension
]

{ #category : 'testing' }
FASTFortranCFGValidator >> runOnSourceFile: aFileReference [

	| ast |
	aFileReference fullName traceCr.

	ast := 
		[
			self getASTFromFileReference: aFileReference.
		]
		on: Error
		do: [
			'  ** NOT PARSEABLE **' traceCr.
			nil
		].

	ast ifNotNil: [
		(FASTFortranCFGChecker on: (ast accept: FASTFortranCFGVisitor new))
			ifNotEmpty: [ '  ** Found dead blocks **' traceCr ]
	].
]
