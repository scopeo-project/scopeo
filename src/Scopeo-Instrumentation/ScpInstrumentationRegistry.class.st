Class {
	#name : 'ScpInstrumentationRegistry',
	#superclass : 'Dictionary',
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
