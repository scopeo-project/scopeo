Class {
	#name : 'ScpTraceMemoryStorage',
	#superclass : 'Object',
	#instVars : [
		'traces'
	],
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'events' }
ScpTraceMemoryStorage >> addMessage: aScpMessage [
	"A message has been sent by an object during the execution of the program."

	traces add: aScpMessage
]

{ #category : 'events' }
ScpTraceMemoryStorage >> addStateUpdate: aScpStateUpdate [
	"A new value has been assigned to an object instance variable."

	traces add: aScpStateUpdate
]

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
