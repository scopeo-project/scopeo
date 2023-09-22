Trait {
	#name : #ScpScannerDataEvents,
	#traits : 'MolComponentEvents',
	#classTraits : 'MolComponentEvents classTrait',
	#category : #'Scopeo-Scanner-Molecule'
}

{ #category : #events }
ScpScannerDataEvents >> instanceVariableAssigned: anScpScannedAssigment [

	"A new value has been assigned to an object instance variable."
]

{ #category : #events }
ScpScannerDataEvents >> messageSent: aMessage [

	"A message has been sent by an object during the execution of the program."
]
