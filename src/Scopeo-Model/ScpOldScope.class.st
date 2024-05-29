Class {
	#name : 'ScpOldScope',
	#superclass : 'Object',
	#instVars : [
		'objects',
		'events'
	],
	#category : 'Scopeo-Model-Deprecated',
	#package : 'Scopeo-Model',
	#tag : 'Deprecated'
}

{ #category : 'accessing' }
ScpOldScope >> events [

	^ events
]

{ #category : 'initialization' }
ScpOldScope >> initialize [

	objects := ScpOldScopeObjects new.
	events := ScpOldScopeEvents new.
]

{ #category : 'accessing' }
ScpOldScope >> objects [

	^ objects
]
