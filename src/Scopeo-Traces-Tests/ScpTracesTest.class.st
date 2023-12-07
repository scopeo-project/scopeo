Class {
	#name : 'ScpTracesTest',
	#superclass : 'TestCase',
	#instVars : [
		'traces'
	],
	#category : 'Scopeo-Traces-Tests',
	#package : 'Scopeo-Traces-Tests'
}

{ #category : 'running' }
ScpTracesTest >> setUp [

	super setUp.
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

	| stateUdpates messagesToAccessor objectA objectB|
	"Given"
	objectB := ScpExampleObjectB new.
	objectA := ScpExampleObjectA new
		exampleObjectB: objectB;
		yourself.		
	objectA exampleAccessorCall.

	"When"
	stateUdpates := traces storage fetch: ScpIsStateUpdate new.
	messagesToAccessor := traces storage fetch: (ScpIsMessage new and: (ScpMessageSelectorEq value: #exampleAccessor)).

	"Then"
	self assert: stateUdpates size equals: 1.
	
	self assert: messagesToAccessor size equals: 1.
	self assert: messagesToAccessor first sender class equals: ScpExampleObjectA.
	self assert: messagesToAccessor first senderSelector equals: #exampleAccessorCall.
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
	stateUdpates := traces fetch: ScpIsStateUpdate new.
	
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

	| stateUdpates messagesToSetter objectA objectB|
		
	"Given"
	objectB := ScpExampleObjectB new.
	objectA := ScpExampleObjectA new
		exampleObjectB: objectB;
		yourself.		
	objectA exampleSetterCall.
	
	"When"
	stateUdpates := traces fetch: ScpIsStateUpdate new.
	messagesToSetter := traces fetch:
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
	self assert: stateUdpates second newValue equals: 'example'.

	self assert: messagesToSetter size equals: 1.
	self
		assert: messagesToSetter first sender class
		equals: ScpExampleObjectA.
	self
		assert: messagesToSetter first senderSelector
		equals: #exampleSetterCall.
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
	stateUdpates := traces fetch: ScpIsStateUpdate new.
	messagesToSetter := traces fetch:
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
	self
		assert: messagesToSetter first senderSelector
		equals: #exampleSetterCallInBlock.
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
	stateUdpates := traces fetch: ScpIsStateUpdate new.
	messagesToSetter := traces fetch:
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
	self assert: messagesToSetter first senderSelector equals: #exampleSetterCallInBlockInBlock.
	self assert: messagesToSetter first selector equals: #exampleSetter:.
	self
		assert: messagesToSetter first receiver class
		equals: ScpExampleObjectB.
	self assert: messagesToSetter first arguments size equals: 1.
	self
		assert: messagesToSetter first arguments first
		equals: 'exampleInBlockInBlock'
]
