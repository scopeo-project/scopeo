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

	| execution debugger |
	
	execution := ScpExecutionRecorder recordBlock: aBlock as: ScpExecutionRecordTree.
	
	debugger := self new.
	debugger addScope: (ScpExplorationScopeBuilder buildFrom: execution).
	debugger presenter open
		
	
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

{ #category : 'as yet unclassified' }
ScpDebugger >> questions [

	^ ScpQuestion subclasses
]

{ #category : 'accessing' }
ScpDebugger >> scopes [

	^ scopes
]
