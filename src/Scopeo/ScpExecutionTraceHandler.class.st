Class {
	#name : 'ScpExecutionTraceHandler',
	#superclass : 'ScpInstrumentationHandler',
	#instVars : [
		'execution'
	],
	#category : 'Scopeo',
	#package : 'Scopeo'
}

{ #category : 'accessing' }
ScpExecutionTraceHandler >> execution [

	^ execution
]

{ #category : 'initialization' }
ScpExecutionTraceHandler >> initialize [

	execution := ScpExecution new
]

{ #category : 'events handling' }
ScpExecutionTraceHandler >> method: aSelector sender: aSender receiver: aReceiver arguments: anArguments [
	
	execution 
		addMethodEvent: aSelector 
		sender: aSender
		receiver: aReceiver 
		arguments: anArguments.
]

{ #category : 'events handling' }
ScpExecutionTraceHandler >> node: aNodeId assignment: aVariable object: anObject value: aValue [

	execution 
		addAssignmentEvent: aVariable 
		object: anObject 
		value: aValue
		node: aNodeId
]

{ #category : 'events handling' }
ScpExecutionTraceHandler >> node: aNodeId message: aSelector sender: aSender receiver: aReceiver arguments: anArguments [

	execution 	
		addMessageEvent: aSelector 
		sender: aSender 
		receiver: aReceiver 
		arguments: anArguments 
		node: aNodeId
]

{ #category : 'events handling' }
ScpExecutionTraceHandler >> node: aNodeId return: aValue [

	execution addReturnEvent: aValue node: aNodeId
]

{ #category : 'events handling' }
ScpExecutionTraceHandler >> node: aNodeId super: aSelector sender: aSender arguments: anArguments [

	execution 
		addSuperEvent: aSelector 
		sender: aSender 
		arguments: anArguments 
		node: aNodeId
]
