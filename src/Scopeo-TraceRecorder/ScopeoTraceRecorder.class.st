Class {
	#name : 'ScopeoTraceRecorder',
	#superclass : 'Object',
	#instVars : [
		'instrumentation',
		'storage',
		'methodsToRecord'
	],
	#category : 'Scopeo-TraceRecorder-Model',
	#package : 'Scopeo-TraceRecorder',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
ScopeoTraceRecorder class >> defaultRejectedClasses [

	^ {  }
]

{ #category : 'as yet unclassified' }
ScopeoTraceRecorder class >> defaultRejectedPackages [

	^ { 'Kernel'. 'Collections-Sequenceable-Tests'.
	  'Collections-Atomic-Tests'. 'Collections-Unordered-Tests'.
	  'Collections-Stack'. 'Collections-Native'. 'Collections-Weak-Tests'.
	  'Collections-Arithmetic'. 'Collections-Unordered'.
	  'Collections-Atomic'. 'Collections-Tests'. 'Collections-Streams-Tests'.
	  'Collections-Strings-Tests'. 'Collections-Abstract-Traits'.
	  'Collections-Support'. 'Collections-Sequenceable'.
	  'Collections-Abstract-Tests'. 'Collections-Strings'.
	  'Collections-Arithmetic-Tests'. 'Collections-Stack-Tests'.
	  'Collections-DoubleLinkedList-Tests'.
	  'Collections-Native-Tests'. 'Collections-Abstract'.
	  'Collections-Weak'. 'Collections-Streams'. 'Collections-Support-Tests'.
	  'Collections-DoubleLinkedList'. 'Transcript-Core' }
]

{ #category : 'initialization' }
ScopeoTraceRecorder >> initialize [

	self instrumentation: ScpInstrumentation new.
	self storage: ScpTraceMemoryStorage new
]

{ #category : 'parameters' }
ScopeoTraceRecorder >> instrumentation: aInstrumentation [

	instrumentation := aInstrumentation
]

{ #category : 'accessing' }
ScopeoTraceRecorder >> methodsToRecord [

	^ instrumentation methodsToInstrument
]

{ #category : 'parameters' }
ScopeoTraceRecorder >> methodsToRecord: aMethodCollection [

	instrumentation methodsToInstrument: aMethodCollection
]

{ #category : 'parameters' }
ScopeoTraceRecorder >> seekMethodsToRecord: aSetUpBlock [

	| methodSeeker |
	methodSeeker := ScpMethodSeeker new.
	aSetUpBlock value: methodSeeker.
	self methodsToRecord: methodSeeker methods
]

{ #category : 'services' }
ScopeoTraceRecorder >> startRecording [

	storage ifNil: [
		self error: 'Please provide a storage component to record program events.'
	].
	instrumentation handler: storage
]

{ #category : 'services' }
ScopeoTraceRecorder >> stopRecording [

	instrumentation handler: ScpInstrumentationHandler new
]

{ #category : 'accessing' }
ScopeoTraceRecorder >> storage [

	^ storage
]

{ #category : 'parameters' }
ScopeoTraceRecorder >> storage: aStorage [

	storage := aStorage
]

{ #category : 'services' }
ScopeoTraceRecorder >> switchOff [

	self stopRecording.
	instrumentation uninstall
]

{ #category : 'services' }
ScopeoTraceRecorder >> switchOn [

	instrumentation install
]
