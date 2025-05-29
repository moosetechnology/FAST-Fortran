"
I represent Fortran If (Arithmetic) statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBranchStatement` | `FASTTStatement` | `branches` | `FASTTBranchStatement` | My parent BranchStatement (of which I am a branch)|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `branches` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTStatement` | The various children branches of this BranchStatement|
| `expression` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTExpression` | The expression commanding which branch is executed|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranIfArithmeticStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTTBranchStatement',
	#classTraits : 'FASTTBranchStatement classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranIfArithmeticStatement class >> annotation [

	<FMClass: #IfArithmeticStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> condition [
	"syntactic sugar"

	^self expression
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> condition: aBooleanExpression [
	"syntactic sugar"

	expression := aBooleanExpression 
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> equalLabel [
	"syntactic sugar"

	self mustHaveBranches: 3.
	^(branches at: 2) ifNotNil: [ :goto | goto labelReferences anyOne ]
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> equalLabel: aLabel [
	"syntactic sugar"

	self mustHaveBranches: 3.
	branches
		at: 2
		put: (FASTFortranGoToStatement new
			addLabelReference: aLabel ;
			yourself)
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> greaterLabel [
	"syntactic sugar"

	self mustHaveBranches: 3.
	^(branches at: 3) ifNotNil: [ :goto | goto labelReferences anyOne ]
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> greaterLabel: aLabel [
	"syntactic sugar"

	self mustHaveBranches: 3.
	branches
		at: 3
		put: (FASTFortranGoToStatement new
			addLabelReference: aLabel ;
			yourself)
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> lessLabel [
	"syntactic sugar"

	self mustHaveBranches: 3.
	^(branches at: 1) ifNotNil: [ :goto | goto labelReferences anyOne ]
]

{ #category : 'accessing' }
FASTFortranIfArithmeticStatement >> lessLabel: aLabel [
	"syntactic sugar"

	self mustHaveBranches: 3.
	branches
		at: 1
		put: (FASTFortranGoToStatement new
			addLabelReference: aLabel ;
			yourself)
]
