Class {
	#name : #BaselineOfScopeo,
	#superclass : #BaselineOf,
	#category : #BaselineOfScopeo
}

{ #category : #baselines }
BaselineOfScopeo >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self dependencies: spec.
		self packages: spec 
	]
]

{ #category : #accessing }
BaselineOfScopeo >> dependencies: spec [

	
	spec repository: 'github://scopeo-project/scopeo-instrumentation:main'.

	spec package: 'OpenTelemetry-Instrumentation-Matchers' with: [
		spec repository: 'github://Gabriel-Darbord/opentelemetry-pharo:main' ]
]

{ #category : #accessing }
BaselineOfScopeo >> packages: spec [

	spec package: 'Scopeo-TraceRecorder-TestObjects'.

	spec package: 'Scopeo-TraceRecorder' with: [
		spec requires:
			#( 'Scopeo-Instrumentation' 'Scopeo-TraceRecorder-TestObjects' ) ].

	spec package: #'Scopeo-Model'.
	spec package: #'Scopeo-Predicates'.
	spec package: #'Scopeo-Presenters'.

	spec package: #Scopeo
]
