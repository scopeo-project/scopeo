Class {
	#name : 'ScpInstrumentationTracer',
	#superclass : 'Object',
	#instVars : [
		'instrumentation',
		'classMatcher',
		'packageMatcher',
		'methodMatcher',
		'handler'
	],
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'parameters' }
ScpInstrumentationTracer >> handler: aHandler [

	handler := aHandler
]

{ #category : 'initialization' }
ScpInstrumentationTracer >> initialize [

	instrumentation := ScpInstrumentation new
]

{ #category : 'accessing' }
ScpInstrumentationTracer >> methods: aMethods [

	instrumentation methods: aMethods
]

{ #category : 'services' }
ScpInstrumentationTracer >> startTracing [

	instrumentation handler: handler.
	
	self halt.
	instrumentation install
]

{ #category : 'services' }
ScpInstrumentationTracer >> stopTracing [

	instrumentation handler: ScpInstrumentationHandler new.
	instrumentation uninstall
]
