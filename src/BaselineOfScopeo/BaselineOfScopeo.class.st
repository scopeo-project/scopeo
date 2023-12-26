Class {
	#name : 'BaselineOfScopeo',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfScopeo',
	#package : 'BaselineOfScopeo'
}

{ #category : 'baselines' }
BaselineOfScopeo >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self dependencies: spec.
		self packages: spec 
	]
]

{ #category : 'accessing' }
BaselineOfScopeo >> dependencies: spec [

	spec package: 'OpenTelemetry-Instrumentation-Matchers' with: [
		spec repository: 'github://Gabriel-Darbord/opentelemetry-pharo:main'
	]
]

{ #category : 'accessing' }
BaselineOfScopeo >> packages: spec [

	spec package: 'Scopeo-Instrumentation'.
	spec package: 'Scopeo-Traces-Tests-Objects'.

	spec
		package: 'Scopeo-Traces'
		with: [ spec requires: #( 'Scopeo-Instrumentation' ) ].

	spec
		package: 'Scopeo-Traces-Tests'
		with: [
		spec requires: #( 'Scopeo-Traces' 'Scopeo-Traces-Tests-Objects' ) ].

	spec package: #'Scopeo-Model'.
	spec package: #'Scopeo-Predicates'.
	spec package: #'Scopeo-Presenters'.

	spec package: #Scopeo
]
