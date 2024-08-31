Class {
	#name : 'ScpTraceArrayIterator',
	#superclass : 'Object',
	#instVars : [
		'index',
		'array'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpTraceArrayIterator >> array: anArray [

	array := anArray
]

{ #category : 'initialization' }
ScpTraceArrayIterator >> current [

	^ array at: index
]

{ #category : 'testing' }
ScpTraceArrayIterator >> hasNext [

	^ self hasNext: 1
]

{ #category : 'testing' }
ScpTraceArrayIterator >> hasNext: anOffset [

	^ array size >= (index + anOffset)
]

{ #category : 'initialization' }
ScpTraceArrayIterator >> initialize [

	index := 0
]

{ #category : 'accessing' }
ScpTraceArrayIterator >> next [

	^ self next: 1
]

{ #category : 'adding' }
ScpTraceArrayIterator >> next: anOffset [

	(self hasNext: anOffset) ifFalse: [ self error: 'No more elements' ].

	index := index + anOffset.
	
	^ self current
]
