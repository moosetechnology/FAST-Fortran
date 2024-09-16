"
```st
	FASTFortranSegment new 
		name: 'toto';
		statements: { 
			FASTFortranVariableDeclarationStatement new 
				type: (FASTFortranIntegerType new 
					size: (FASTFortranScalarVariable new name: 'm')
				); 
				declarators: { 
					FASTFortranVariableDeclarator new 
						name: 'x'; 
						dimensions: { 
							FASTFortranArrayRange new 
								upperBound: (FASTFortranScalarVariable new name: 'n') 
						}
				} 
		}	
	```
	

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTBehaviouralEntity` | Behavioural entity containing the statement block.|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `statements` | `FASTTStatementBlock` | `statementContainer` | `FASTTStatement` | Statements enclosed in this block|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTFortranSegment',
	#superclass : 'FASTFortranType',
	#traits : 'FASTTNamedEntity + FASTTStatementBlock',
	#classTraits : 'FASTTNamedEntity classTrait + FASTTStatementBlock classTrait',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranSegment class >> annotation [

	<FMClass: #Segment super: #FASTFortranType>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
