Class {
	#name : #ScopeoSystem,
	#superclass : #Object,
	#category : #'Scopeo-System'
}

{ #category : #accessing }
ScopeoSystem class >> start [

	<script: 'self start'>

	ScpScannerImpl start.
	ScpDataStorageImpl start
]

{ #category : #accessing }
ScopeoSystem class >> stop [

	<script: 'self stop'>
	ScpScannerImpl stop.
	ScpDataStorageImpl stop
]
