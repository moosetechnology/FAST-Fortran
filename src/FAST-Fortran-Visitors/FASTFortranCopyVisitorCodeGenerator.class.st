"
A Generator of a CopyVisitor specialized for FAST Fortran
"
Class {
	#name : #FASTFortranCopyVisitorCodeGenerator,
	#superclass : #FASTCopyVisitorCodeGenerator,
	#category : #'FAST-Fortran-Visitors-Tools'
}

{ #category : #'code generation' }
FASTFortranCopyVisitorCodeGenerator >> shouldCopyProperty: property for: aModelClass [

	"Dealing with some special cases (errors in the meta-model, they should be marked #isContainer)"
	(property name beginsWith: 'parent') ifTrue: [ ^false ].

	(#(assignedIn invokedIn container) anySatisfy: [ :specialCase | property name = specialCase ])
		ifTrue: [ ^false ].

	^super shouldCopyProperty: property for: aModelClass
]
