Class {
	#name : 'ScpExplorationScope',
	#superclass : 'Object',
	#instVars : [
		'record',
		'references'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpExplorationScope >> initialize [

	references := Dictionary new
]

{ #category : 'inspecting' }
ScpExplorationScope >> inspectorPresenter [

	<inspectorPresentationOrder: 1 title: 'Scope'>
	
	^ self presenter


]

{ #category : 'accessing' }
ScpExplorationScope >> objects [

	^ references keys
]

{ #category : 'presenters' }
ScpExplorationScope >> presenter [

	^ ScpExplorationScopePresenter on: self
]

{ #category : 'accessing' }
ScpExplorationScope >> record [

	^ record
]

{ #category : 'accessing' }
ScpExplorationScope >> record: aScpExecutionRecord [

	| trace |

	record := aScpExecutionRecord.
	
	self flag: 'Temporary code to test the model -> gui interactions'.
	
	trace := record methods first children second.
	
	references at: trace sender put: trace.
	references at: trace receiver put: trace.
]

{ #category : 'accessing' }
ScpExplorationScope >> referencesFor: anObject [

	^ references at: anObject
]
