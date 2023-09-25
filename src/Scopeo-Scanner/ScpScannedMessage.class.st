Class {
	#name : #ScpScannedMessage,
	#superclass : #Object,
	#instVars : [
		'id',
		'sender',
		'senderSelector',
		'selector',
		'receiver',
		'arguments'
	],
	#category : #'Scopeo-Scanner'
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
ScpScannedMessage >> printString [

	^ sender printString 
		, ' in ' , senderSelector printString 
		, ' sent ' , selector printString 
		, ' to ' , receiver printString 
		, ' with ', arguments printString  
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

{ #category : #accessing }
ScpScannedMessage >> senderSelector [

	^ senderSelector
]

{ #category : #accessing }
ScpScannedMessage >> senderSelector: anObject [

	senderSelector := anObject
]
