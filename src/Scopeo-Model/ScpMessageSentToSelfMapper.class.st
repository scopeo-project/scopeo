Class {
	#name : 'ScpMessageSentToSelfMapper',
	#superclass : 'ScpTraceToObjectEventMapper',
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpMessageSentToSelfMapper class >> key [

	^ #self
]

{ #category : 'instance creation' }
ScpMessageSentToSelfMapper >> from: anIterator to: anExecution [

	anExecution addMessageSent: (
		ScpMessageSentToSelf new
			source: (anIterator next);
			selector: (anIterator next);
			object: (anIterator next);
			arguments: (anIterator next: 2);
			yourself
	)
]

{ #category : 'accessing' }
ScpMessageSentToSelfMapper >> key [

	^ #self
]
