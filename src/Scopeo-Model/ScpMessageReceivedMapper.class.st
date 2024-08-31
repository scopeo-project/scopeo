Class {
	#name : 'ScpMessageReceivedMapper',
	#superclass : 'ScpTraceToObjectEventMapper',
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpMessageReceivedMapper class >> key [

	^ #received
]

{ #category : 'as yet unclassified' }
ScpMessageReceivedMapper >> from: anIterator to: anExecution [

	anExecution addMessageReceived: (
		ScpMessageReceived new
			selector: (anIterator next);
			sender: (anIterator next);
			object: (anIterator next);
			arguments: (anIterator next);
			yourself)
]

{ #category : 'accessing' }
ScpMessageReceivedMapper >> key [

	^ #received
]
