Class {
	#name : 'ScpStateUpdate',
	#superclass : 'ScpObjectEvent',
	#instVars : [
		'value'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpStateUpdate >> value [

	^ value
]

{ #category : 'accessing' }
ScpStateUpdate >> value: aBindedAttribute [

	value := aBindedAttribute 
]