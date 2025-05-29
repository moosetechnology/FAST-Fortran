"
I represent Fortran If (BLock) statement


"
Class {
	#name : 'FASTFortranIfBlockStatement',
	#superclass : 'FASTFortranConditionalStatement',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranIfBlockStatement class >> annotation [

	<FMClass: #IfBlockStatement super: #FASTFortranConditionalStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranIfBlockStatement >> elseStatementBlock [
	"Relation named: #elseStatementBlock type: #FASTFortranStatementBlock opposite: #parentIfBlock"

	<generated>
	<FMComment: 'Statement block containing statements of else branch '>
	^ elseStatementBlock
]

{ #category : 'accessing' }
FASTFortranIfBlockStatement >> elseStatementBlock: anObject [

	<generated>
	elseStatementBlock := anObject
]

{ #category : 'accessing' }
FASTFortranIfBlockStatement >> thenStatementBlock [
	"Relation named: #thenStatementBlock type: #FASTFortranStatementBlock opposite: #parentIfBlock"

	<generated>
	<FMComment: 'Statement block containing statements of then branch '>
	^ thenStatementBlock
]

{ #category : 'accessing' }
FASTFortranIfBlockStatement >> thenStatementBlock: anObject [

	<generated>
	thenStatementBlock := anObject
]
