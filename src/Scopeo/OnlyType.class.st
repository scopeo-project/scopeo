Class {
	#name : #OnlyType,
	#superclass : #TypePredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
OnlyType >> verify: aEvent scope: aScope events: aEvents [

	^ aEvent isInteraction 
		ifTrue: [ aEvent origin get class = classObject and: [ aEvent destination get class = classObject  ] ]
		ifFalse: [ aEvent object get class = classObject ] 
]
