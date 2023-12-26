Class {
	#name : 'ScopeoTraceRecorder',
	#superclass : 'Object',
	#instVars : [
		'filter',
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

{ #category : 'accessing' }
ScopeoTraceRecorder >> filter: aFilter [

	filter := aFilter
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

{ #category : 'accessing' }
ScopeoTraceRecorder >> methodsToRecord: aMethodCollection [

	instrumentation methodsToInstrument: aMethodCollection
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

	instrumentation uninstall
]

{ #category : 'services' }
ScopeoTraceRecorder >> switchOn [

	instrumentation install
]

{ #category : 'accessing' }
ScopeoTraceRecorder >> withFilter: aFilterSetUpBlock [

	self filter: ScpTraceFilter new.
	aFilterSetUpBlock value: filter.
]
