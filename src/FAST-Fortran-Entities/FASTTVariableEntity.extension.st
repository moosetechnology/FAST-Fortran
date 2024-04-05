Extension { #name : #FASTTVariableEntity }

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTVariableEntity >> parentImpliedExpression [
	"Relation named: #parentImpliedExpression type: #FASTFortranImpliedDoExpression opposite: #variables"

	<generated>
	<container>
	<FMProperty: #parentImpliedExpression type: #FASTFortranImpliedDoExpression opposite: #variables>
	<package: #'FAST-Fortran-Entities'>
	^ self attributeAt: #parentImpliedExpression ifAbsent: [ nil ]
]

{ #category : #'*FAST-Fortran-Entities-accessing' }
FASTTVariableEntity >> parentImpliedExpression: anObject [

	<generated>
	self attributeAt: #parentImpliedExpression put: (FMMultivalueLink on: self update: #variables from: self parentImpliedExpression to: anObject).
]
