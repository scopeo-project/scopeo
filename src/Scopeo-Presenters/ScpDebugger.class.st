Class {
	#name : 'ScpDebugger',
	#superclass : 'Object',
	#instVars : [
		'scopes'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'start' }
ScpDebugger class >> debug: aBlock [

]

{ #category : 'adding' }
ScpDebugger >> addScope: aScpExplorationScope [

	scopes add: aScpExplorationScope
]

{ #category : 'initialization' }
ScpDebugger >> initialize [

	scopes := OrderedCollection new
]

{ #category : 'accessing' }
ScpDebugger >> presenter [

	^ ScpDebuggerPresenter on: self
]

{ #category : 'accessing' }
ScpDebugger >> scopes [

	^ scopes
]
