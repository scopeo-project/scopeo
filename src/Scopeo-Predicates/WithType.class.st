Class {
	#name : #WithType,
	#superclass : #ScpTypePredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #'target resize' }
WithType >> verify: aEvent scope: aScope events: aEvents [

	^ aEvent isInteraction 
		ifTrue: [ aEvent origin get class = classObject or: [ aEvent destination get class = classObject  ] ]
		ifFalse: [ aEvent object get class = classObject ] 
]
