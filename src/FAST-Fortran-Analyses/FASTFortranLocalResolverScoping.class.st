Class {
	#name : #FASTFortranLocalResolverScoping,
	#superclass : #FASTLocalResolverScoping,
	#category : #'FAST-Fortran-Analyses-Resolver'
}

{ #category : #private }
FASTFortranLocalResolverScoping >> nonLocalDeclaration: name [
	"In Fortran a non declared identifier can be an implicit identifier"

	^ FASTFortranImplicitLocalDeclaration new name: name
]
