Class {
	#name : 'ScpTraceHandler',
	#superclass : 'ScpInstrumentationHandler',
	#instVars : [
		'traces',
		'index'
	],
	#category : 'Scopeo',
	#package : 'Scopeo'
}

{ #category : 'initialization' }
ScpTraceHandler >> initialize [

	index := 0. 
	traces := OrderedCollection new.
]

{ #category : 'private' }
ScpTraceHandler >> method: aSelector sender: aSender receiver: aReceiver arguments: anArguments [
	
	traces add: #externalcall.
	traces add: aSelector.
	traces add: aSender.
	traces add: aReceiver.
	traces add: anArguments
]

{ #category : 'private' }
ScpTraceHandler >> node: aNodeId assignment: aVariable object: anObject value: aValue [

	traces add: #assignment.
	traces add: aNodeId.
	traces add: aVariable.
	traces add: anObject.
	traces add: aValue
]

{ #category : 'private' }
ScpTraceHandler >> node: aNodeId message: aSelector sender: aSender receiver: aReceiver arguments: anArguments [

	traces add: #call.
	traces add: aNodeId.
	traces add: aSelector.
	traces add: aSender.
	traces add: aReceiver.
	traces add: anArguments
]

{ #category : 'private' }
ScpTraceHandler >> node: aNodeId return: aValue [

	traces add: #return.
	traces add: aNodeId.
	traces add: aValue
]

{ #category : 'private' }
ScpTraceHandler >> node: aNodeId super: aSelector sender: aSender arguments: anArguments [

	traces add: #supercall.
	traces add: aNodeId.
	traces add: aSelector.
	traces add: aSender.
	traces add: anArguments 
]

{ #category : 'api' }
ScpTraceHandler >> process [
	
	"Create an execution model from the traces"
	| it execution trace |
	
	execution := ScpExecution new.	
	traces ifEmpty: [ ^ execution ].
	it := 1.
	[ it < traces size and: [ (traces at: it) isNotNil ] ] whileTrue: [ 
		
		trace := ScpTrace fromTraces: traces startingAt: it.
		it := it + trace size + 1.
		execution addTrace: trace.
	].
	^ execution 	inspect
	
]

{ #category : 'api' }
ScpTraceHandler >> traces [

	^ traces 
]
