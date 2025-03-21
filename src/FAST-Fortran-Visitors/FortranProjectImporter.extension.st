Extension { #name : 'FortranProjectImporter' }

{ #category : '*FAST-Fortran-Visitors' }
FortranProjectImporter >> defaultFASTSource [

	^(self ensureEmptyFolder: self fastSrcFolder) / 'tmpFASTSource.E'.

]

{ #category : '*FAST-Fortran-Visitors' }
FortranProjectImporter >> fastSrcFolder [
	^'FastTmp' asFileReference 
]

{ #category : '*FAST-Fortran-Visitors' }
FortranProjectImporter >> getFASTFor: sourceCode [

	"Remove TAB at start of lines ???? "

	| fastSrcFile |

	fastSrcFile := self defaultFASTSource.
	fastSrcFile writeStreamDo: [:stream |
		stream
			<< sourceCode ;
			<< OSPlatform current lineEnding
	].
	self
		deEsopify:fastSrcFile
		from: self fastSrcFolder asFileReference
		to: self fastSrcFolder asFileReference.

	self
		parseFortran77: (fastSrcFile withExtension: 'f')
		from: self fastSrcFolder asFileReference
		to: self fastSrcFolder asFileReference.

	^FASTFortranJsonVisitor new visitProgramFile:
		  ((fastSrcFile withExtension: 'json') readStreamEncoded: self defaultFileEncoding do: [ :str | 
			   NeoJSONReader fromString: str contents ])
]

{ #category : '*FAST-Fortran-Visitors' }
FortranProjectImporter >> jsonASTToFAST [

	| jsonAST |

	jsonAST := self defaultFASTSource withExtension: 'json'.

	^FASTFortranJsonVisitor new visitProgramFile:
		  (jsonAST readStreamEncoded: self defaultFileEncoding do: [ :str | 
			   NeoJSONReader fromString: str contents ])
]
