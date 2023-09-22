Class {
	#name : #ScpScannedMessage,
	#superclass : #Object,
	#instVars : [
		'id',
		'sender',
		'method',
		'selector',
		'receiver',
		'arguments'
	],
	#category : #'Scopeo-Scanner-Data'
}

{ #category : #accessing }
ScpScannedMessage >> arguments [

	^ arguments
]

{ #category : #accessing }
ScpScannedMessage >> arguments: anObject [

	arguments := anObject
]

{ #category : #accessing }
ScpScannedMessage >> id [

	^ id
]

{ #category : #accessing }
ScpScannedMessage >> id: anObject [

	id := anObject
]

{ #category : #accessing }
ScpScannedMessage >> method [

	^ method
]

{ #category : #accessing }
ScpScannedMessage >> method: anObject [

	method := anObject
]

{ #category : #accessing }
ScpScannedMessage >> receiver [

	^ receiver
]

{ #category : #accessing }
ScpScannedMessage >> receiver: anObject [

	receiver := anObject
]

{ #category : #accessing }
ScpScannedMessage >> selector [

	^ selector
]

{ #category : #accessing }
ScpScannedMessage >> selector: anObject [

	selector := anObject
]

{ #category : #accessing }
ScpScannedMessage >> sender [

	^ sender
]

{ #category : #accessing }
ScpScannedMessage >> sender: anObject [

	sender := anObject
]
