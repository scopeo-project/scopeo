Class {
	#name : 'ScpExampleObjectA',
	#superclass : 'ScpExampleObject',
	#instVars : [
		'exampleObjectB'
	],
	#category : 'Scopeo-TraceRecorder-Tests',
	#package : 'Scopeo-TraceRecorder-Tests'
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

	exampleObjectB exampleSetter: 'example' 
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

{ #category : 'tests' }
ScpExampleObjectA >> testFilter [

	^ ScpTracesFilter new
		  matchPackages: OTMatcher any;
		  matchClasses: OTMatcher any;
		  matchMethods: OTMatcher any;
		  methods;
		  yourself
]
