Class {
	#name : 'FASTFortranLocalResolverScoping',
	#superclass : 'FASTLocalResolverScoping',
	#category : 'FAST-Fortran-Analyses-Resolver',
	#package : 'FAST-Fortran-Analyses',
	#tag : 'Resolver'
}

{ #category : 'private' }
FASTFortranLocalResolverScoping >> nonLocalDeclaration: name [
	"In Fortran a non declared identifier can be an implicit identifier"

	^ FASTFortranImplicitLocalDeclaration new name: name
]
