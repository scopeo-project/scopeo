Class {
	#name : #Scopeo,
	#superclass : #Object,
	#category : #Scopeo
}

{ #category : #accessing }
Scopeo class >> start [

	<script: 'self start'>

	ScpDataStorage start.
	ScpDataFilter start.
	ScpDataScanner start.
	
]

{ #category : #accessing }
Scopeo class >> stop [

	<script: 'self stop'>
	
	ScpDataStorage stop.
	ScpDataFilter stop.
	ScpDataScanner stop.

	MolComponentManager cleanUp
]
