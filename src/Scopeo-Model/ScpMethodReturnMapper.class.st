Class {
	#name : 'ScpMethodReturnMapper',
	#superclass : 'ScpTraceToObjectEventMapper',
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpMethodReturnMapper class >> key [

	^ #methodReturn
]

{ #category : 'instance creation' }
ScpMethodReturnMapper >> from: anIterator to: anExecution [

	anExecution addMethodReturn: (anIterator next: 2)	
]

{ #category : 'accessing' }
ScpMethodReturnMapper >> key [

	^ #methodReturn
]
