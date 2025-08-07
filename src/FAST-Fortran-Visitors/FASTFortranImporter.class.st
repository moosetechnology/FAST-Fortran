Class {
	#name : 'FASTFortranImporter',
	#superclass : 'Object',
	#category : 'FAST-Fortran-Visitors-Importer',
	#package : 'FAST-Fortran-Visitors',
	#tag : 'Importer'
}

{ #category : 'api' }
FASTFortranImporter class >> onFile: fileName [

	^self new
		onFile: fileName
]

{ #category : 'api' }
FASTFortranImporter class >> onSourceString: aString [

	^self new
		onSourceString: aString
]

{ #category : 'running' }
FASTFortranImporter >> jsonASTToFAST: jsonAST fromFortranSource: fortranCode [

	| visitor |
	visitor := self jsonVisitor.
	visitor initLineSizes: fortranCode.
	
	visitor visitProgramFile: (NeoJSONReader fromString: jsonAST).
	^visitor model
]

{ #category : 'running' }
FASTFortranImporter >> jsonVisitor [

	^FASTFortranJsonVisitor new
]

{ #category : 'api' }
FASTFortranImporter >> onFile: srcFileName [

	| jsonFileReference cmdReturn |

	self flag: '#FIXME: includedFile are special, they are not in a program unit, 
		so for the parser to be able to parse them
		we need to wrap them in a fake subroutine, 
		we can also change the sourceAnchor to avoid deleting part of the source.
		can be related to this method: "IASTToFamixFortranVisitor >> visitIASTIncludedFile:"
		'.

	"jsonFileReference  := self tempJsonFileNameFrom: srcFileName.
	
	cmdReturn := FamixFortranImporter new
		parseFortran77File: srcFileName asFileReference
		to: jsonFileReference."

 cmdReturn := 0.
 jsonFileReference  := srcFileName asFileReference.

	(cmdReturn = 0) ifTrue: [
		^self
			jsonASTToFAST: jsonFileReference asFileReference contents
			fromFortranSource: srcFileName asFileReference contents
	].

	^''
]

{ #category : 'api' }
FASTFortranImporter >> onSourceString: aString [

	| srcFile |
	srcFile  := self tempSourcefileName asFileReference ensureDelete.

	srcFile writeStreamDo: [ :stream | 
		stream << (self reformatFortranSource: aString) ].

	^self onFile: self tempSourcefileName
]

{ #category : 'api' }
FASTFortranImporter >> reformatFortranSource: aString [

	^((aString beginsWith: '      ')
		ifTrue: [ aString ]
		ifFalse: [ '      ' , aString  ]
	) withUnixLineEndings
]

{ #category : 'api' }
FASTFortranImporter >> tempJsonFileNameFrom: srcFileName [

	| jsonFileName |

	jsonFileName := srcFileName asFileReference
		withExtension: 'json'.

	^jsonFileName asFileReference
		ensureDelete ;
		yourself
]

{ #category : 'accessing' }
FASTFortranImporter >> tempSourcefileName [

	^'./srcCode.f'
]
