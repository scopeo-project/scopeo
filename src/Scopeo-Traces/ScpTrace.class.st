Class {
	#name : 'ScpTrace',
	#superclass : 'Object',
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'testing' }
ScpTrace class >> isAbstract [

	^ self == ScpTrace
]

{ #category : 'testing' }
ScpTrace >> isMessage [

	^ false
]

{ #category : 'testing' }
ScpTrace >> isStateUpdate [

	^ false
]
