Class {
	#name : #ScpPresentationModel,
	#superclass : #Object,
	#instVars : [
		'bindings'
	],
	#category : #Scopeo
}

{ #category : #binding }
ScpPresentationModel >> bind: anEvent to: aCallbackBlock [

	| callbacks |
	callbacks := bindings
		             at: anEvent
		             ifAbsentPut: [ OrderedCollection empty ].
	callbacks add: aCallbackBlock
]

{ #category : #initialization }
ScpPresentationModel >> initialize [

	bindings := Dictionary new
]

{ #category : #binding }
ScpPresentationModel >> notifyBindingsOf: anEvent [

	bindings
		at: anEvent
		ifPresent: [ :callbacks | callbacks do: [ :b | b value ] ]
]

{ #category : #binding }
ScpPresentationModel >> notifyBindingsOf: anEvent withArg: anArgument [

	bindings
		at: anEvent
		ifPresent: [ :callbacks |
		callbacks do: [ :b | b value: anArgument ] ]
]
