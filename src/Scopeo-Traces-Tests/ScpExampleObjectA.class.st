Class {
	#name : 'ScpExampleObjectA',
	#superclass : 'Object',
	#instVars : [
		'exampleObjectB'
	],
	#category : 'Scopeo-Traces-Tests-',
	#package : 'Scopeo-Traces-Tests',
	#tag : ''
}

{ #category : 'examples' }
ScpExampleObjectA >> exampleMethod [

	exampleObjectB exampleSetter: 'example'.
	^ exampleObjectB exampleAccessor.
]

{ #category : 'accessing' }
ScpExampleObjectA >> exampleObjectB: anObject [

	exampleObjectB := anObject
]
