Class {
	#name : #OnlyType,
	#superclass : #TypePredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
OnlyType >> verify: aEvent in: aEvents [

	^ aEvent isInteraction 
		ifTrue: [ aEvent origin class = classObject and: [ aEvent destination class = classObject  ] ]
		ifFalse: [ aEvent object class = classObject ] 
]
