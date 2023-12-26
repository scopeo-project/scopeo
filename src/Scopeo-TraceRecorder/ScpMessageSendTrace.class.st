Class {
	#name : 'ScpMessageSendTrace',
	#superclass : 'ScpTrace',
	#instVars : [
		'selector',
		'receiver',
		'arguments'
	],
	#category : 'Scopeo-TraceRecorder-Model',
	#package : 'Scopeo-TraceRecorder',
	#tag : 'Model'
}

{ #category : 'accessing' }
ScpMessageSendTrace >> arguments [

	^ arguments
]

{ #category : 'accessing' }
ScpMessageSendTrace >> arguments: anObject [

	arguments := anObject
]

{ #category : 'accessing' }
ScpMessageSendTrace >> asString [

	^  receiver asString 
		, ' ', selector asString 
		, ' with ', arguments asString
]

{ #category : 'testing' }
ScpMessageSendTrace >> isMessageSend [

	^ true
]

{ #category : 'accessing' }
ScpMessageSendTrace >> receiver [

	^ receiver
]

{ #category : 'accessing' }
ScpMessageSendTrace >> receiver: anObject [

	receiver := anObject
]

{ #category : 'accessing' }
ScpMessageSendTrace >> selector [

	^ selector
]

{ #category : 'accessing' }
ScpMessageSendTrace >> selector: anObject [

	selector := anObject
]
