Class {
	#name : 'FASTFortranDifferentialValidator',
	#superclass : 'FASTAbstractDifferentialValidator',
	#instVars : [
		'importer'
	],
	#category : 'FAST-Fortran-Visitors-Tools',
	#package : 'FAST-Fortran-Visitors',
	#tag : 'Tools'
}

{ #category : 'accessing' }
FASTFortranDifferentialValidator >> comparatorClass [

	^FASTFortranModelComparator 
]

{ #category : 'utilities' }
FASTFortranDifferentialValidator >> getASTFromString: string [
	^importer getFASTFor: string
]

{ #category : 'utilities' }
FASTFortranDifferentialValidator >> getTopLevelNodes: model [
	"the model is actually a collection of AST (and their should be only one actually)"

	^model
]

{ #category : 'initialization' }
FASTFortranDifferentialValidator >> initialize [

	super initialize.

	importer := FortranProjectImporter new
]

{ #category : 'testing' }
FASTFortranDifferentialValidator >> isSourceFile: aFileReference [
	"for lack of a better idea"

	^ #(f F FOR) includes: aFileReference extension
]

{ #category : 'utilities' }
FASTFortranDifferentialValidator >> reExportAST: ast [
	"Note: need to convert cr -> lf because importer uses NeoJson that does not like cr"
	| visitor |
	visitor := FASTFortranExporterVisitor new.

	ast accept: visitor.
	^visitor outputStream contents replaceAllRegex: String cr with: String lf
]
