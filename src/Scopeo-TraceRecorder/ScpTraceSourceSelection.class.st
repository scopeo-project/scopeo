Class {
	#name : #ScpTraceSourceSelection,
	#superclass : #Object,
	#instVars : [
		'packages',
		'classes',
		'methods'
	],
	#category : #'Scopeo-TraceRecorder-Model'
}

{ #category : #accessing }
ScpTraceSourceSelection >> classes [

	^ classes
]

{ #category : #modifying }
ScpTraceSourceSelection >> classes: aCollection [

	classes := aCollection asOrderedCollection
]

{ #category : #initialization }
ScpTraceSourceSelection >> initialize [

	packages := OrderedCollection empty.
	classes := OrderedCollection empty.
	methods := OrderedCollection empty
	
]

{ #category : #accessing }
ScpTraceSourceSelection >> methods [

	^ methods
]

{ #category : #modifying }
ScpTraceSourceSelection >> methods: aCollection [

	methods := aCollection asOrderedCollection
]

{ #category : #accessing }
ScpTraceSourceSelection >> packages [

	^ packages
]

{ #category : #modifying }
ScpTraceSourceSelection >> packages: aCollection [

	packages := aCollection asOrderedCollection 
]
