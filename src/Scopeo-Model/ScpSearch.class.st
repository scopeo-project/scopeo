Class {
	#name : 'ScpSearch',
	#superclass : 'Object',
	#instVars : [
		'mediator',
		'data'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpSearch >> data: aScpData [
	"Link the search component to the data layer."
	data := aScpData.
]

{ #category : 'accessing' }
ScpSearch >> mediator: aMediator [
	"Required to communicate with the scope without tight coupling. See Mediator pattern."

	mediator := aMediator.	
	
]

{ #category : 'services' }
ScpSearch >> search: aPredicate [

	^ data fetch: (self class compiler evaluate: aPredicate)
]
