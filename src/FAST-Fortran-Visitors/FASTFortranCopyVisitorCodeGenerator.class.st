"
A Generator of a CopyVisitor specialized for FAST Fortran

See comment in my super-class for details and usage
"
Class {
	#name : 'FASTFortranCopyVisitorCodeGenerator',
	#superclass : 'FASTCopyVisitorCodeGenerator',
	#category : 'FAST-Fortran-Visitors-Tools',
	#package : 'FAST-Fortran-Visitors',
	#tag : 'Tools'
}

{ #category : 'code generation' }
FASTFortranCopyVisitorCodeGenerator >> shouldCopyProperty: property for: aModelClass [

	"Dealing with some special cases (errors in the meta-model, they should be marked #isContainer)"
	(property name beginsWith: 'parent') ifTrue: [ ^false ].

	(#(assignedIn invokedIn container) anySatisfy: [ :specialCase | property name = specialCase ])
		ifTrue: [ ^false ].

	^super shouldCopyProperty: property for: aModelClass
]
