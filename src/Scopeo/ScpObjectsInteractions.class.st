Class {
	#name : #ScpObjectsInteractions,
	#superclass : #Object,
	#instVars : [
		'objects',
		'interactions'
	],
	#category : #'Scopeo-ObjectsEventsModel'
}

{ #category : #'instance creation' }
ScpObjectsInteractions class >> fromEvents: aEvents [

	| interactions objects |

	objects := Dictionary new.	
	interactions := aEvents select: [ :e | e isInteraction ].
	interactions do: [ :i | 
		objects at: i origin id put: i origin.
		objects at: i destination id put: i destination.
	].

	^ self new 
		interactions: interactions;
		objects: objects;
		yourself
]

{ #category : #initialization }
ScpObjectsInteractions >> initialize [

	objects := Dictionary new.
	interactions := OrderedCollection new
	
]

{ #category : #accessing }
ScpObjectsInteractions >> interactions [

	^ interactions
]

{ #category : #accessing }
ScpObjectsInteractions >> interactions: anObject [

	interactions := anObject
]

{ #category : #accessing }
ScpObjectsInteractions >> objects [

	^ objects
]

{ #category : #accessing }
ScpObjectsInteractions >> objects: anObject [

	objects := anObject
]
