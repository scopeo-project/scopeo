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

{ #category : 'events handling' }
ScpTracesMemoryStorage >> onAssignment: aVariable of: anObject value: aValue [

	traces add: (ScpAssignmentTrace new
		variable: aVariable;
		object: anObject;
		value: aValue;
		yourself
	)
]

{ #category : 'events handling' }
ScpTracesMemoryStorage >> onMessageSent: aSelector to: aReceiver with: aArguments [

	traces add: (ScpMessageSendTrace new	
		selector: aSelector;
		receiver: aReceiver;
		arguments: aArguments;
		yourself
	)
]

{ #category : 'events handling' }
ScpTracesMemoryStorage >> onMethodCall: aMethodSelector of: aReceiver from: aSender with: aArguments [

   traces add: (ScpMethodCallTrace new
		selector: aMethodSelector;
		receiver: aReceiver;
		sender: aSender;
		arguments: aArguments;
		yourself
	)
]
