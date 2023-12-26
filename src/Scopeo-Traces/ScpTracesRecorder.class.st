Class {
	#name : 'ScpTracesRecorder',
	#superclass : 'Object',
	#instVars : [
		'filter',
		'instrumentation',
		'storage'
	],
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'as yet unclassified' }
ScpTracesRecorder class >> defaultRejectedClasses [

	^ {  }
]

{ #category : 'as yet unclassified' }
ScpTracesRecorder class >> defaultRejectedPackages [

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
ScpTracesRecorder >> filter: aFilter [

	filter := aFilter
]

{ #category : 'initialization' }
ScpTracesRecorder >> initialize [

	self instrumentation: ScpInstrumentation new.
	self storage: ScpTracesMemoryStorage new
]

{ #category : 'parameters' }
ScpTracesRecorder >> instrumentation: aInstrumentation [

	instrumentation := aInstrumentation
]

{ #category : 'services' }
ScpTracesRecorder >> startRecording [

	storage ifNil: [
		self error: 'Please provide a storage component to record program events.'
	].
	instrumentation handler: storage
]

{ #category : 'services' }
ScpTracesRecorder >> stopRecording [

	instrumentation handler: ScpInstrumentationHandler new
]

{ #category : 'accessing' }
ScpTracesRecorder >> storage [

	^ storage
]

{ #category : 'parameters' }
ScpTracesRecorder >> storage: aStorage [

	storage := aStorage
]

{ #category : 'as yet unclassified' }
ScpTracesRecorder >> switchOff [

	instrumentation uninstall
]

{ #category : 'as yet unclassified' }
ScpTracesRecorder >> switchOn [

	filter ifNil: [
		self error: 'Provide a filter to select the methods whose events are to be recorded.' 
	].
	instrumentation methods: filter methods.
	instrumentation install
]

{ #category : 'accessing' }
ScpTracesRecorder >> withFilter: aFilterSetUpBlock [

	self filter: ScpTracesFilter new.
	aFilterSetUpBlock value: filter.
]
