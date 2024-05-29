Class {
	#name : 'ScpOldScopeObjects',
	#superclass : 'Object',
	#instVars : [
		'objects'
	],
	#category : 'Scopeo-Model-Deprecated',
	#package : 'Scopeo-Model',
	#tag : 'Deprecated'
}

{ #category : 'accessing' }
ScpOldScopeObjects >> at: aLabel [

	^ objects at: aLabel
]

{ #category : 'services' }
ScpOldScopeObjects >> at: aLabel putAll: anObjectCollection [

	objects
		at: aLabel
		ifPresent: [ :items | items addAll: anObjectCollection ]
		ifAbsentPut: [ anObjectCollection ]
]

{ #category : 'initialization' }
ScpOldScopeObjects >> initialize [

	objects := Dictionary new
]

{ #category : 'accessing' }
ScpOldScopeObjects >> keys [

	^ objects keys
]

{ #category : 'services' }
ScpOldScopeObjects >> remove: aLabel [

	objects removeKey: aLabel
]
