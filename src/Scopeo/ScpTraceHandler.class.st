Class {
	#name : 'ScpTraceHandler',
	#superclass : 'ScpInstrumentationHandler',
	#instVars : [
		'execution'
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

	execution := ScpSystem new
]

{ #category : 'events handling' }
ScpTraceHandler >> method: aSelector sender: aSender receiver: aReceiver arguments: anArguments [
	
	execution 
		addMethodEvent: aSelector 
		sender: aSender
		receiver: aReceiver 
		arguments: anArguments.
]

{ #category : 'events handling' }
ScpTraceHandler >> node: aNodeId assignment: aVariable object: anObject value: aValue [

	execution 
		addAssignmentEvent: aVariable 
		object: anObject 
		value: aValue
		node: aNodeId
]

{ #category : 'events handling' }
ScpTraceHandler >> node: aNodeId message: aSelector sender: aSender receiver: aReceiver arguments: anArguments [

	execution 	
		addMessageEvent: aSelector 
		sender: aSender 
		receiver: aReceiver 
		arguments: anArguments 
		node: aNodeId
]

{ #category : 'events handling' }
ScpTraceHandler >> node: aNodeId return: aValue [

	execution addReturnEvent: aValue node: aNodeId
]

{ #category : 'events handling' }
ScpTraceHandler >> node: aNodeId super: aSelector sender: aSender arguments: anArguments [

	execution 
		addSuperEvent: aSelector 
		sender: aSender 
		arguments: anArguments 
		node: aNodeId
]
