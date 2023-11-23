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

		spec baseline: 'OpenTelemetry' 
			with: [spec repository: 'github://Gabriel-Darbord/opentelemetry-pharo:main'];
			import: 'OpenTelemetry' provides: #( 'OpenTelemetry-Instrumentation-Matchers' ).
		
		spec package: 'Scopeo-Instrumentation'.
		spec package: 'Scopeo-Traces-Tests-Objects'.
		
		spec package: 'Scopeo-Traces' with: [
			spec requires: #( 'Scopeo-Instrumentation' ) 
		].
		
		spec package: 'Scopeo-Traces-Tests' with: [
			spec requires: #( 'Scopeo-Traces' 'Scopeo-Traces-Tests-Objects' ) 
		].
		
		spec package: #'Scopeo-Model'.
		spec package: #'Scopeo-Predicates'.
		spec package: #'Scopeo-Presenters'.
		
		spec package: #Scopeo ]
]
