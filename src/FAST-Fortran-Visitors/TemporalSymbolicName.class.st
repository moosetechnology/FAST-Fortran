Class {
	#name : #TemporalSymbolicName,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'FAST-Fortran-Visitors-Helpers'
}

{ #category : #converting }
TemporalSymbolicName >> asArraVariable: visitor [

	^ (visitor
		   newEntity: FASTFortranArrayVariable
		   withPosition: data)
		  name: (data at: 'name');
		  yourself
]

{ #category : #converting }
TemporalSymbolicName >> asCharacterLiteral: visitor [

	^ (visitor
		   newEntity: FASTFortranCharacterLiteral
		   withPosition: data)
		  primitiveValue: (data at: 'name');
		  yourself
]

{ #category : #converting }
TemporalSymbolicName >> asScalarVariable: visitor [

	^ (visitor
		   newEntity: FASTFortranScalarVariable
		   withPosition: data)
		  name: (data at: 'name');
		  yourself
]

{ #category : #converting }
TemporalSymbolicName >> asString [

	^ self name
]

{ #category : #converting }
TemporalSymbolicName >> asVariable: visitor [

	^ (visitor
		   newEntity: FASTFortranVariable 
		   withPosition: data) name: (data at: 'name')
]

{ #category : #accessing }
TemporalSymbolicName >> data [

	^ data
]

{ #category : #accessing }
TemporalSymbolicName >> data: anObject [

	data := anObject
]

{ #category : #accessing }
TemporalSymbolicName >> endPos [ 
	
	^ self data at: 'end_pos'
]

{ #category : #accessing }
TemporalSymbolicName >> name [ 
	
	^ self data at: 'name'
]

{ #category : #accessing }
TemporalSymbolicName >> startPos [ 
	
	^ self data at: 'start_pos'
]
