Class {
	#name : 'ScpMessageSentMapper',
	#superclass : 'ScpTraceToObjectEventMapper',
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpMessageSentMapper class >> key [

	^ #sent
]

{ #category : 'instance creation' }
ScpMessageSentMapper >> from: anIterator to: anExecution [

	anExecution addMessageSent: (
		ScpMessageSent new
			source: (anIterator next);
			selector: (anIterator next);
			object: (anIterator next);
			receiver: (anIterator next);
			arguments: (anIterator next);
			yourself
	)
]

{ #category : 'accessing' }
ScpMessageSentMapper >> key [

	^ #sent
]
