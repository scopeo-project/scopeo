Class {
	#name : #ScpInstrumentationLogger,
	#superclass : #ScpInstrumentationHandler,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #handle }
ScpInstrumentationLogger >> before: anArguments [

	anArguments first asString , ' ' , anArguments second asString , ' ' , anArguments first asString crTrace 
]
