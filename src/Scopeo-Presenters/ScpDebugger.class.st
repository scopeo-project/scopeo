Class {
	#name : 'ScpDebugger',
	#superclass : 'Object',
	#instVars : [
		'scopes',
		'onScopesUpdated',
		'subjects',
		'execution'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'start' }
ScpDebugger class >> debug: aBlock [

	| execution debugger |
	
	execution := ScpExecutionRecorder recordBlock: aBlock as: ScpExecutionRecordTree.
	debugger := self new.
	debugger execution: (ScpExplorationScope new 
		record: execution;
		yourself).
	debugger presenter open
	
]

{ #category : 'adding' }
ScpDebugger >> addScope: aScpExplorationScope [

	scopes add: aScpExplorationScope.	
	onScopesUpdated ifNotNil: [ :b | b value: scopes	]

]

{ #category : 'initialization' }
ScpDebugger >> addSubject: anObject [

	subjects add: anObject 
]

{ #category : 'accessing' }
ScpDebugger >> execution [

	^ execution
]

{ #category : 'accessing' }
ScpDebugger >> execution: anExecution [

	execution := anExecution
]

{ #category : 'initialization' }
ScpDebugger >> initialize [

	scopes := OrderedCollection new.
	subjects := OrderedCollection new
]

{ #category : 'accessing' }
ScpDebugger >> presenter [

	^ ScpDebuggerPresenter on: self
]

{ #category : 'as yet unclassified' }
ScpDebugger >> questions [

	^ ScpQuestion allSubclasses reject: [ :c | c isAbstract ] 
]

{ #category : 'accessing' }
ScpDebugger >> scopes [

	^ scopes
]

{ #category : 'accessing' }
ScpDebugger >> subjects [

	^ subjects
]

{ #category : 'as yet unclassified' }
ScpDebugger >> whenScopesUpdated: aBlock [

	onScopesUpdated := aBlock
]
