Class {
	#name : #ScpInstrumentationLogger,
	#superclass : #ScpInstrumentationHandler,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #handle }
ScpInstrumentationLogger >> before: anArguments [

	(anArguments fourth asString , ' ' , anArguments second asString ,  ' ',  anArguments first asString) crTrace
]

{ #category : #arguments }
ScpInstrumentationLogger >> requires [ 

	^ #( receiver selector arguments sender )
]
