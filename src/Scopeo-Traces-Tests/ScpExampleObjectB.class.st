Class {
	#name : 'ScpExampleObjectB',
	#superclass : 'Object',
	#instVars : [
		'exampleInstanceVariable'
	],
	#category : 'Scopeo-Traces-Tests-',
	#package : 'Scopeo-Traces-Tests',
	#tag : ''
}

{ #category : 'as yet unclassified' }
ScpExampleObjectB >> exampleAccessor [

	^ exampleInstanceVariable
]

{ #category : 'as yet unclassified' }
ScpExampleObjectB >> exampleSetter: aValue [

	exampleInstanceVariable := aValue
]
