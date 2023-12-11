Class {
	#name : 'ScpMessage',
	#superclass : 'ScpTrace',
	#instVars : [
		'id',
		'sender',
		'selector',
		'receiver',
		'arguments'
	],
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'accessing' }
ScpMessage >> arguments [

	^ arguments
]

{ #category : 'accessing' }
ScpMessage >> arguments: anObject [

	arguments := anObject
]

{ #category : 'accessing' }
ScpMessage >> id [

	^ id
]

{ #category : 'accessing' }
ScpMessage >> id: anObject [

	id := anObject
]

{ #category : 'testing' }
ScpMessage >> isMessage [

	^ true
]

{ #category : 'accessing' }
ScpMessage >> printString [

	^ sender printString 
		, ' sent ' , selector printString 
		, ' to ' , receiver printString 
		, ' with ', arguments printString  
]

{ #category : 'accessing' }
ScpMessage >> receiver [

	^ receiver
]

{ #category : 'accessing' }
ScpMessage >> receiver: anObject [

	receiver := anObject
]

{ #category : 'accessing' }
ScpMessage >> selector [

	^ selector
]

{ #category : 'accessing' }
ScpMessage >> selector: anObject [

	selector := anObject
]

{ #category : 'accessing' }
ScpMessage >> sender [

	^ sender
]

{ #category : 'accessing' }
ScpMessage >> sender: anObject [

	sender := anObject
]
