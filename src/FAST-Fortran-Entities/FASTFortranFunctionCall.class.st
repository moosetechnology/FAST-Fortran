"
I represent a call to a function (or function statement)

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTFortranTWithArguments` | `argumentOwner` | `FASTFortranTExpression` | My arguments|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Name of called function|

"
Class {
	#name : #FASTFortranFunctionCall,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTWithArguments',
	#classTraits : 'FASTFortranTWithArguments classTrait',
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranFunctionCall class >> annotation [

	<FMClass: #FunctionCall super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranFunctionCall >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Name of called function'>
	^ name
]

{ #category : #accessing }
FASTFortranFunctionCall >> name: anObject [
	<generated>
	name := anObject
]
