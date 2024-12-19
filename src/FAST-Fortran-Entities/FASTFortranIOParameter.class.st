"
I represent a specifier keywords used in I/O statement (open, write, read, close, ...).

where the most common specifiers are:

```fortran
    [UNIT=]  u
    IOSTAT=  ios
    ERR=     err
    FILE=    fname
    STATUS=  sta
    ACCESS=  acc
    FORM=    frm
    RECL=    rl
```
	
	

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranAbstractIOStatement` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTFortranIOParameter` | `ioSpecifier` | `FASTTExpression` | value of the parameter (keyword argument)|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranIOParameter',
	#superclass : 'FASTFortranEntity',
	#traits : 'FASTFortranTIOParameter + FASTTNamedEntity',
	#classTraits : 'FASTFortranTIOParameter classTrait + FASTTNamedEntity classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranIOParameter class >> annotation [

	<FMClass: #IOParameter super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranIOParameter >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #ioSpecifier"

	<generated>
	<FMComment: 'value of the parameter (keyword argument)'>
	<FMProperty: #expression type: #FASTTExpression opposite: #ioSpecifier>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTFortranIOParameter >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide ioSpecifier: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject ioSpecifier: self ]
]

{ #category : 'navigation' }
FASTFortranIOParameter >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
