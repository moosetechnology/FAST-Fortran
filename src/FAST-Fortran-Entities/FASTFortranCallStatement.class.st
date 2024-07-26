"
I represent Fortran Call statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Name of called entity (a subroutine)|

"
Class {
	#name : 'FASTFortranCallStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTTWithArguments',
	#classTraits : 'FASTTWithArguments classTrait',
	#instVars : [
		'#name => FMProperty'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranCallStatement class >> annotation [

	<FMClass: #CallStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranCallStatement >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Name of called entity (a subroutine)'>
	^ name
]

{ #category : 'accessing' }
FASTFortranCallStatement >> name: anObject [
	<generated>
	name := anObject
]
