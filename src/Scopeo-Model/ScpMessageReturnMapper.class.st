Class {
	#name : 'ScpMessageReturnMapper',
	#superclass : 'ScpTraceToObjectEventMapper',
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpMessageReturnMapper class >> key [

	^ #messageReturn
]

{ #category : 'instance creation' }
ScpMessageReturnMapper >> from: anIterator to: anExecution [

	anExecution addMessageReturn: (anIterator next: 2)
]

{ #category : 'accessing' }
ScpMessageReturnMapper >> key [

	^ #messageReturn
]
