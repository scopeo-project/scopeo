Class {
	#name : 'ScpMessageReceived',
	#superclass : 'ScpMessageEvent',
	#instVars : [
		'sender'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpMessageReceived class >> uml: aStream [

	super uml: aStream.
	aStream cr << self name << ' --* ' << ScpAbstractObject name.			
	
]

{ #category : 'accessing' }
ScpMessageReceived >> receiver [
	
	^ self object
]

{ #category : 'accessing' }
ScpMessageReceived >> sender [
	
	^ sender
]

{ #category : 'accessing' }
ScpMessageReceived >> sender: anObject [

	sender := anObject
]
