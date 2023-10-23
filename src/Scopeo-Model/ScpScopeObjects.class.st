Class {
	#name : #ScpScopeObjects,
	#superclass : #Object,
	#instVars : [
		'objects'
	],
	#category : #'Scopeo-Model'
}

{ #category : #accessing }
ScpScopeObjects >> at: aLabel [

	objects at: aLabel
]

{ #category : #services }
ScpScopeObjects >> at: aLabel putAll: anObjectCollection [

	objects
		at: aLabel
		ifPresent: [ :items | items addAll: anObjectCollection ]
		ifAbsentPut: [ anObjectCollection asOrderedCollection ]
]

{ #category : #initialization }
ScpScopeObjects >> initialize [

	objects := Dictionary new
]

{ #category : #accessing }
ScpScopeObjects >> keys [

	^ objects keys
]

{ #category : #services }
ScpScopeObjects >> remove: aLabel [

	objects removeKey: aLabel
]
