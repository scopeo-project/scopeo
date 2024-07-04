Class {
	#name : 'ScpTraceHandler',
	#superclass : 'ScpInstrumentationHandler',
	#instVars : [
		'execution',
		'traces',
		'index'
	],
	#category : 'Scopeo',
	#package : 'Scopeo'
}

{ #category : 'accessing' }
ScpTraceHandler >> execution [

	^ execution
]

{ #category : 'initialization' }
ScpTraceHandler >> initialize [

	index := 0.
	traces := OrderedCollection new.
]

{ #category : 'events handling' }
ScpTraceHandler >> method: aSelector sender: aSender receiver: aReceiver arguments: anArguments [
	
	traces at: self nextIndex put: #externalcall.
	traces at: self nextIndex put: aSelector.
	traces at: self nextIndex put: aSender.
	traces at: self nextIndex put: aReceiver.
	traces at: self nextIndex put: anArguments
]

{ #category : 'accessing' }
ScpTraceHandler >> nextIndex [

	index := index + 1.
	^ index

]

{ #category : 'events handling' }
ScpTraceHandler >> node: aNodeId assignment: aVariable object: anObject value: aValue [

	traces at: self nextIndex put: #assignment.
	traces at: self nextIndex put: aNodeId.
	traces at: self nextIndex put: aVariable.
	traces at: self nextIndex put: anObject.
	traces at: self nextIndex put: aValue
]

{ #category : 'events handling' }
ScpTraceHandler >> node: aNodeId message: aSelector sender: aSender receiver: aReceiver arguments: anArguments [

	traces at: self nextIndex put: #call.
	traces at: self nextIndex put: aNodeId.
	traces at: self nextIndex put: aSelector.
	traces at: self nextIndex put: aSender.
	traces at: self nextIndex put: aReceiver.
	traces at: self nextIndex put: anArguments
]

{ #category : 'events handling' }
ScpTraceHandler >> node: aNodeId return: aValue [

	traces at: self nextIndex put: #return.
	traces at: self nextIndex put: aNodeId.
	traces at: self nextIndex put: aValue
]

{ #category : 'events handling' }
ScpTraceHandler >> node: aNodeId super: aSelector sender: aSender arguments: anArguments [

	traces at: self nextIndex put: #super.
	traces at: self nextIndex put: aNodeId.
	traces at: self nextIndex put: aSelector.
	traces at: self nextIndex put: aSender.
	traces at: self nextIndex put: anArguments 
]

{ #category : 'accessing' }
ScpTraceHandler >> traces [

	^ traces 
]
