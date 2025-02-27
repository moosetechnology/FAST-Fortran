"
Creates a Roassal visualization of a CFG
"
Class {
	#name : 'FASTFortranCFGVisualization',
	#superclass : 'Object',
	#instVars : [
		'canvas'
	],
	#category : 'FAST-Fortran-Analyses-CFG',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'CFG'
}

{ #category : 'instance creation' }
FASTFortranCFGVisualization class >> on: aFASTFortranCFGVisitor [

	^self new
		openOn: aFASTFortranCFGVisitor
]

{ #category : 'instance creation' }
FASTFortranCFGVisualization class >> onFilename: aFilename [

	^self new
		openOnFilename: aFilename 
]

{ #category : 'instance creation' }
FASTFortranCFGVisualization >> attachLineText: lineShape [

	lineShape model key nextBlockForValues do: [ :valueNextBlock || label |
		(valueNextBlock value = lineShape model value)
			ifTrue: [
				label := RSLabel new text: valueNextBlock key asString.
				RSLocation new center ; stick: label on: lineShape.
				canvas add: label
			]
	]
	
]

{ #category : 'instance creation' }
FASTFortranCFGVisualization >> basicBlockShape: aBasicBlock [

	| shape |
	shape := aBasicBlock isStart
		         ifTrue: [
			         aBasicBlock isFinal
				         ifTrue: [ self startAndFinalBlockShape ]
				         ifFalse: [ self startBlockShape ] ]
		         ifFalse: [
			         aBasicBlock isFinal
				         ifTrue: [ self finalBlockShape ]
				         ifFalse: [ self normalBlockShape ] ].
	aBasicBlock isConditional ifTrue: [
		shape color: self conditionalBlockColor ].
	^ shape
]

{ #category : 'instance creation' }
FASTFortranCFGVisualization >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: canvas.
	legend onDemand.
	legend title: 'Legend'.
	legend text: 'Start block' withShape: self startBlockShape.
	legend text: 'Final block' withShape: self finalBlockShape.
	legend text: 'start & final block' withShape: self startAndFinalBlockShape.
	legend text: 'Normal block' withShape: self normalBlockShape.
	legend text: 'Conditional block' withShape: (self normalBlockShape color: self conditionalBlockColor).
	legend build
]

{ #category : 'instance creation' }
FASTFortranCFGVisualization >> buildLines: shapes [

	| marker bldr |
	marker := RSArrowedLine new defaultHead.

	bldr := RSLineBuilder arrowedLine.
	bldr
		verticalBezier ;  "Bezier lines"
		markerEnd: marker ;  "Bezier lines"
		withBorderAttachPoint;
		shapes: shapes;
		canvas: canvas;
		connectToAll: [ :block | block nextBlocks ].
	
	bldr shape markerMid: (RSLabel new text: 'true').

	canvas lines do: [ :lineModel |
		lineModel model key isConditional
		ifTrue: [ self attachLineText: lineModel ] ]
]

{ #category : 'accessing - shapes' }
FASTFortranCFGVisualization >> conditionalBlockColor [
	^Color blue
]

{ #category : 'accessing - shapes' }
FASTFortranCFGVisualization >> finalBlockShape [

	^RSEllipse new
		radius: 10 ;
		color: Color transparent ;
		border: (RSBorder new
			width: 4 ;
			color: Color black ;
			yourself) ;
		yourself
]

{ #category : 'accessing - shapes' }
FASTFortranCFGVisualization >> normalBlockShape [

	^RSBox new
		size: 20 ;
		yourself
]

{ #category : 'instance creation' }
FASTFortranCFGVisualization >> openOn: aFASTFortranCFGVisitor [

	| shapes |
	canvas := RSCanvas new.
	shapes := aFASTFortranCFGVisitor basicBlocks collect: [ :bb | self shapeFor: bb ].

	self buildLines: shapes.

	canvas addAll: shapes.
	[RSTreeLayout on: shapes] valueWithin: 5 seconds onTimeout: [ self inform: 'Tree layout computation takes too long. Aborted' ].

	self buildLegend.

	canvas @ RSCanvasController new noLegend.

	^ canvas
]

{ #category : 'instance creation' }
FASTFortranCFGVisualization >> openOnFilename: aFilename [

	^self openOn: (((aFilename asFileReference
		readStreamEncoded: 'iso-8859-1'
		do: [ :st | FortranProjectImporter new getFASTFor: st contents ]) first)
			accept: FASTFortranCFGVisitor new)
]

{ #category : 'instance creation' }
FASTFortranCFGVisualization >> shapeFor: aBasicBlock [

	| shape |
	shape := self basicBlockShape: aBasicBlock.

	shape model: aBasicBlock.
	shape @ (RSPopup text: [ :block | block sourceCode ]).
	shape @ RSDraggable.

	^ shape
]

{ #category : 'accessing - shapes' }
FASTFortranCFGVisualization >> startAndFinalBlockShape [

	^RSComposite new
		add: self finalBlockShape ;
		add: (RSEllipse new
			radius: 5;
			color: Color black;
			yourself) ;
		adjustToChildren ;
		yourself

]

{ #category : 'accessing - shapes' }
FASTFortranCFGVisualization >> startBlockShape [

	^RSEllipse new
		radius: 10;
		color: Color black;
		yourself
]
