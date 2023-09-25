Trait {
	#name : #ScpDataBufferEvents,
	#traits : 'MolComponentEvents',
	#classTraits : 'MolComponentEvents classTrait',
	#category : #'Scopeo-DataBuffer'
}

{ #category : #events }
ScpDataBufferEvents >> instanceVariableAssigned: anScpScannedAssigment [
	"A new value has been assigned to an object instance variable."
]

{ #category : #events }
ScpDataBufferEvents >> messageSent: aScpScannedMessage [
	"A message has been sent by an object during the execution of the program."

	
]
