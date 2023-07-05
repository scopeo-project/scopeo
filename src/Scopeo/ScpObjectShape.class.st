Class {
	#name : #ScpObjectShape,
	#superclass : #ScpInteractionsGraphShape,
	#instVars : [
		'object',
		'objectId',
		'menuEntries'
	],
	#category : #'Scopeo-InteractionsVisualization'
}

{ #category : #private }
ScpObjectShape >> labelContainerShape: aExtent [

	^ RSBox new
		  color: Color veryVeryLightGray;
		  border: (RSBorder new color: Color black);
		  extent: aExtent;
		  addInteraction:
			  (RSMenuActivable new menuDo: [ :aMenuMorph :aShape |
					   self menuEntries: menuEntries in: aMenuMorph for: object ]);
		  yourself
]

{ #category : #private }
ScpObjectShape >> labelShape [

	^ RSLabel new
		text: self model asString;
		color: Color black;
		yourself

	
]

{ #category : #accessing }
ScpObjectShape >> menuEntries: aMenuEntries [

	menuEntries := aMenuEntries
]

{ #category : #'private - rendering' }
ScpObjectShape >> menuEntries: aEntries in: aMenuMorph for: aInteraction [

	aEntries keysAndValuesDo: [ :k :v | 
		(aMenuMorph 
			add: k
			target: self
			selector: #performClickAction:
			argument: v)
	].
]

{ #category : #'private - rendering' }
ScpObjectShape >> performClickAction: aAction [

	aAction cull: model
]

{ #category : #accessing }
ScpObjectShape >> shape [

	| label container |
	label := self labelShape.
	container := self labelContainerShape: label extent + 10.
	^ { container . label } asShape
		  model: self model;
		  padding: 1;
		  draggable;
		  yourself
]
