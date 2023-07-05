Class {
	#name : #OnlyType,
	#superclass : #ScpTypePredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #'target resize' }
OnlyType >> verify: aEvent scope: aScope events: aEvents [

	^ aEvent isInteraction 
		ifTrue: [ aEvent origin get class = classObject and: [ aEvent destination get class = classObject  ] ]
		ifFalse: [ aEvent object get class = classObject ] 
]
