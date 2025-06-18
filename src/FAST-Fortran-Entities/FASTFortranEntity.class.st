"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranEntity',
	#superclass : 'MooseEntity',
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FASTFortranEntity class >> isAbstract [

	<generated>
	^ self == FASTFortranEntity
]

{ #category : 'meta' }
FASTFortranEntity class >> metamodel [

	<generated>
	^ FASTFortranModel metamodel
]

{ #category : 'testing' }
FASTFortranEntity >> isAssignment [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isBehaviouralEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isBinaryExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isBooleanLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isBreakableStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isCharacterLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isNumericalLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isQueryable [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isReturnStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isScopableEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isStatementBlock [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isUnaryExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTFortranEntity >> isVariableEntity [

	<generated>
	^ false
]
