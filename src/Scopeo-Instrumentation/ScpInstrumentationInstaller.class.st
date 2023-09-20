Class {
	#name : #ScpInstrumentationInstaller,
	#superclass : #Object,
	#instVars : [
		'metalinks',
		'class',
		'methods',
		'instrumentation'
	],
	#category : #'Scopeo-Instrumentation'
}

{ #category : #'api - instrumenting' }
ScpInstrumentationInstaller class >> onMethod: aMethod [

	^ self onMethod: aMethod selector of: aMethod class
]

{ #category : #'api - instrumenting' }
ScpInstrumentationInstaller class >> onMethod: aMethod of: aClass [

	^ self onMethods: { aMethod } of: aClass
]

{ #category : #'api - instrumenting' }
ScpInstrumentationInstaller class >> onMethods: aMethods of: aClass [

	^ self new 
		methods: aMethods; 
		class: aClass;
		yourself
]

{ #category : #'changing suspended state' }
ScpInstrumentationInstaller >> class: aClass [

	class := aClass
]

{ #category : #initialization }
ScpInstrumentationInstaller >> initialize [

	
]

{ #category : #'as yet unclassified' }
ScpInstrumentationInstaller >> methods: aMethodArray [ 
	
	methods := aMethodArray 
]
