Class {
	#name : 'ScpExplorationScope',
	#superclass : 'Object',
	#instVars : [
		'record',
		'references',
		'label'
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
ScpExplorationScope >> label [

	^ label ifNil: [ 'Full execution' ]
]

{ #category : 'accessing' }
ScpExplorationScope >> label: aString [

	label := aString
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

	record := aScpExecutionRecord

]

{ #category : 'accessing' }
ScpExplorationScope >> references: aDictionary [

	references := aDictionary
]

{ #category : 'accessing' }
ScpExplorationScope >> referencesFor: anObject [

	^ references at: anObject
]
