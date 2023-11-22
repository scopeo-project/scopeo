Class {
	#name : 'ScpInstrumentationTest',
	#superclass : 'ScpInstrumentationHandler',
	#category : 'Scopeo-Instrumentation-',
	#package : 'Scopeo-Instrumentation',
	#tag : ''
}

{ #category : 'as yet unclassified' }
ScpInstrumentationTest >> onCallOf: aSelector on: anObject with: aArguments [

	self halt.
]

{ #category : 'services' }
ScpInstrumentationTest >> onMessage: aSelector to: anObject with: aArguments [

	self halt.
]

{ #category : 'services' }
ScpInstrumentationTest >> onUpdateOf: aVariable of: anObject with: aValue [

	self halt.
]
