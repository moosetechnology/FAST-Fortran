"
The logical IF statement executes one single statement, or does not execute it, depending on the value of a logical expression.


"
Class {
	#name : 'FASTFortranIfLogicalStatement',
	#superclass : 'FASTFortranConditionalStatement',
	#category : 'FAST-Fortran-Entities-Entities',
	#package : 'FAST-Fortran-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTFortranIfLogicalStatement class >> annotation [

	<FMClass: #IfLogicalStatement super: #FASTFortranConditionalStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTFortranIfLogicalStatement >> falseBranch [
	"IfLogicalStatement has only a 'true' branch"

	self shouldNotImplement 
]

{ #category : 'accessing' }
FASTFortranIfLogicalStatement >> falseBranch: aStatement [
	"IfLogicalStatement has only a 'true' branch"

	self shouldNotImplement 
]

{ #category : 'accessing' }
FASTFortranIfLogicalStatement >> statement [
	"IfLogicalStatement has only a 'true' branch"

	self mustHaveBranches: 1.
	^branches at: 1 ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTFortranIfLogicalStatement >> statement: aStatement [
	"IfLogicalStatement has only a 'true' branch"

	self mustHaveBranches: 1.
	branches at: 1 put: aStatement 
]
