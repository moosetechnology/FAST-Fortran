"
FASTComment represents one instance of a comment (in the sense of programming language comments) for any FAST sourced entity. The commented sourced entity is called the container in the FAST model.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `container` | `FASTFortranTComment` | `comments` | `FASTFortranTWithComments` | Source code entity containing the comment|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `content` | `String` | nil | Content of the comment as a String|

"
Trait {
	#name : #FASTFortranTComment,
	#instVars : [
		'#content => FMProperty',
		'#container => FMOne type: #FASTFortranTWithComments opposite: #comments'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTComment classSide >> annotation [

	<FMClass: #TComment super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTComment >> container [
	"Relation named: #container type: #FASTFortranTWithComments opposite: #comments"

	<generated>
	<FMComment: 'Source code entity containing the comment'>
	<container>
	^ container
]

{ #category : #accessing }
FASTFortranTComment >> container: anObject [

	<generated>
	container := anObject
]

{ #category : #navigation }
FASTFortranTComment >> containerGroup [
	<generated>
	<navigation: 'Container'>
	^ MooseSpecializedGroup with: self container
]

{ #category : #accessing }
FASTFortranTComment >> content [

	<FMProperty: #content type: #String>
	<generated>
	<FMComment: 'Content of the comment as a String'>
	^ content
]

{ #category : #accessing }
FASTFortranTComment >> content: anObject [
	<generated>
	content := anObject
]
