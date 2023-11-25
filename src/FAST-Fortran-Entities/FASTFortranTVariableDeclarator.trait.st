"
I represent a variable declarator: variable declared + optional initial value
"
Trait {
	#name : #FASTFortranTVariableDeclarator,
	#instVars : [
		'#expression => FMOne type: #FASTFortranTExpression opposite: #variableDeclaratorOwner',
		'#parentDeclaration => FMOne type: #FASTFortranTWithDeclarators opposite: #declarators',
		'#variable => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTVariableDeclarator classSide >> annotation [

	<FMClass: #TVariableDeclarator super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #variableDeclaratorOwner"

	<generated>
	<FMComment: 'Expression assigned to the variable declared'>
	^ expression
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranTVariableDeclarator >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> parentDeclaration [
	"Relation named: #parentDeclaration type: #FASTFortranTWithDeclarators opposite: #declarators"

	<generated>
	<container>
	^ parentDeclaration
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> parentDeclaration: anObject [

	<generated>
	parentDeclaration := anObject
]

{ #category : #navigation }
FASTFortranTVariableDeclarator >> parentDeclarationGroup [
	<generated>
	<navigation: 'ParentDeclaration'>
	^ MooseSpecializedGroup with: self parentDeclaration
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> variable [

	<FMProperty: #variable type: #String>
	<generated>
	<FMComment: 'The name of the variable being declared'>
	^ variable
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> variable: anObject [
	<generated>
	variable := anObject
]