"
a Fortran Loop Control Expression

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentLoop` | `FASTFortranLoopControlExpression` | `loopControl` | `FASTFortranTWithLoopControl` | Parent loop|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `increment` | `FASTFortranLoopControlExpression` | `parentLoopControlIncrement` | `FASTTExpression` | Loop control increment value|
| `init` | `FASTFortranLoopControlExpression` | `parentLoopControlInitialization` | `FASTFortranAssignmentExpression` | initial assignment|
| `limit` | `FASTFortranLoopControlExpression` | `parentLoopControlLimit` | `FASTTExpression` | Loop control limit value|



"
Class {
	#name : #FASTFortranLoopControlExpression,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#parentLoop => FMOne type: #FASTFortranTWithLoopControl opposite: #loopControl',
		'#init => FMOne type: #FASTFortranAssignmentExpression opposite: #parentLoopControlInitialization'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranLoopControlExpression class >> annotation [

	<FMClass: #LoopControlExpression super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> increment [
	"Relation named: #increment type: #FASTTExpression opposite: #parentLoopControlIncrement"

	<generated>
	<FMComment: 'Loop control increment value'>
	<FMProperty: #increment type: #FASTTExpression opposite: #parentLoopControlIncrement>
	^ self attributeAt: #increment ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> increment: anObject [

	<generated>
	(self attributeAt: #increment ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self increment.
		self attributeAt: #increment put: anObject.
		otherSide parentLoopControlIncrement: nil ]
	ifNotNil: [ 
		self attributeAt: #increment put: anObject.
		anObject parentLoopControlIncrement: self ]
]

{ #category : #navigation }
FASTFortranLoopControlExpression >> incrementGroup [
	<generated>
	<navigation: 'Increment'>
	^ MooseSpecializedGroup with: self increment
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> init [
	"Relation named: #init type: #FASTFortranAssignmentExpression opposite: #parentLoopControlInitialization"

	<generated>
	<FMComment: 'initial assignment'>
	^ init
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> init: anObject [

	<generated>
	init := anObject
]

{ #category : #navigation }
FASTFortranLoopControlExpression >> initGroup [
	<generated>
	<navigation: 'Init'>
	^ MooseSpecializedGroup with: self init
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> limit [
	"Relation named: #limit type: #FASTTExpression opposite: #parentLoopControlLimit"

	<generated>
	<FMComment: 'Loop control limit value'>
	<FMProperty: #limit type: #FASTTExpression opposite: #parentLoopControlLimit>
	^ self attributeAt: #limit ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> limit: anObject [

	<generated>
	(self attributeAt: #limit ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self limit.
		self attributeAt: #limit put: anObject.
		otherSide parentLoopControlLimit: nil ]
	ifNotNil: [ 
		self attributeAt: #limit put: anObject.
		anObject parentLoopControlLimit: self ]
]

{ #category : #navigation }
FASTFortranLoopControlExpression >> limitGroup [
	<generated>
	<navigation: 'Limit'>
	^ MooseSpecializedGroup with: self limit
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> parentLoop [
	"Relation named: #parentLoop type: #FASTFortranTWithLoopControl opposite: #loopControl"

	<generated>
	<FMComment: 'Parent loop'>
	<container>
	<derived>
	^ parentLoop
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> parentLoop: anObject [

	<generated>
	parentLoop := anObject
]

{ #category : #navigation }
FASTFortranLoopControlExpression >> parentLoopGroup [
	<generated>
	<navigation: 'ParentLoop'>
	^ MooseSpecializedGroup with: self parentLoop
]
