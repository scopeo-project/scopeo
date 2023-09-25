Class {
	#name : #ScopeoSystem,
	#superclass : #Object,
	#category : #'Scopeo-System-Launcher'
}

{ #category : #accessing }
ScopeoSystem class >> start [

	<script: 'self start'>
	ScpScannerImpl start.
	ScpDataBufferImpl start.
	ScpDataLoggerImpl start.
	ScpDataStorageImpl start
]

{ #category : #accessing }
ScopeoSystem class >> stop [

	<script: 'self stop'>
	ScpScannerImpl stop.
	ScpDataBufferImpl stop.
	ScpDataLoggerImpl stop.
	ScpDataStorageImpl stop.
	
	MolComponentManager cleanUp
]
