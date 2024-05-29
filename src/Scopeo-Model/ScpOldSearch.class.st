Class {
	#name : 'ScpOldSearch',
	#superclass : 'Object',
	#instVars : [
		'mediator',
		'data'
	],
	#category : 'Scopeo-Model-Deprecated',
	#package : 'Scopeo-Model',
	#tag : 'Deprecated'
}

{ #category : 'accessing' }
ScpOldSearch >> data: aScpData [
	"Link the search component to the data layer."
	data := aScpData.
]

{ #category : 'accessing' }
ScpOldSearch >> mediator: aMediator [
	"Required to communicate with the scope without tight coupling. See Mediator pattern."

	mediator := aMediator.	
	
]

{ #category : 'services' }
ScpOldSearch >> search: aPredicate [

	^ data fetch: (self class compiler evaluate: aPredicate)
]
