Class {
	#name : 'ScpDebuggerModel',
	#superclass : 'Object',
	#instVars : [
		'scopes'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpDebuggerModel >> initialize [

	scopes := OrderedCollection new
]

{ #category : 'accessing' }
ScpDebuggerModel >> scopes [

	^ scopes
]
