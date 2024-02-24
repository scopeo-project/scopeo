Class {
	#name : #ScpMethodCallTrace,
	#superclass : #ScpTrace,
	#instVars : [
		'sender',
		'selector',
		'receiver',
		'arguments'
	],
	#category : 'Scopeo-TraceRecorder-Model'
}

{ #category : #accessing }
ScpMethodCallTrace >> arguments [

	^ arguments
]

{ #category : #accessing }
ScpMethodCallTrace >> arguments: anObject [

	arguments := anObject
]

{ #category : #printing }
ScpMethodCallTrace >> asString [

	^ sender asString 
		, ' sent ', selector asString
		, ' to ', receiver asString 
		, ' with ', arguments asString
]

{ #category : #testing }
ScpMethodCallTrace >> isMethodCall [

	^ true
]

{ #category : #accessing }
ScpMethodCallTrace >> receiver [

	^ receiver
]

{ #category : #accessing }
ScpMethodCallTrace >> receiver: anObject [

	receiver := anObject
]

{ #category : #accessing }
ScpMethodCallTrace >> selector [

	^ selector
]

{ #category : #accessing }
ScpMethodCallTrace >> selector: anObject [

	selector := anObject
]

{ #category : #accessing }
ScpMethodCallTrace >> sender [

	^ sender
]

{ #category : #accessing }
ScpMethodCallTrace >> sender: anObject [

	sender := anObject
]
