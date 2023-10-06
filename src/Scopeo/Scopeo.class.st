Class {
	#name : #Scopeo,
	#superclass : #Object,
	#category : #Scopeo
}

{ #category : #accessing }
Scopeo class >> start [

	<script: 'self start'>
	ScpDataLoggerImpl start.
	ScpDataStorageImpl start.
	ScpDataBufferImpl start.
	ScpScannerImpl start.
	
]

{ #category : #accessing }
Scopeo class >> stop [

	<script: 'self stop'>
	ScpDataLoggerImpl stop.
	ScpDataStorageImpl stop.
	ScpDataBufferImpl stop.
	ScpScannerImpl stop.

	MolComponentManager cleanUp
]
