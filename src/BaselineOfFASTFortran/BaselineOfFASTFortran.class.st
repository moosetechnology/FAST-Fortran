Class {
	#name : #BaselineOfFASTFortran,
	#superclass : #BaselineOf,
	#category : #BaselineOfFASTFortran
}

{ #category : #baselines }
BaselineOfFASTFortran >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec description: 'Developement version of FAST Fortran'.
		self definePackages: spec.
		self defineDependencies: spec ]
]

{ #category : #baselines }
BaselineOfFASTFortran >> defineDependencies: spec [

	spec
		baseline: 'FAST'
		with: [ spec
				loads: #('tools');
				repository: 'github://moosetechnology/FAST:v2/src' ] ;

	baseline: 'Esope'
		with: [ spec
				loads: #('default');
				repository: 'github://moosetechnology/Esope' ]
]

{ #category : #baselines }
BaselineOfFASTFortran >> definePackages: spec [
	spec
		repository: 'https://github.com/moosetechnology/FAST-Fortran';
		package: 'FAST-Fortran-Generator' with: [ spec requires: #(FAST Esope) ] ;
		package: 'FAST-Fortran-Entities' with: [ spec requires: #(FAST Esope) ];
		package: 'FAST-Fortran-Visitors' with: [ spec requires: #('FAST-Fortran-Entities') ];
		package: 'FAST-Fortran-Visitors-Tests' with: [ spec requires: #('FAST-Fortran-Visitors') ] ;
		package: 'FAST-Fortran-Analyses' with: [ spec requires: #('FAST-Fortran-Visitors') ] ; 
		package: 'FAST-Fortran-Analyses-Tests' with: [ spec requires: #('FAST-Fortran-Visitors' 'FAST-Fortran-Visitors-Tests') ]

]
