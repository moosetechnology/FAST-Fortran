Class {
	#name : 'FASTEsopeGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'dimensionSize',
		'variable',
		'qualifiedAttribute'
	],
	#category : 'FAST-Fortran-Generator',
	#package : 'FAST-Fortran-Generator'
}

{ #category : 'accessing' }
FASTEsopeGenerator class >> packageName [

	^ #'FAST-Esope-Entities'
]

{ #category : 'accessing' }
FASTEsopeGenerator class >> prefix [

	^ #FASTEsope
]

{ #category : 'accessing' }
FASTEsopeGenerator class >> submetamodels [

	^ { FASTMetamodelGenerator . FASTFortranGenerator }
]

{ #category : 'definition' }
FASTEsopeGenerator >> defineClasses [

	qualifiedAttribute := self newClassNamed: #QualifiedAttribute comment: 'Dotted notation for accessing an attribute in a pointer'.
	dimensionSize := self newClassNamed: #DimensionSize comment: 'Esope expression to get the size of an array''s dimension: arr(/1)'.
	variable := self remoteEntity: #Variable withPrefix: #FASTFortran
]

{ #category : 'definition' }
FASTEsopeGenerator >> defineHierarchy [

	super defineHierarchy.

	qualifiedAttribute --|> variable
]

{ #category : 'definition' }
FASTEsopeGenerator >> defineProperties [

	super defineProperties.

	(dimensionSize property: #dimenssion type: #Number) comment:
		'The dimension (/1, /2, ...)'.

]

{ #category : 'definition' }
FASTEsopeGenerator >> defineRelations [

	super defineRelations.

	((qualifiedAttribute property: #qualifier) comment: 'The pointer before the dot: ptr.attribute')
	<>- ((variable property: #memberAttribute) comment:
			 'The attribute within the pointed structure').

]
