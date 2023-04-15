Class {
	#name : #ObjectsEvents,
	#superclass : #Object,
	#instVars : [
		'events',
		'objects'
	],
	#category : #'Scopeo-Model'
}

{ #category : #accessing }
ObjectsEvents >> events [

	^ events
]

{ #category : #accessing }
ObjectsEvents >> events: aEvents [

	events := aEvents.
	events do: [ :e | self objectsFromEvent: e ]
	
]

{ #category : #'target resize' }
ObjectsEvents >> filter: aPredicate [

	^ self class new
		events: (events select: [ :e | aPredicate verify: e in: self ]);
		yourself.
]

{ #category : #initialization }
ObjectsEvents >> initialize [

	events := OrderedCollection new.
	objects := Set new.
]

{ #category : #accessing }
ObjectsEvents >> objects [

	^ objects
]

{ #category : #accessing }
ObjectsEvents >> objectsFromEvent: aEvent [

	aEvent isInteraction ifTrue: [ 
		objects add: aEvent origin.
		objects add: aEvent destination.
	].
	aEvent isStateEvent ifTrue: [ objects add: aEvent object ]
]
