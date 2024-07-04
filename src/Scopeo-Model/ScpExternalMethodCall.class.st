Class {
	#name : 'ScpExternalMethodCall',
	#superclass : 'ScpMethodCall',
	#instVars : [
		'sender'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpExternalMethodCall class >> uml: aStream [

	super uml: aStream.
	aStream cr << self name << ' --* ' << ScpAbstractObject name.			
	
]

{ #category : 'accessing' }
ScpExternalMethodCall >> sender: anObject [

	sender := anObject
]
