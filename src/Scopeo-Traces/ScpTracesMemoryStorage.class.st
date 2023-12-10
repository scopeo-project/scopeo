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
ScpTracesMemoryStorage >> onAssignmentOf: aValue to: aVariable of: anObject [ 
 
	traces add: (ScpStateUpdate new
			 object: anObject;
			 variable: aVariable;
			 newValue: aValue;
			 yourself)
]

{ #category : 'services' }
ScpTracesMemoryStorage >> onCallOf: aMethodSelector on: aReceiver from: aSender with: aArguments [

	traces add: (ScpMessage new
			 sender: aSender;
			 selector: aMethodSelector;
			 receiver: aReceiver;
			 arguments: aArguments;
			 yourself)
]
