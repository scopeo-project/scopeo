Class {
	#name : #ScpTraceRecorder,
	#superclass : #Object,
	#instVars : [
		'instrumentation',
		'storage',
		'source'
	],
	#category : #'Scopeo-TraceRecorder-Model'
}

{ #category : #'as yet unclassified' }
ScpTraceRecorder class >> defaultRejectedClasses [

	^ {  }
]

{ #category : #'as yet unclassified' }
ScpTraceRecorder class >> defaultRejectedPackages [

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

{ #category : #initialization }
ScpTraceRecorder >> initialize [

	self instrumentation: ScpInstrumentation new.
	self storage: ScpTraceMemoryStorage new
]

{ #category : #parameters }
ScpTraceRecorder >> instrumentation: aInstrumentation [

	instrumentation := aInstrumentation
]

{ #category : #accessing }
ScpTraceRecorder >> source [

	^ source
]

{ #category : #parameters }
ScpTraceRecorder >> source: aTraceSourceSelection [


	source := aTraceSourceSelection.
	instrumentation methodsToInstrument: source methods.
]

{ #category : #services }
ScpTraceRecorder >> startRecording [

	storage ifNil: [
		self error: 'Please provide a storage component to record program events.'
	].
	instrumentation handler: storage
]

{ #category : #services }
ScpTraceRecorder >> stopRecording [

	instrumentation handler: ScpInstrumentationHandler new
]

{ #category : #accessing }
ScpTraceRecorder >> storage [

	^ storage
]

{ #category : #parameters }
ScpTraceRecorder >> storage: aStorage [

	storage := aStorage
]

{ #category : #services }
ScpTraceRecorder >> switchOff [

	self stopRecording.
	instrumentation uninstall
]

{ #category : #services }
ScpTraceRecorder >> switchOn [

	instrumentation install
]
