Class {
	#name : #ScpObjectsEvents,
	#superclass : #Object,
	#instVars : [
		'events',
		'objects'
	],
	#category : #'Scopeo-ObjectsEventsModel'
}

{ #category : #accessing }
ScpObjectsEvents >> events [

	^ events
]

{ #category : #accessing }
ScpObjectsEvents >> events: aEvents [

	events := aEvents.
	events do: [ :e | self objectsFromEvent: e ]
	
]

{ #category : #'target resize' }
ScpObjectsEvents >> filter: aPredicate scope: aScope [

	^ self class new
		events: (events select: [ :e | aPredicate verify: e scope: aScope events: self ]);
		yourself.
]

{ #category : #initialization }
ScpObjectsEvents >> initialize [

	events := OrderedCollection new.
	objects := Set new.
]

{ #category : #accessing }
ScpObjectsEvents >> objects [

	^ objects
]

{ #category : #accessing }
ScpObjectsEvents >> objectsFromEvent: aEvent [

	aEvent isInteraction ifTrue: [ 
		objects add: aEvent origin.
		objects add: aEvent destination.
	].
	aEvent isStateEvent ifTrue: [ objects add: aEvent object ]
]
