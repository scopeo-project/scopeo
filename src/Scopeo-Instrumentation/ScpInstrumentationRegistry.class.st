Class {
	#name : 'ScpInstrumentationRegistry',
	#superclass : 'OrderedCollection',
	#classInstVars : [
		'instance'
	],
	#category : 'Scopeo-Instrumentation',
	#package : 'Scopeo-Instrumentation'
}

{ #category : 'accessing' }
ScpInstrumentationRegistry class >> instance [

	^ instance ifNil: [ instance := self new ]
]
