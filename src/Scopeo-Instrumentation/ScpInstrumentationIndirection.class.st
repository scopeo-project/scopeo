Class {
	#name : 'ScpInstrumentationIndirection',
	#superclass : 'ScpAbstractIndirection',
	#instVars : [
		'handler',
		'currentObject',
		'instrumentation'
	],
	#classInstVars : [
		'instance'
	],
	#category : 'Scopeo-Instrumentation',
	#package : 'Scopeo-Instrumentation'
}

{ #category : 'accessing' }
ScpInstrumentationIndirection class >> create [

	instance := self new.
	^ instance
]

{ #category : 'accessing' }
ScpInstrumentationIndirection class >> instance [

	^ instance
]

{ #category : 'parameters' }
ScpInstrumentationIndirection >> handler: aHandler [

	handler := aHandler
]

{ #category : 'accessing' }
ScpInstrumentationIndirection >> instrumentation: aInstrumentation [

	instrumentation := aInstrumentation
]

{ #category : 'handlers' }
ScpInstrumentationIndirection >> onCallOf: aSelector on: anObject with: aArguments [

	handler onCallOf: aSelector on: anObject with: aArguments
]

{ #category : 'handlers' }
ScpInstrumentationIndirection >> onMessage: aSelector to: anObject with: aArguments [

	handler onMessage: aSelector to: anObject with: aArguments.
	^ anObject perform: aSelector withArguments: aArguments.
]

{ #category : 'handlers' }
ScpInstrumentationIndirection >> onUpdateOf: aVariable of: anObject with: aValue [

	handler onUpdateOf: aVariable of: anObject with: aValue.
	anObject writeSlotNamed: aVariable value: aValue.
]
