Class {
	#name : #FASTFortranImporter,
	#superclass : #Object,
	#category : 'FAST-Fortran-Visitors-Importer'
}

{ #category : #'as yet unclassified' }
FASTFortranImporter class >> onFile: fileName [

	^self new
		onFile: fileName
]

{ #category : #'as yet unclassified' }
FASTFortranImporter class >> onSourceString: aString [

	^self new
		onSourceString: aString
]

{ #category : #running }
FASTFortranImporter >> jsonASTToFAST: jsonAST fromFortranSource: fortranCode [

	| visitor |
	visitor := FASTFortranJsonVisitor new.
	visitor initLineSizes: fortranCode.
	visitor visitProgramFile: (NeoJSONReader fromString: jsonAST).
	^visitor model
]

{ #category : #api }
FASTFortranImporter >> onFile: srcFileName [

	| jsonFileReference cmdReturn |
	
	jsonFileReference  := self tempJsonFileNameFrom: srcFileName.

	cmdReturn := FortranProjectImporter new
		parseFortran77File: srcFileName asFileReference
		to: jsonFileReference.


	(cmdReturn = 0) ifTrue: [
		^self
			jsonASTToFAST: jsonFileReference asFileReference contents
			fromFortranSource: srcFileName asFileReference contents
	].

	^''
]

{ #category : #api }
FASTFortranImporter >> onSourceString: aString [

	| srcFile |
	srcFile  := self tempSourcefileName asFileReference ensureDelete.

	srcFile writeStreamDo: [ :stream | 
		stream << (self reformatFortranSource: aString) ].

	^self onFile: self tempSourcefileName
]

{ #category : #api }
FASTFortranImporter >> reformatFortranSource: aString [

	^((aString beginsWith: '      ')
		ifTrue: [ aString ]
		ifFalse: [ '      ' , aString  ]
	) withUnixLineEndings
]

{ #category : #api }
FASTFortranImporter >> tempJsonFileNameFrom: srcFileName [

	| jsonFileName |

	jsonFileName := srcFileName asFileReference
		withExtension: 'json'.

	^jsonFileName asFileReference
		ensureDelete ;
		yourself
]

{ #category : #accessing }
FASTFortranImporter >> tempSourcefileName [

	^'./srcCode.f'
]
