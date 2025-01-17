Class {
	#name : 'FASTFortran2kGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'classDeclarationStatement',
		'derivedType',
		'derivedTypeComponent',
		'derivedTypeDeclarationStatement',
		'interface',
		'interfaceProcedure',
		'interfaceModuleProcedureSummary',
		'internalProcedure',
		'internalFunction',
		'internalSubroutine',
		'importStatement',
		'module',
		'pointerAssignmentStatement',
		'ptVariable',
		'pointerVariable',
		'publicStatement',
		'privateStatement',
		'sourceCodeString',
		'formattedCodeString',
		'targetVariable',
		'typeBoundProcedure',
		'typeBPFinal',
		'useStatement',
		'useRenamedStatement',
		'useNoRenamedStatement',
		'useOnlyStatement',
		'userDefinedType',
		'abstractStatement',
		'type',
		'tHasBindingAttribute',
		'tPointerAssignment',
		'tNamedEntity',
		'variableDeclarationStatement',
		'tEntity',
		'tExpression',
		'tWithComments',
		'tBehaviouralEntity',
		'programUnit',
		'variable',
		'procedure',
		'programMain'
	],
	#classInstVars : [
		'typeBoundProcedure'
	],
	#category : 'FAST-Fortran2k-Generator-F2kMetamodel',
	#package : 'FAST-Fortran2k-Generator',
	#tag : 'F2kMetamodel'
}

{ #category : 'generating' }
FASTFortran2kGenerator class >> packageName [
	
	<ignoreForCoverage>
	^ #'FAST-Fortran2kmm-Entities'
]

{ #category : 'generating' }
FASTFortran2kGenerator class >> prefix [

	<ignoreForCoverage>
	^#FASTFortran2k
]

{ #category : 'generating' }
FASTFortran2kGenerator class >> submetamodels [

	^ { FASTMetamodelGenerator. FASTFortranGenerator }
]

{ #category : 'definition' }
FASTFortran2kGenerator >> defineClasses [

	super defineClasses.

	"nameEntity := self newClassNamed: #NameEntity comment: 'Im an item of access-id-list'."

	classDeclarationStatement := self newClassNamed: #ClassDeclarationStatement comment:
		                             '`class(type_name) [, pointer/allocatable/target] [, other_attributes ] :: declarators`'.

	derivedType := self newClassNamed: #DerivedType comment: 'I represent a derived type'.

	derivedTypeComponent := self newClassNamed: #DerivedTypeComponent comment: 'Im a derived type component'.

	derivedTypeDeclarationStatement := self newClassNamed: #DerivedTypeDeclaration comment: 'I represent a derived type declaration'.

	interface := self newClassNamed: #Interface comment: 'I represent an interface'.
	interfaceProcedure := self newClassNamed: #InterfaceProcedure comment: 'I represent an interface procedure declaration'.

	interfaceModuleProcedureSummary := self newClassNamed: #IModuleProcedureSummary comment: ''.


	internalProcedure := self newAbstractClassNamed: #InternalProcedure comment: 'I represent a internal procedure'.

	internalFunction := self newAbstractClassNamed: #InternalFunction comment: 'I represent a internal procedure'.

	internalSubroutine := self newAbstractClassNamed: #InternalSubroutine comment: 'I represent a internal procedure'.

	importStatement := self newClassNamed: #ImportStatement comment: ''.

	module := self newClassNamed: #Module comment: 'I represent a module'.

	pointerAssignmentStatement := self newClassNamed: #PointerAssignmentStatement comment: ''.
	ptVariable := self newClassNamed: #PTVariable comment: ''.
	pointerVariable := self newClassNamed: #PointerVariable comment: ''.

	publicStatement := self newClassNamed: #PublicStatement comment: 'Im a public statement'.

	privateStatement := self newClassNamed: #PrivateStatement comment: 'Im a private statement'.
		
	sourceCodeString := self newClassNamed: #SourceCodeString comment: ''.
	formattedCodeString := self newClassNamed: #FormattedCodeString comment: ''.


	targetVariable := self newClassNamed: #TargetVariable comment: ''.

	typeBoundProcedure := self newClassNamed: #TypeBoundProcedure comment: 'Im a type-bound-procedure'.

	typeBPFinal := self newClassNamed: #TypePBFinal comment: 'I represent a finalizer'.

	useStatement := self newClassNamed: #UseStatement comment: 'I represent a use statement'.
	useRenamedStatement := self newClassNamed: #UseRenamedStatement comment: 'I represent a use renamed statement'.
	useNoRenamedStatement := self newClassNamed: #UseNoRenamedStatement comment: 'I represent a non use renamed statement'.
	useOnlyStatement := self newClassNamed: #UseOnlyStatement comment: 'I represent a only use statement'.

	userDefinedType := self newClassNamed: #UserDefinedType comment: 'I represent a user defined type'.
	
	"REMOTES"
	abstractStatement := self remoteEntity: #AbstractStatement withPrefix: #FASTFortran.
	procedure := self remoteEntity: #Procedure withPrefix: #FASTFortran.
	programMain := self remoteEntity: #ProgramMain withPrefix: #FASTFortran.
	programUnit := self remoteEntity: #ProgramUnit withPrefix: #FASTFortran.
	type := self remoteEntity: #Type withPrefix: #FASTFortran.
	variable := self remoteEntity: #Variable withPrefix: #FASTFortran.
	variableDeclarationStatement  := self remoteEntity: #VariableDeclarationStatement withPrefix: #FASTFortran.
]

{ #category : 'definition' }
FASTFortran2kGenerator >> defineHierarchy [

	super defineHierarchy.

"	nameEntity --|> tNamedEntity."

	derivedType --|> type.
	derivedType --|> tNamedEntity.
	derivedType --|> abstractStatement.
	
	derivedTypeDeclarationStatement --|> variableDeclarationStatement.
	classDeclarationStatement --|> variableDeclarationStatement.
	
	derivedTypeComponent --|> variableDeclarationStatement.
	
	importStatement --|> abstractStatement.
	
	interface --|> tNamedEntity. "name is optional"
	interface --|> abstractStatement.
	
	interfaceProcedure --|> tNamedEntity.
	interfaceModuleProcedureSummary --|> interfaceProcedure.
	
	internalProcedure --|> tEntity.
	internalProcedure --|> tBehaviouralEntity.
	internalProcedure --|> tNamedEntity.
	internalProcedure --|> tWithComments.

	internalFunction --|> internalProcedure.
	internalSubroutine --|> internalProcedure.
	
	module --|> programUnit.
	
	pointerAssignmentStatement --|> tPointerAssignment.
	
	ptVariable --|> variable.
	
	pointerVariable --|> ptVariable.
	
	privateStatement --|> abstractStatement.
	publicStatement --|> abstractStatement.
	
	sourceCodeString --|> abstractStatement.
	formattedCodeString --|> sourceCodeString.
	
	targetVariable --|> ptVariable.
	
	tHasBindingAttribute --|> tNamedEntity.
	
	tPointerAssignment --|> tExpression.
	
	typeBoundProcedure --|> tNamedEntity.
	typeBPFinal --|> typeBoundProcedure.
	
	useStatement --|> tNamedEntity.
	useStatement --|> abstractStatement.
	
	useRenamedStatement --|> tNamedEntity.
	useNoRenamedStatement --|> tNamedEntity.
	
	useOnlyStatement --|> useStatement.
	
	userDefinedType --|> type.
	userDefinedType  --|> tNamedEntity.

]

{ #category : 'definition' }
FASTFortran2kGenerator >> defineProperties [

	super defineProperties.

	(derivedType property: #superType type: #String) comment:
		'I represent the name of the super type'.
		
	(interface property: #isAbstractInterface type: #Boolean)
		comment: 'Im abstract ?'.
		
	(sourceCodeString property: #content type: #String)
		comment: 'The source code string to export'.
	(formattedCodeString property: #values type: #Object)
		comment: 'Values of the variables to format the string'.
	
	(typeBoundProcedure property: #alias type: #String)
		comment: 'I represent the alias name of the procedure'.
		
	(typeBoundProcedure property: #interface type: #String)
		comment: 'I represent the name of the interface'.
		
	(useRenamedStatement property: #alias type: #String)
		comment: 'I represent the alias of the used entity'.
]

{ #category : 'definition' }
FASTFortran2kGenerator >> defineRelations [

	super defineRelations.

	derivedType <>-* derivedTypeComponent.
	derivedType <>-* typeBoundProcedure.
	
	importStatement  -* variable.

	procedure <>-* internalProcedure.
	programMain <>-* internalProcedure.

	module <>-* procedure.

	publicStatement -* variable.
	privateStatement -* variable.
	useStatement <>-* useRenamedStatement.
	useOnlyStatement <>-* useNoRenamedStatement.

	(internalFunction property: #returnType)
	<>- (type property: #typedFunctions).

	interface <>-* interfaceProcedure.

	((tPointerAssignment property: #variable) comment:
		 'An assigned variable (lhs of assignment)')
	<>-
		((pointerVariable property: #parentAssignmentExpression) comment:
			 'Optional assignment to the variable').

	((tPointerAssignment property: #expression) comment:
		 'Assigned expression (rhs of assignment)')
	<>- ((ptVariable property: #assignedIn) comment:
			 'Optional assignment where this expression is used')
]

{ #category : 'definition' }
FASTFortran2kGenerator >> defineTraits [

	super defineTraits.

	tHasBindingAttribute := self newTraitNamed: #THasBindingAttribute comment: 'I represent an attribute (pass/nopass or deferred/non_overidable or private/public) of a type-bound-procedure'.

	tPointerAssignment := builder newTraitNamed: #TPointerAssignment comment: 'p => q'.

	"REMOTES"
	tNamedEntity := self remoteTrait: #TNamedEntity withPrefix: #FAST.
	tEntity := self remoteTrait: #TEntity withPrefix: #FAST.
	tExpression := self remoteTrait: #TExpression withPrefix: #FAST.
	tWithComments := self remoteTrait: #TWithComments withPrefix: #FAST.
	tBehaviouralEntity := self remoteTrait: #TBehaviouralEntity withPrefix: #FAST.
]
