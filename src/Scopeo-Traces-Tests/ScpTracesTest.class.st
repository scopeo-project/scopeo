Class {
	#name : 'ScpTracesTest',
	#superclass : 'TestCase',
	#category : 'Scopeo-Traces-Tests-',
	#package : 'Scopeo-Traces-Tests',
	#tag : ''
}

{ #category : 'tests' }
ScpTracesTest >> testScan [

	| traces scanResult tracesResult stateUdpateResults messageResults |
	traces := ScpTraces new.
	scanResult := traces scan: '
		|objectA objectB|
		objectB := ScpExampleObjectB new.
		objectA := ScpExampleObjectA new
			exampleObjectB: objectB;
			yourself.		
		objectA exampleMethod.
	'.

	tracesResult := traces fetch: ScpAll new.
	stateUdpateResults := traces fetch: ScpIsStateUpdate new.
	messageResults := traces fetch:
		                  (ScpIsMessage new and:
			                   (ScpMessageSelectorEq value: #exampleSetter:)).


	self assert: scanResult equals: 'example'.
	self assert: tracesResult size equals: 13.

	self assert: stateUdpateResults size equals: 2.
	self
		assert: stateUdpateResults first object class
		equals: ScpExampleObjectA.
	self
		assert: stateUdpateResults first variable name
		equals: #exampleObjectB.
	self
		assert: stateUdpateResults first newValue class
		equals: ScpExampleObjectB.
	self
		assert: stateUdpateResults second object class
		equals: ScpExampleObjectB.
	self
		assert: stateUdpateResults second variable name
		equals: #exampleInstanceVariable.
	self assert: stateUdpateResults second newValue equals: 'example'.

	self assert: messageResults size equals: 1.
	self
		assert: messageResults first sender class
		equals: ScpExampleObjectA.
	self
		assert: messageResults first senderSelector
		equals: #exampleMethod.
	self
		assert: messageResults first receiver class
		equals: ScpExampleObjectB.
	self assert: messageResults first arguments size equals: 1.
	self assert: messageResults first arguments first equals: 'example'
]
