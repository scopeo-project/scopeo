Class {
	#name : 'ScpTraces',
	#superclass : 'Object',
	#instVars : [
		'scanner',
		'filter',
		'storage',
		'tracer'
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

{ #category : 'services' }
ScpTraces >> clean [

	tracer clean
]

{ #category : 'services' }
ScpTraces >> fetch: aPredicate [

	^ storage fetch: aPredicate
]

{ #category : 'parameters' }
ScpTraces >> forPackages: aPackageNameCollection [

	tracer forPackages: aPackageNameCollection
]

{ #category : 'parameters' }
ScpTraces >> rejectClasses: aClassNameCollection [

	tracer rejectClasses: aClassNameCollection
]

{ #category : 'parameters' }
ScpTraces >> rejectPackages: aPackageNameCollection [

	tracer rejectPackages: aPackageNameCollection
]

{ #category : 'services' }
ScpTraces >> scan: aProgram [

	storage clear.
	^ tracer traceBlock: aProgram
]

{ #category : 'parameters' }
ScpTraces >> traceStorage: aStorage [

	storage := aStorage.
	tracer traceStorage: aStorage.
]

{ #category : 'parameters' }
ScpTraces >> tracer: aTracer [

	tracer := aTracer.
	storage ifNil: [ ^ self ].
	tracer traceStorage: storage
]
