Class {
	#name : #ScpInstrumentationRegistry,
	#superclass : #Object,
	#instVars : [
		'instrumentedMethods',
		'instrumentations'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Scopeo-Instrumentation'
}

{ #category : #accessing }
ScpInstrumentationRegistry class >> instance [

	^ instance ifNil: [ instance := self new ]
]

{ #category : #private }
ScpInstrumentationRegistry >> addMethod: aMethod [

	(self instrumentedMethods includes: aMethod) ifTrue: [
		self error: 'Method ' , aMethod name , ' already instrumented' ].
	self instrumentedMethods add: aMethod name
]

{ #category : #accessing }
ScpInstrumentationRegistry >> at: anIdentifier [

	^ self instrumentations at: anIdentifier ifAbsent: [
		self error: 'Code instrumented without a matching instrumentation in the registry.'
	]
]

{ #category : #accessing }
ScpInstrumentationRegistry >> instrumentations [

	^ instrumentations values
]

{ #category : #accessing }
ScpInstrumentationRegistry >> instrumentedMethods [

	^ instrumentedMethods ifNil: [
		  instrumentedMethods := IdentitySet new ]
]

{ #category : #private }
ScpInstrumentationRegistry >> register: anInstrumentation [

	^ instrumentations at: anInstrumentation hash ifAbsentPut: [ anInstrumentation ]
]

{ #category : #private }
ScpInstrumentationRegistry >> removeMethod: aMethod [

	self instrumentedMethods removeKey: aMethod name ifAbsent: [ "Do nothing" ]
]

{ #category : #private }
ScpInstrumentationRegistry >> unregister: anInstrumentation [

	^ instrumentations
		  removeKey: anInstrumentation hash
		  ifAbsent: [ "Do nothing" ]
]
