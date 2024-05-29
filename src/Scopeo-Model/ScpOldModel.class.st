Class {
	#name : 'ScpOldModel',
	#superclass : 'Object',
	#instVars : [
		'scope',
		'search',
		'data'
	],
	#category : 'Scopeo-Model-Deprecated',
	#package : 'Scopeo-Model',
	#tag : 'Deprecated'
}

{ #category : 'services' }
ScpOldModel >> addEvents: anEventsCollection toScope: aLabel [

	scope events at: aLabel putAll: anEventsCollection
]

{ #category : 'services' }
ScpOldModel >> addObjects: anObjectCollection toScope: aLabel [

	scope objects at: aLabel putAll: anObjectCollection
]

{ #category : 'services' }
ScpOldModel >> getEventsFromScope: aLabel [

	^ scope events at: aLabel
]

{ #category : 'as yet unclassified' }
ScpOldModel >> getEventsScopes [

	^ scope events keys
]

{ #category : 'services' }
ScpOldModel >> getObjectsFromScope: aLabel [

	^ scope objects at: aLabel
]

{ #category : 'as yet unclassified' }
ScpOldModel >> getObjectsScopes [

	^ scope objects keys
]

{ #category : 'services' }
ScpOldModel >> initialize [

	data := ScopeoTraceRecorder new.

	scope := ScpOldScope new.
	search := ScpOldSearch new
		          mediator: self;
		data: data;
		          yourself
]

{ #category : 'services' }
ScpOldModel >> removeEventsFromScope: aLabel [

	scope events remove: aLabel
]

{ #category : 'services' }
ScpOldModel >> removeObjectsFromScope: aLabel [

	scope objects remove: aLabel
]

{ #category : 'public api' }
ScpOldModel >> scan: aProgram [

	^ data scan: aProgram
]

{ #category : 'services' }
ScpOldModel >> search: aPredicate [

	^ search search: aPredicate
]
