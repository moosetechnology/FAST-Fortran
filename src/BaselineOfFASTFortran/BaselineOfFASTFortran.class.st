Class {
	#name : 'BaselineOfFASTFortran',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFASTFortran',
	#package : 'BaselineOfFASTFortran'
}

{ #category : 'baselines' }
BaselineOfFASTFortran >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec description: 'FAST Fortran'.
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfFASTFortran >> defineDependencies: spec [

	spec
		baseline: 'FAST'
		with: [ 
			spec
				loads: #('tools');
				repository: 'github://moosetechnology/FAST:v2' ];

		"by default FAST not load Famix-Traits"
		baseline: 'Famix'
		with: [ 
			spec
				loads: #( 'Core' 'Minimal' 'Basic' );
				repository: 'github://moosetechnology/Famix:development' ];

		"'FASTFortranImporter >> jsonASTToFAST:fromFortranSource:' use NeoJSONReader
		Needed also by Esope, so we can ignore it
		"
		"baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON' ];"

		"Warning: We Need Esope because of FASTFortranDifferentialValidator from FAST-Fortran depends on FortranProjectImporter from Esope"
		baseline: 'Esope'
		with: [ spec repository: 'github://moosetechnology/Esope' ]
]

{ #category : 'baselines' }
BaselineOfFASTFortran >> defineGroups: spec [

	spec
		group: 'default' with: #( 'core' );
		group: 'core' with: #( 'FAST-Fortran-Entities' 'FAST-Fortran-Visitors' 'FAST-Fortran-Analyses' );
		group: 'all' with: #( 'core' 'FAST-Fortran-Generator' 'FAST-Fortran-Visitors-Tests' 'FAST-Fortran-Analyses-Tests' )
]

{ #category : 'baselines' }
BaselineOfFASTFortran >> definePackages: spec [

	spec
		package: 'FAST-Fortran-Generator' with: [ spec requires: #(FAST Famix) ] ;
		package: 'FAST-Fortran-Entities' with: [ spec requires: #(FAST Famix) ];
		package: 'FAST-Fortran-Visitors' with: [ spec requires: #('Esope' 'FAST-Fortran-Entities') ];
		package: 'FAST-Fortran-Visitors-Tests' with: [ spec requires: #('FAST-Fortran-Visitors') ] ;
		package: 'FAST-Fortran-Analyses' with: [ spec requires: #('FAST-Fortran-Visitors') ] ; 
		package: 'FAST-Fortran-Analyses-Tests' with: [ spec requires: #('FAST-Fortran-Visitors' 'FAST-Fortran-Analyses') ]

]
