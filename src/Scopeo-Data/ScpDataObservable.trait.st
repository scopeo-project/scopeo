Trait {
	#name : #ScpDataObservable,
	#instVars : [
		'observers'
	],
	#category : #'Scopeo-Data'
}

{ #category : #events }
ScpDataObservable >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #events }
ScpDataObservable >> notifyMessage: aScpMessage [

	self observers do: [ :o | o onMessage: aScpMessage ]
]

{ #category : #events }
ScpDataObservable >> notifyStateUpdate: aScpAssignment [

	self observers do: [ :o | o onStateUpdate: aScpAssignment ]
]

{ #category : #accessing }
ScpDataObservable >> observers [

	^ observers ifNil: [ observers := OrderedCollection new ]
]

{ #category : #events }
ScpDataObservable >> removeObserver: anObserver [

	self observers remove: anObserver
]
