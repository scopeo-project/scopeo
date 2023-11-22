Class {
	#name : 'ScpExampleObjectB',
	#superclass : 'Object',
	#instVars : [
		'exampleInstanceVariable'
	],
	#category : 'Scopeo-Traces-Tests-Objects',
	#package : 'Scopeo-Traces-Tests-Objects'
}

{ #category : 'as yet unclassified' }
ScpExampleObjectB >> exampleAccessor [

	^ exampleInstanceVariable
]

{ #category : 'as yet unclassified' }
ScpExampleObjectB >> exampleSetter: aValue [

	exampleInstanceVariable := aValue
]
