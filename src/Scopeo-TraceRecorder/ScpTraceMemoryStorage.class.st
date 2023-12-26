Class {
	#name : 'ScpTraceMemoryStorage',
	#superclass : 'ScpInstrumentationHandler',
	#instVars : [
		'traces'
	],
	#category : 'Scopeo-TraceRecorder-Model',
	#package : 'Scopeo-TraceRecorder',
	#tag : 'Model'
}

{ #category : 'initialization' }
ScpTraceMemoryStorage >> initialize [

	traces := OrderedCollection new
]

{ #category : 'events handling' }
ScpTraceMemoryStorage >> onAssignment: aVariable of: anObject value: aValue [

	traces add: (ScpAssignmentTrace new
		variable: aVariable;
		object: anObject;
		value: aValue;
		yourself
	)
]

{ #category : 'events handling' }
ScpTraceMemoryStorage >> onMessageSent: aSelector to: aReceiver with: aArguments [

	traces add: (ScpMessageSendTrace new	
		selector: aSelector;
		receiver: aReceiver;
		arguments: aArguments;
		yourself
	)
]

{ #category : 'events handling' }
ScpTraceMemoryStorage >> onMethodCall: aMethodSelector of: aReceiver from: aSender with: aArguments [

   traces add: (ScpMethodCallTrace new
		selector: aMethodSelector;
		receiver: aReceiver;
		sender: aSender;
		arguments: aArguments;
		yourself
	)
]

{ #category : 'accessing' }
ScpTraceMemoryStorage >> traces [

	^ traces
]
