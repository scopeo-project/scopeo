Class {
	#name : 'ScpModel',
	#superclass : 'Object',
	#instVars : [
		'scope',
		'search',
		'data'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'services' }
ScpModel >> addEvents: anEventsCollection toScope: aLabel [

	scope events at: aLabel putAll: anEventsCollection
]

{ #category : 'services' }
ScpModel >> addObjects: anObjectCollection toScope: aLabel [

	scope objects at: aLabel putAll: anObjectCollection
]

{ #category : 'services' }
ScpModel >> getEventsFromScope: aLabel [

	^ scope events at: aLabel
]

{ #category : 'as yet unclassified' }
ScpModel >> getEventsScopes [

	^ scope events keys
]

{ #category : 'services' }
ScpModel >> getObjectsFromScope: aLabel [

	^ scope objects at: aLabel
]

{ #category : 'as yet unclassified' }
ScpModel >> getObjectsScopes [

	^ scope objects keys
]

{ #category : 'services' }
ScpModel >> initialize [

	data := ScpData new.

	scope := ScpScope new.
	search := ScpSearch new
		          mediator: self;
		data: data;
		          yourself
]

{ #category : 'services' }
ScpModel >> removeEventsFromScope: aLabel [

	scope events remove: aLabel
]

{ #category : 'services' }
ScpModel >> removeObjectsFromScope: aLabel [

	scope objects remove: aLabel
]

{ #category : 'public api' }
ScpModel >> scan: aProgram [

	^ data scan: aProgram
]

{ #category : 'services' }
ScpModel >> search: aPredicate [

	^ search search: aPredicate
]
