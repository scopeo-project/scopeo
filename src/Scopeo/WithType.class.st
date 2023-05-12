Class {
	#name : #WithType,
	#superclass : #TypePredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
WithType >> verify: aEvent scope: aScope events: aEvents [

	^ aEvent isInteraction 
		ifTrue: [ aEvent origin class = classObject or: [ aEvent destination class = classObject  ] ]
		ifFalse: [ aEvent object class = classObject ] 
]
