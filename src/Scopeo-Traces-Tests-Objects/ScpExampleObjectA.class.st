Class {
	#name : 'ScpExampleObjectA',
	#superclass : 'Object',
	#instVars : [
		'exampleObjectB'
	],
	#category : 'Scopeo-Traces-Tests-Objects',
	#package : 'Scopeo-Traces-Tests-Objects'
}

{ #category : 'examples' }
ScpExampleObjectA >> exampleAccessorCall [

	^ exampleObjectB exampleAccessor.
]

{ #category : 'examples' }
ScpExampleObjectA >> exampleMethod [

	exampleObjectB exampleSetter: 'example'.
	
	[ exampleObjectB exampleSetter: 'exampleInBlock' ] value.
	
	^ exampleObjectB exampleAccessor.
]

{ #category : 'accessing' }
ScpExampleObjectA >> exampleObjectB: anObject [

	exampleObjectB := anObject
]

{ #category : 'examples' }
ScpExampleObjectA >> exampleSetterCall [

	exampleObjectB exampleSetter: 'example'.

]

{ #category : 'examples' }
ScpExampleObjectA >> exampleSetterCallInBlock [

	[ exampleObjectB exampleSetter: 'exampleInBlock' ] value.
	
]

{ #category : 'examples' }
ScpExampleObjectA >> exampleSetterCallInBlockInBlock [

	| value |
	value := 'exampleInBlockInBlock'.
	[ :v | [ exampleObjectB exampleSetter: v ] value ] value: value
]

{ #category : 'examples' }
ScpExampleObjectA >> exampleSetterObservableCall [

	exampleObjectB exampleSetterObservableSlot: 'exampleObservable'.

]
