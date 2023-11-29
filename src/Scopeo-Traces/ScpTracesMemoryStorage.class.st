Class {
	#name : 'ScpTracesMemoryStorage',
	#superclass : 'ScpInstrumentationHandler',
	#instVars : [
		'traces'
	],
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'services' }
ScpTracesMemoryStorage >> clear [

	traces removeAll
]

{ #category : 'services' }
ScpTracesMemoryStorage >> fetch: aScpPredicate [

	^ traces select: [ :e | aScpPredicate verify: e ]
]

{ #category : 'initialization' }
ScpTracesMemoryStorage >> initialize [

	traces := OrderedCollection new
]

{ #category : 'services' }
ScpTracesMemoryStorage >> onCallOf: aSelector on: anObject with: aArguments [

	traces add: (ScpMessage new
			 selector: aSelector;
			 receiver: anObject;
			 arguments: aArguments;
			 yourself)
]

{ #category : 'services' }
ScpTracesMemoryStorage >> onMessage: aSelector to: anObject with: aArguments [

	traces add: (ScpMessage new
		selector: aSelector;
		receiver: anObject;
		arguments: aArguments;
		yourself
	)
]

{ #category : 'services' }
ScpTracesMemoryStorage >> onUpdateOf: aVariable of: anObject with: aValue [

	traces add: (ScpStateUpdate new
		object: anObject;
		variable: aVariable;
		newValue: aValue;
		yourself	
	)
]
