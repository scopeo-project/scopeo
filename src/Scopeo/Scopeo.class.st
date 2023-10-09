Class {
	#name : #Scopeo,
	#superclass : #Object,
	#category : #Scopeo
}

{ #category : #accessing }
Scopeo class >> start [

	<script: 'self start'>

	ScpDataStorageImpl start.
	ScpDataBufferImpl start.
	ScpScannerImpl start.
	
]

{ #category : #accessing }
Scopeo class >> stop [

	<script: 'self stop'>
	
	ScpDataStorageImpl stop.
	ScpDataBufferImpl stop.
	ScpScannerImpl stop.

	MolComponentManager cleanUp
]
