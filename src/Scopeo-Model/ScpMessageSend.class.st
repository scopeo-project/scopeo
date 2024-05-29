Class {
	#name : 'ScpMessageSend',
	#superclass : 'ScpExpression',
	#instVars : [
		'receiver',
		'selector',
		'arguments'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpMessageSend >> arguments [

	^ arguments
]

{ #category : 'accessing' }
ScpMessageSend >> arguments: anObject [

	arguments := anObject
]

{ #category : 'accessing' }
ScpMessageSend >> receiver [

	^ receiver
]

{ #category : 'accessing' }
ScpMessageSend >> receiver: anObject [

	receiver := anObject
]

{ #category : 'accessing' }
ScpMessageSend >> selector [

	^ selector
]

{ #category : 'accessing' }
ScpMessageSend >> selector: anObject [

	selector := anObject
]
