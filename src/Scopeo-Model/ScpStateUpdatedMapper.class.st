Class {
	#name : 'ScpStateUpdatedMapper',
	#superclass : 'ScpTraceToObjectEventMapper',
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpStateUpdatedMapper class >> key [

	^ #assignment
]

{ #category : 'instance creation' }
ScpStateUpdatedMapper >> from: anIterator to: anExecution [

	anExecution addStateUpdated: (
		ScpStateUpdated new
			source: (anIterator next);
			variable: (anIterator next);
			object: (anIterator next);
			value: (anIterator next);
			yourself
	)
]

{ #category : 'accessing' }
ScpStateUpdatedMapper >> key [

	^ #assignment
]
