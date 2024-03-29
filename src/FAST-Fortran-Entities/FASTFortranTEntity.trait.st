"
any entity

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTEntity,
	#instVars : [
		'#endPos => FMProperty',
		'#startPos => FMProperty'
	],
	#traits : 'FASTTEntity + TEntityMetaLevelDependency',
	#classTraits : 'FASTTEntity classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTEntity classSide >> annotation [

	<FMClass: #TEntity super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTEntity >> endPos [

	<FMProperty: #endPos type: #Number>
	<generated>
	^ endPos
]

{ #category : #accessing }
FASTFortranTEntity >> endPos: anObject [
	<generated>
	endPos := anObject
]

{ #category : #accessing }
FASTFortranTEntity >> startPos [

	<FMProperty: #startPos type: #Number>
	<generated>
	^ startPos
]

{ #category : #accessing }
FASTFortranTEntity >> startPos: anObject [
	<generated>
	startPos := anObject
]
