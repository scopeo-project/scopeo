Class {
	#name : 'ScpTracesTest',
	#superclass : 'TestCase',
	#instVars : [
		'traces',
		'object'
	],
	#category : 'Scopeo-Traces-Tests',
	#package : 'Scopeo-Traces-Tests'
}

{ #category : 'running' }
ScpTracesTest >> setUp [

	super setUp.
	object := ScpExampleObjectA new
		exampleObjectB: ScpExampleObjectB new;
		yourself.	
	traces := ScpTraces new.
	traces withFilter: [ :filter | 
		filter matchPackages: (OTMatcher name: ScpExampleObjectA package name) 
	].
	traces startRecording.
	
]

{ #category : 'running' }
ScpTracesTest >> tearDown [

	super tearDown.
	traces stopRecording
]

{ #category : 'tests' }
ScpTracesTest >> testExampleAccessorCall [

	| messagesToAccessor |
	"Given"
	object exampleAccessorCall.

	"When"
	messagesToAccessor := traces storage fetch: (ScpIsMessage new and: (ScpMessageSelectorEq value: #exampleAccessor)).

	"Then"
	self assert: messagesToAccessor size equals: 1.
	self assert: messagesToAccessor first sender class equals: ScpExampleObjectA.
	self assert: messagesToAccessor first selector equals: #exampleAccessor.
	self assert: messagesToAccessor first receiver class equals: ScpExampleObjectB.
	self assert: messagesToAccessor first arguments size equals: 0.
]

{ #category : 'tests' }
ScpTracesTest >> testExampleInit [

	| stateUdpates objectA objectB |
	
	"Given"
	objectB := ScpExampleObjectB new.
	objectA := ScpExampleObjectA new
		exampleObjectB: objectB;
		yourself.

	"When"
	stateUdpates := traces storage fetch: ScpIsStateUpdate new.
	
	"Then"
	self assert: stateUdpates size equals: 1.
	self
		assert: stateUdpates first object class
		equals: ScpExampleObjectA.
	self assert: stateUdpates first variable equals: #exampleObjectB.
	self
		assert: stateUdpates first newValue class
		equals: ScpExampleObjectB
]

{ #category : 'tests' }
ScpTracesTest >> testExampleSetterCall [

	| stateUdpates messagesToSetter |
		
	"Given"
	object exampleSetterCall.
	
	"When"
	stateUdpates := traces storage fetch: ScpIsStateUpdate new.
	messagesToSetter := traces storage fetch:
		                    (ScpIsMessage new and:
			                     (ScpMessageSelectorEq value: #exampleSetter:)).
	
	"Then"
	self assert: stateUdpates size equals: 1.
	self
		assert: stateUdpates first object class
		equals: ScpExampleObjectB.
	self
		assert: stateUdpates first variable
		equals: #exampleInstanceVariable.
	self assert: stateUdpates first value equals: 'example'.

	self assert: messagesToSetter size equals: 1.
	self
		assert: messagesToSetter first sender class
		equals: ScpExampleObjectA.
	self assert: messagesToSetter first selector equals: #exampleSetter:.
	self
		assert: messagesToSetter first receiver class
		equals: ScpExampleObjectB.
	self assert: messagesToSetter first arguments size equals: 1.
	self assert: messagesToSetter first arguments first equals: 'example'
]

{ #category : 'tests' }
ScpTracesTest >> testExampleSetterCallInBlock [

	| stateUdpates messagesToSetter objectA objectB|
	"Given"
	objectB := ScpExampleObjectB new.
	objectA := ScpExampleObjectA new
		exampleObjectB: objectB;
		yourself.		
	objectA exampleSetterCallInBlock.

	"When"
	stateUdpates := traces storage fetch: ScpIsStateUpdate new.
	messagesToSetter := traces storage fetch:
		                    (ScpIsMessage new and:
			                     (ScpMessageSelectorEq value: #exampleSetter:)).
	"Then"
	self assert: stateUdpates size equals: 2.
	self
		assert: stateUdpates second object class
		equals: ScpExampleObjectB.
	self
		assert: stateUdpates second variable
		equals: #exampleInstanceVariable.
	self assert: stateUdpates second newValue equals: 'exampleInBlock'.

	self assert: messagesToSetter size equals: 1.
	self
		assert: messagesToSetter first sender class
		equals: ScpExampleObjectA.
	"self
		assert: messagesToSetter first senderSelector
		equals: #exampleSetterCallInBlock."
	self assert: messagesToSetter first selector equals: #exampleSetter:.
	self
		assert: messagesToSetter first receiver class
		equals: ScpExampleObjectB.
	self assert: messagesToSetter first arguments size equals: 1.
	self
		assert: messagesToSetter first arguments first
		equals: 'exampleInBlock'
]

{ #category : 'tests' }
ScpTracesTest >> testExampleSetterCallInBlockInBlock [

	| stateUdpates messagesToSetter objectA objectB|
	
	"Given"
	objectB := ScpExampleObjectB new.
	objectA := ScpExampleObjectA new
		exampleObjectB: objectB;
		yourself.		
	objectA exampleSetterCallInBlockInBlock.

	"When"
	stateUdpates := traces storage fetch: ScpIsStateUpdate new.
	messagesToSetter := traces storage fetch:
		                    (ScpIsMessage new and:
			                     (ScpMessageSelectorEq value: #exampleSetter:)).

	"Then"
	self assert: stateUdpates size equals: 2.
	self
		assert: stateUdpates second object class
		equals: ScpExampleObjectB.
	self
		assert: stateUdpates second variable
		equals: #exampleInstanceVariable.
	self
		assert: stateUdpates second newValue
		equals: 'exampleInBlockInBlock'.

	self assert: messagesToSetter size equals: 1.
	self
		assert: messagesToSetter first sender class
		equals: ScpExampleObjectA.
	"self assert: messagesToSetter first senderSelector equals: #exampleSetterCallInBlockInBlock."
	self assert: messagesToSetter first selector equals: #exampleSetter:.
	self
		assert: messagesToSetter first receiver class
		equals: ScpExampleObjectB.
	self assert: messagesToSetter first arguments size equals: 1.
	self
		assert: messagesToSetter first arguments first
		equals: 'exampleInBlockInBlock'
]

{ #category : 'tests' }
ScpTracesTest >> testExampleSetterObservableCall [

	| stateUdpates messagesToSetter |
		
	"Given"
	object exampleSetterObservableCall.
	
	"When"
	stateUdpates := traces storage fetch: ScpIsStateUpdate new.
	messagesToSetter := traces storage fetch:
		                    (ScpIsMessage new and:
			                     (ScpMessageSelectorEq value: #exampleSetterObservableSlot:)).
	
	"Then"
	self assert: stateUdpates size equals: 1.
	self
		assert: stateUdpates first object class
		equals: ScpExampleObjectB.
	self
		assert: stateUdpates first variable
		equals: #exampleInstanceObservable.
	self assert: stateUdpates first value equals: 'exampleObservable'.

	self assert: messagesToSetter size equals: 1.
	self
		assert: messagesToSetter first sender class
		equals: ScpExampleObjectA.
	self assert: messagesToSetter first selector equals: #exampleSetterObservableSlot:.
	self
		assert: messagesToSetter first receiver class
		equals: ScpExampleObjectB.
	self assert: messagesToSetter first arguments size equals: 1.
	self assert: messagesToSetter first arguments first equals: 'exampleObservable'
]
