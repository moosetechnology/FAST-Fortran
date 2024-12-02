Extension { #name : 'FortranProjectImporter' }

{ #category : '*FAST-Fortran-Visitors' }
FortranProjectImporter >> defaultFASTSource [

	^(self ensureEmptyFolder: self fastSrcFolder) / 'tmpFASTSource.E'.

]

{ #category : '*FAST-Fortran-Visitors' }
FortranProjectImporter >> fastSrcFolder [
	^'FastTmp'
]

{ #category : '*FAST-Fortran-Visitors' }
FortranProjectImporter >> getFASTFor: sourceCode [

	"Remove TAB at state of lines ???? "

	| fastSrcFile |
	fastSrcFile := self defaultFASTSource.
	fastSrcFile writeStreamDo: [:stream |
		stream truncate.
		self preprocess: sourceCode to: stream.
		stream cr
	].
	
	self parseFortran77: fastSrcFile.
	^self jsonASTToFAST 
]

{ #category : '*FAST-Fortran-Visitors' }
FortranProjectImporter >> jsonASTToFAST [

	| jsonAST |

	jsonAST := self defaultFASTSource withExtension: 'json'.

	^FASTFortranJsonVisitor new visitProgramFile:
		  (jsonAST readStreamEncoded: self defaultFileEncoding do: [ :str | 
			   NeoJSONReader fromString: str contents ])
]
