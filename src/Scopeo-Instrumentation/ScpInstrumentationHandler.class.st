Class {
	#name : #ScpInstrumentationHandler,
	#superclass : #Object,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #handle }
ScpInstrumentationHandler >> after: anArguments [


]

{ #category : #handle }
ScpInstrumentationHandler >> before: anArguments [

]

{ #category : #handle }
ScpInstrumentationHandler >> instead: anArguments [

	^ anArguments first 
		perform: anArguments second 
		withArguments: anArguments third 
]

{ #category : #arguments }
ScpInstrumentationHandler >> requires [

	^ #( receiver selector arguments )
]
