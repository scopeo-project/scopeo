Trait {
	#name : #ScpDataObserver,
	#category : #'Scopeo-Data'
}

{ #category : #events }
ScpDataObserver >> forget: aScpObservable [

	aScpObservable removeObserver: self
]

{ #category : #events }
ScpDataObserver >> observe: aScpObservable [

	aScpObservable addObserver: self
]

{ #category : #events }
ScpDataObserver >> onMessage: aScpMessage [

	"A message has been sent by an object during the execution of the program."
	self explicitRequirement
]

{ #category : #events }
ScpDataObserver >> onStateUpdate: aScpStateUpdate [
"A new value has been assigned to an object instance variable."
	self explicitRequirement
]
