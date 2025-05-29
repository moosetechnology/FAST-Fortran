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

{ #category : 'as yet unclassified' }
FASTFortranIfBlockStatement >> elseStatementBlock [
 
	^self falseBranch
]

{ #category : 'as yet unclassified' }
FASTFortranIfBlockStatement >> elseStatementBlock: aFASTFortranStatementBlock [
 
	self falseBranch: aFASTFortranStatementBlock 
]

{ #category : 'as yet unclassified' }
FASTFortranIfBlockStatement >> thenStatementBlock [

	^self trueBranch
]

{ #category : 'as yet unclassified' }
FASTFortranIfBlockStatement >> thenStatementBlock: aFASTFortranStatementBlock [

	self trueBranch: aFASTFortranStatementBlock 
]
