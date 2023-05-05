Class {
	#name : #WithType,
	#superclass : #TypePredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
WithType >> verify: aEvent in: aEvents [

	^ aEvent isInteraction 
		ifTrue: [ aEvent origin class = classObject or: [ aEvent destination class = classObject  ] ]
		ifFalse: [ aEvent object class = classObject ] 
]
