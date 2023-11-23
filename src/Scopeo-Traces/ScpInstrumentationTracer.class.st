Class {
	#name : 'ScpInstrumentationTracer',
	#superclass : 'Object',
	#instVars : [
		'intrumentation'
	],
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'services' }
ScpInstrumentationTracer >> clear [
]

{ #category : 'services' }
ScpInstrumentationTracer >> initialize [

	intrumentation := ScpInstrumentation new.
]

{ #category : 'as yet unclassified' }
ScpInstrumentationTracer >> matching: aOTMatcher [
]
