Class {
	#name : 'ScpTraceArrayHandler',
	#superclass : 'ScpInstrumentationHandler',
	#instVars : [
		'traces'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'initialization' }
ScpTraceArrayHandler >> initialize [

	traces := OrderedCollection new.
]

{ #category : 'private' }
ScpTraceArrayHandler >> method: aSelector sender: aSender receiver: aReceiver arguments: anArguments [
	
	traces add: #received.
	traces add: aSelector.
	traces add: aSender.
	traces add: aReceiver.
	traces add: anArguments
]

{ #category : 'private' }
ScpTraceArrayHandler >> node: aNodeId assignment: aVariable object: anObject value: aValue [
	
	traces add: #assignment.
	traces add: aNodeId.
	traces add: aVariable.
	traces add: anObject.
	traces add: aValue
]

{ #category : 'private' }
ScpTraceArrayHandler >> node: aNodeId message: aSelector sender: aSender receiver: aReceiver arguments: anArguments [


	traces add: (aSender = aReceiver ifTrue: [ #self ] ifFalse: [ #sent ]).	
	traces add: aNodeId.
	traces add: aSelector.
	traces add: aSender.
	traces add: aReceiver.
	traces add: anArguments.
]

{ #category : 'private' }
ScpTraceArrayHandler >> node: aNodeId messageReturn: aValue [

	traces add: #messageReturn.
	traces add: aNodeId.
	traces add: aValue
]

{ #category : 'private' }
ScpTraceArrayHandler >> node: aNodeId methodReturn: aValue [

	traces add: #methodReturn.
	traces add: aNodeId.
	traces add: aValue

]

{ #category : 'private' }
ScpTraceArrayHandler >> node: aNodeId super: aSelector sender: aSender arguments: anArguments [

	traces add: #super.
	traces add: aNodeId.
	traces add: aSelector.
	traces add: aSender.
	traces add: anArguments 
]

{ #category : 'accessing' }
ScpTraceArrayHandler >> process [
	
	^ (ScpExecution fromTracesArray: traces) inspect
	
]

{ #category : 'accessing' }
ScpTraceArrayHandler >> traces [
	
	^ traces
]
