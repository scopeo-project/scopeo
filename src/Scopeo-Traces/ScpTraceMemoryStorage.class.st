Class {
	#name : 'ScpTraceMemoryStorage',
	#superclass : 'ScpInstrumentationHandler',
	#instVars : [
		'traces'
	],
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'services' }
ScpTraceMemoryStorage >> clear [

	traces removeAll
]

{ #category : 'services' }
ScpTraceMemoryStorage >> fetch: aScpPredicate [

	^ traces select: [ :e | aScpPredicate verify: e ]
]

{ #category : 'initialization' }
ScpTraceMemoryStorage >> initialize [

	traces := OrderedCollection new
]

{ #category : 'services' }
ScpTraceMemoryStorage >> onCallOf: aSelector on: anObject with: aArguments [

	
]

{ #category : 'services' }
ScpTraceMemoryStorage >> onMessage: aSelector to: anObject with: aArguments [

	traces add: (ScpMessage new
		selector: aSelector;
		receiver: anObject;
		arguments: aArguments;
		yourself
	)
]

{ #category : 'services' }
ScpTraceMemoryStorage >> onUpdateOf: aVariable of: anObject with: aValue [

	traces add: (ScpStateUpdate new
		object: anObject;
		variable: aVariable;
		newValue: aValue;
		yourself	
	)
]
