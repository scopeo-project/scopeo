Class {
	#name : 'ScpOldScopeEvents',
	#superclass : 'Object',
	#instVars : [
		'events'
	],
	#category : 'Scopeo-Model-Deprecated',
	#package : 'Scopeo-Model',
	#tag : 'Deprecated'
}

{ #category : 'accessing' }
ScpOldScopeEvents >> at: aLabel [

	^ events at: aLabel
]

{ #category : 'services' }
ScpOldScopeEvents >> at: aLabel putAll: aScpEventCollection [

	events
		at: aLabel
		ifPresent: [ :items | items addAll: aScpEventCollection ]
		ifAbsentPut: [ aScpEventCollection ]
]

{ #category : 'initialization' }
ScpOldScopeEvents >> initialize [

	events := Dictionary new.
]

{ #category : 'accessing' }
ScpOldScopeEvents >> keys [

	^ events keys
]

{ #category : 'services' }
ScpOldScopeEvents >> remove: aLabel [

	events removeKey: aLabel
]
