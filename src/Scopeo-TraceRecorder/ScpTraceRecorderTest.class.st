Class {
	#name : 'ScpTraceRecorderTest',
	#superclass : 'TestCase',
	#instVars : [
		'traceRecorder',
		'objectA',
		'objectB'
	],
	#category : 'Scopeo-TraceRecorder-Tests',
	#package : 'Scopeo-TraceRecorder',
	#tag : 'Tests'
}

{ #category : 'running' }
ScpTraceRecorderTest >> setUp [

	super setUp.
	objectB := ScpExampleObjectB new.
	objectA := ScpExampleObjectA new
		           exampleObjectB: objectB;
		           yourself.
	traceRecorder := ScopeoTraceRecorder new.
	traceRecorder seekMethodsToRecord: [ :method |
		method matchPackages: (OTMatcher name: ScpExampleObjectA package name)
	].
	traceRecorder switchOn.
	traceRecorder startRecording.
]

{ #category : 'running' }
ScpTraceRecorderTest >> tearDown [

	super tearDown.
	traceRecorder stopRecording.
	traceRecorder switchOff
]

{ #category : 'tests' }
ScpTraceRecorderTest >> testExampleAccessorCall [

	| traces |
	objectA exampleAccessorCall.

	traces := traceRecorder storage traces.

	self assert: traces size equals: 3.
	self assert: traces first isMethodCall equals: true.
	self assert: traces first sender identicalTo: self.
	self assert: traces first selector equals: #exampleAccessorCall.
	self assert: traces first receiver identicalTo: objectA.
	self assert: traces first arguments isEmpty equals: true.

	self assert: traces second isMessageSend equals: true.
	self assert: traces second selector equals: #exampleAccessor.
	self assert: traces second receiver identicalTo: objectB.
	self assert: traces second arguments isEmpty equals: true.

	self assert: traces third isMethodCall equals: true.
	self assert: traces third sender identicalTo: objectA.
	self assert: traces third selector equals: #exampleAccessor.
	self assert: traces third receiver identicalTo: objectB.
	self assert: traces third arguments isEmpty equals: true
]

{ #category : 'tests' }
ScpTraceRecorderTest >> testExampleMethod [

	objectA exampleMethod
]

{ #category : 'tests' }
ScpTraceRecorderTest >> testExampleSelfCall [

	| traces |
	objectB exampleSelfCall.

	traces := traceRecorder storage traces.

	self assert: traces size equals: 4.
	self assert: traces first isMethodCall equals: true.
	self assert: traces first sender identicalTo: self.
	self assert: traces first selector equals: #exampleSelfCall.
	self assert: traces first receiver identicalTo: objectB.
	self assert: traces first arguments isEmpty equals: true.

	self assert: traces second isMessageSend equals: true.
	self assert: traces second selector equals: #exampleSetter:.
	self assert: traces second receiver identicalTo: objectB.
	self assert: traces second arguments size equals: 1.
	self assert: traces second arguments first equals: 'exampleSelf'.

	self assert: traces third isMethodCall equals: true.
	self assert: traces third sender identicalTo: objectB.
	self assert: traces third selector equals: #exampleSetter:.
	self assert: traces third receiver identicalTo: objectB.
	self assert: traces third arguments size equals: 1.
	self assert: traces third arguments first equals: 'exampleSelf'.

	self assert: traces fourth isAssignment equals: true.
	self assert: traces fourth object identicalTo: objectB.
	self assert: traces fourth variable equals: #exampleInstanceVariable.
	self assert: traces fourth value equals: 'exampleSelf'
]

{ #category : 'tests' }
ScpTraceRecorderTest >> testExampleSetterCall [

	| traces |
	objectA exampleSetterCall.

	traces := traceRecorder storage traces.

	self assert: traces size equals: 4.
	self assert: traces first isMethodCall equals: true.
	self assert: traces first sender identicalTo: self.
	self assert: traces first selector equals: #exampleSetterCall.
	self assert: traces first receiver identicalTo: objectA.
	self assert: traces first arguments isEmpty equals: true.

	self assert: traces second isMessageSend equals: true.
	self assert: traces second selector equals: #exampleSetter:.
	self assert: traces second receiver identicalTo: objectB.
	self assert: traces second arguments size equals: 1.
	self assert: traces second arguments first equals: 'example'.

	self assert: traces third isMethodCall equals: true.
	self assert: traces third sender identicalTo: objectA.
	self assert: traces third selector equals: #exampleSetter:.
	self assert: traces third receiver identicalTo: objectB.
	self assert: traces third arguments size equals: 1.
	self assert: traces third arguments first equals: 'example'.

	self assert: traces fourth isAssignment equals: true.
	self assert: traces fourth object identicalTo: objectB.
	self assert: traces fourth variable equals: #exampleInstanceVariable.
	self assert: traces fourth value equals: 'example'
]

{ #category : 'tests' }
ScpTraceRecorderTest >> testExampleSetterCallInBlock [

	| traces |
	objectA exampleSetterCallInBlock.

	traces := traceRecorder storage traces.

	self assert: traces size equals: 4.
	self assert: traces first isMethodCall equals: true.
	self assert: traces first sender identicalTo: self.
	self assert: traces first selector equals: #exampleSetterCallInBlock.
	self assert: traces first receiver identicalTo: objectA.
	self assert: traces first arguments isEmpty equals: true.

	self assert: traces second isMessageSend equals: true.
	self assert: traces second selector equals: #exampleSetter:.
	self assert: traces second receiver identicalTo: objectB.
	self assert: traces second arguments size equals: 1.
	self assert: traces second arguments first equals: 'exampleInBlock'.

	self assert: traces third isMethodCall equals: true.
	self assert: traces third sender identicalTo: objectA.
	self assert: traces third selector equals: #exampleSetter:.
	self assert: traces third receiver identicalTo: objectB.
	self assert: traces third arguments size equals: 1.
	self assert: traces third arguments first equals: 'exampleInBlock'.

	self assert: traces fourth isAssignment equals: true.
	self assert: traces fourth object identicalTo: objectB.
	self assert: traces fourth variable equals: #exampleInstanceVariable.
	self assert: traces fourth value equals: 'exampleInBlock'
]

{ #category : 'tests' }
ScpTraceRecorderTest >> testExampleSetterCallInBlockInBlock [

	| traces |
	objectA exampleSetterCallInBlockInBlock.

	traces := traceRecorder storage traces.

	self assert: traces size equals: 4.
	self assert: traces first isMethodCall equals: true.
	self assert: traces first sender identicalTo: self.
	self
		assert: traces first selector
		equals: #exampleSetterCallInBlockInBlock.
	self assert: traces first receiver identicalTo: objectA.
	self assert: traces first arguments isEmpty equals: true.

	self assert: traces second isMessageSend equals: true.
	self assert: traces second selector equals: #exampleSetter:.
	self assert: traces second receiver identicalTo: objectB.
	self assert: traces second arguments size equals: 1.
	self
		assert: traces second arguments first
		equals: 'exampleInBlockInBlock'.

	self assert: traces third isMethodCall equals: true.
	self assert: traces third sender identicalTo: objectA.
	self assert: traces third selector equals: #exampleSetter:.
	self assert: traces third receiver identicalTo: objectB.
	self assert: traces third arguments size equals: 1.
	self
		assert: traces third arguments first
		equals: 'exampleInBlockInBlock'.

	self assert: traces fourth isAssignment equals: true.
	self assert: traces fourth object identicalTo: objectB.
	self assert: traces fourth variable equals: #exampleInstanceVariable.
	self assert: traces fourth value equals: 'exampleInBlockInBlock'
]

{ #category : 'tests' }
ScpTraceRecorderTest >> testExampleSetterObservableCall [

	| traces |
	objectA exampleSetterObservableCall.

	traces := traceRecorder storage traces.

	self assert: traces size equals: 4.
	self assert: traces first isMethodCall equals: true.
	self assert: traces first sender identicalTo: self.
	self
		assert: traces first selector
		equals: #exampleSetterObservableCall.
	self assert: traces first receiver identicalTo: objectA.
	self assert: traces first arguments isEmpty equals: true.

	self assert: traces second isMessageSend equals: true.
	self
		assert: traces second selector
		equals: #exampleSetterObservableSlot:.
	self assert: traces second receiver identicalTo: objectB.
	self assert: traces second arguments size equals: 1.
	self
		assert: traces second arguments first
		equals: 'exampleObservable'.

	self assert: traces third isMethodCall equals: true.
	self assert: traces third sender identicalTo: objectA.
	self
		assert: traces third selector
		equals: #exampleSetterObservableSlot:.
	self assert: traces third receiver identicalTo: objectB.
	self assert: traces third arguments size equals: 1.
	self assert: traces third arguments first equals: 'exampleObservable'.

	self assert: traces fourth isAssignment equals: true.
	self assert: traces fourth object identicalTo: objectB.
	self
		assert: traces fourth variable
		equals: #exampleInstanceObservable.
	self assert: traces fourth value equals: 'exampleObservable'
]

{ #category : 'tests' }
ScpTraceRecorderTest >> testExampleSuperCall [

	| traces |
	objectB exampleSuperCall: 'exampleSuper'.

	traces := traceRecorder storage traces.

	self assert: traces size equals: 3.
	self assert: traces first isMethodCall equals: true.
	self assert: traces first sender identicalTo: self.
	self assert: traces first selector equals: #exampleSuperCall:.
	self assert: traces first receiver identicalTo: objectB.
	self assert: traces second arguments size equals: 1.
	self assert: traces second arguments first equals: 'exampleSuper'.

	self assert: traces second isMessageSend equals: true.
	self assert: traces second selector equals: #exampleSuperCall:.
	self assert: traces second receiver identicalTo: objectB.
	self assert: traces second arguments size equals: 1.
	self assert: traces second arguments first equals: 'exampleSuper'.

	self assert: traces third isMethodCall equals: true.
	self assert: traces third sender identicalTo: objectB.
	self assert: traces third selector equals: #exampleSuperCall:.
	self assert: traces third receiver identicalTo: objectB.
	self assert: traces third arguments size equals: 1.
	self assert: traces third arguments first equals: 'exampleSuper'
]
