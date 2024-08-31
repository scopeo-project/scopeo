Class {
	#name : 'ScpMessageSentToSuperMapper',
	#superclass : 'ScpTraceToObjectEventMapper',
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpMessageSentToSuperMapper class >> key [

	^ #super
]

{ #category : 'instance creation' }
ScpMessageSentToSuperMapper >> from: anIterator to: anExecution [

	anExecution addMessageSent: (
		ScpMessageSentToSelf new
			source: (anIterator next);
			selector: (anIterator next);
			object: (anIterator next);
			arguments: (anIterator next);
			yourself
	)
]

{ #category : 'accessing' }
ScpMessageSentToSuperMapper >> key [

	^ #super
]
