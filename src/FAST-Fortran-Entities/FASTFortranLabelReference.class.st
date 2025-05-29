"
I represent a reference to a Fortran label, like in a GoTo statement.
I contain the value of the label referred to

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `referencer` | `FASTFortranLabelReference` | `labelReferences` | `FASTFortranTWithLabelReferences` | A statement (like goto) referencing this label|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `label` | `String` | nil | The value of the label. The value is an integer literal, stored in a String|

"
Class {
	#name : 'FASTFortranLabelReference',
	#superclass : 'FASTFortranEntity',
	#instVars : [
		'#label => FMProperty',
		'#referencer => FMOne type: #FASTFortranTWithLabelReferences opposite: #labelReferences'
	],
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranLabelReference class >> annotation [

	<FMClass: #LabelReference super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranLabelReference >> label [

	<FMProperty: #label type: #String>
	<generated>
	<FMComment: 'The value of the label. The value is an integer literal, stored in a String'>
	^ label
]

{ #category : 'accessing' }
FASTFortranLabelReference >> label: anObject [
	<generated>
	label := anObject
]

{ #category : 'accessing' }
FASTFortranLabelReference >> referencer [
	"Relation named: #referencer type: #FASTFortranTWithLabelReferences opposite: #labelReferences"

	<generated>
	<FMComment: 'A statement (like goto) referencing this label'>
	<container>
	^ referencer
]

{ #category : 'accessing' }
FASTFortranLabelReference >> referencer: anObject [

	<generated>
	referencer := anObject
]

{ #category : 'navigation' }
FASTFortranLabelReference >> referencerGroup [
	<generated>
	<navigation: 'Referencer'>
	^ MooseSpecializedGroup with: self referencer
]
