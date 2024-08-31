Class {
	#name : 'ScpTraceToObjectEventMapper',
	#superclass : 'Object',
	#instVars : [
		'execution'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'testing' }
ScpTraceToObjectEventMapper class >> isAbstract [

	^ self == ScpTraceToObjectEventMapper
]

{ #category : 'accessing' }
ScpTraceToObjectEventMapper class >> key [

	self subclassResponsibility
]

{ #category : 'instance creation' }
ScpTraceToObjectEventMapper >> from: anIterator to: anExecution [

	self subclassResponsibility
]
