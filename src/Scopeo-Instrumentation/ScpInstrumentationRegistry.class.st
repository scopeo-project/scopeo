Class {
	#name : 'ScpInstrumentationRegistry',
	#superclass : 'Object',
	#instVars : [
		'instrumentations',
		'instrumentedMethods'
	],
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

{ #category : 'private' }
ScpInstrumentationRegistry >> addMethod: aMethod [

	(self instrumentedMethods includes: aMethod) ifTrue: [
		self error: 'Method ' , aMethod name , ' already instrumented' ].
	self instrumentedMethods add: aMethod name
]

{ #category : 'accessing' }
ScpInstrumentationRegistry >> at: anIdentifier [

	^ instrumentations at: anIdentifier ifAbsent: [
		self error: 'Code instrumented without a matching instrumentation in the registry.'
	]
]

{ #category : 'initialization' }
ScpInstrumentationRegistry >> initialize [

	instrumentations := Dictionary new.
	instrumentedMethods := IdentitySet new

]

{ #category : 'accessing' }
ScpInstrumentationRegistry >> instrumentations [

	^ instrumentations values
]

{ #category : 'accessing' }
ScpInstrumentationRegistry >> instrumentedMethods [

	^ instrumentedMethods ifNil: [
		  instrumentedMethods := IdentitySet new ]
]

{ #category : 'private' }
ScpInstrumentationRegistry >> register: anInstrumentation [

	^ instrumentations at: anInstrumentation hash ifAbsentPut: [ anInstrumentation ]
]

{ #category : 'private' }
ScpInstrumentationRegistry >> removeMethod: aMethod [

	instrumentedMethods remove: aMethod name ifAbsent: [ "Do nothing" ]
]

{ #category : 'private' }
ScpInstrumentationRegistry >> unregister: anInstrumentation [

	^ instrumentations
		  removeKey: anInstrumentation hash
		  ifAbsent: [ "Do nothing" ]
]
