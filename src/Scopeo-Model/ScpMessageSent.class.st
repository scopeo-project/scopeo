Class {
	#name : 'ScpMessageSent',
	#superclass : 'ScpMessageEvent',
	#instVars : [
		'receiver'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpMessageSent >> receiver [

	^ receiver
]

{ #category : 'accessing' }
ScpMessageSent >> receiver: anObject [

	receiver := anObject
]

{ #category : 'accessing' }
ScpMessageSent >> sender [
	
	^ self object
]
