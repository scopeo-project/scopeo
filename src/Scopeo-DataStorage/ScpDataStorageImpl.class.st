Class {
	#name : #ScpDataStorageImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScpDataStorage + ScpScannerDataEvents',
	#classTraits : 'ScpDataStorage classTrait + ScpScannerDataEvents classTrait',
	#category : #'Scopeo-DataStorage'
}

{ #category : #events }
ScpDataStorageImpl >> instanceVariableAssigned: anScpScannedAssigment [
	"A new value has been assigned to an object instance variable."

	Transcript show: 'message send scanned'
]

{ #category : #events }
ScpDataStorageImpl >> messageSent: aMessage [
	"A message has been sent by an object during the execution of the program."

	self halt.

	Transcript show: 'message send scanned'
]
