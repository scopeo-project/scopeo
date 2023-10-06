Trait {
	#name : #ScpScannerDataEvents,
	#traits : 'MolComponentEvents',
	#classTraits : 'MolComponentEvents classTrait',
	#category : #'Scopeo-DataScanner'
}

{ #category : #events }
ScpScannerDataEvents >> instanceVariableAssigned: anScpScannedAssigment [

	"A new value has been assigned to an object instance variable."
]

{ #category : #events }
ScpScannerDataEvents >> messageSent: aMessage [

	"A message has been sent by an object during the execution of the program."
]

{ #category : #events }
ScpScannerDataEvents >> scanFinished [
	"The program scanning has been finished."
]

{ #category : #events }
ScpScannerDataEvents >> scanStarted [
	"A program scanning has been started."
]
