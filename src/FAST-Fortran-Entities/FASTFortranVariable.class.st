"
an abstract Fortran Variable, could be an array or a scalar
"
Class {
	#name : #FASTFortranVariable,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTExpression + FASTFortranTVariableEntity',
	#classTraits : 'FASTFortranTExpression classTrait + FASTFortranTVariableEntity classTrait',
	#instVars : [
		'#name => FMProperty',
		'#parentDeclaration => FMOne type: #FASTFortranDeclarationStatement opposite: #declarators'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariable class >> annotation [

	<FMClass: #Variable super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranVariable >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Determines the variable name'>
	^ name
]

{ #category : #accessing }
FASTFortranVariable >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
FASTFortranVariable >> parentDeclaration [
	"Relation named: #parentDeclaration type: #FASTFortranDeclarationStatement opposite: #declarators"

	<generated>
	<FMComment: 'Parent declaration'>
	<container>
	^ parentDeclaration
]

{ #category : #accessing }
FASTFortranVariable >> parentDeclaration: anObject [

	<generated>
	parentDeclaration := anObject
]

{ #category : #navigation }
FASTFortranVariable >> parentDeclarationGroup [
	<generated>
	<navigation: 'ParentDeclaration'>
	^ MooseSpecializedGroup with: self parentDeclaration
]
