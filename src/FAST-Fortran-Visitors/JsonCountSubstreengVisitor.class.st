Class {
	#name : 'JsonCountSubstreengVisitor',
	#superclass : 'FASTFortranJsonVisitor',
	#category : 'FAST-Fortran-Visitors-Visitor',
	#package : 'FAST-Fortran-Visitors',
	#tag : 'Visitor'
}

{ #category : 'visiting reflectivity' }
JsonCountSubstreengVisitor >> visitJsonArray: aCollection [
	^aCollection sum: [ :each | self visitJsonElement: each ]
]

{ #category : 'visiting reflectivity' }
JsonCountSubstreengVisitor >> visitJsonElement: aNode [

	aNode ifNil: [ ^ 0  ].
	aNode isDictionary  ifTrue: [ ^self visitJsonMap: aNode ].
	aNode isArray  ifTrue: [ ^self visitJsonArray: aNode ].
]

{ #category : 'visiting reflectivity' }
JsonCountSubstreengVisitor >> visitJsonMap: jsonDictionary [
	"If dicionary contains key 'tag', performs a visit of the whole node for this tag,
	otherwise, perform a visit of each value for their key
	'anno' key always ignored"
	| sum |
	

	^ jsonDictionary sum: [ :elem |
		self visitJsonElement: elem.
		 ]
]

{ #category : 'visiting prog-unit' }
JsonCountSubstreengVisitor >> visitProgramFile: aProgramFileNode [
	^ 1 + (self visitProgram_units: (aProgramFileNode at: 'program_units'))
]

{ #category : 'visiting prog-unit' }
JsonCountSubstreengVisitor >> visitProgram_units: aNode [
1 halt.
	^ 1 + (self visitJsonArray: aNode)
]
