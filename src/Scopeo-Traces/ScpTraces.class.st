Class {
	#name : 'ScpTraces',
	#superclass : 'Object',
	#instVars : [
		'scanner',
		'filter',
		'storage',
		'tracer',
		'methods'
	],
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'as yet unclassified' }
ScpTraces class >> defaultRejectedClasses [

	^ {  }
]

{ #category : 'as yet unclassified' }
ScpTraces class >> defaultRejectedPackages [

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
ScpTraces >> filter [

	filter := ScpTracesFilter new.
	^ filter
]

{ #category : 'initialization' }
ScpTraces >> initialize [

	self tracer: ScpInstrumentationTracer new.
	self storage: ScpTracesMemoryStorage new.
]

{ #category : 'services' }
ScpTraces >> startRecording [

	methods ifNil: [ methods := filter methods].
	tracer methods: methods.
	tracer startTracing
]

{ #category : 'services' }
ScpTraces >> stopRecording [

	tracer stopTracing
]

{ #category : 'accessing' }
ScpTraces >> storage [

	^ storage
]

{ #category : 'parameters' }
ScpTraces >> storage: aStorage [

	storage := aStorage.
	tracer ifNil: [ ^ self ].
	tracer handler: aStorage.
]

{ #category : 'parameters' }
ScpTraces >> tracer: aTracer [

	tracer := aTracer.
	storage ifNil: [ ^ self ].
	tracer handler: storage
]
