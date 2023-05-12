Class {
	#name : #ObjectShape,
	#superclass : #ObjectGraphShape,
	#instVars : [
		'object',
		'objectId',
		'menuEntries'
	],
	#category : #'Scopeo-InteractionsVisualization'
}

{ #category : #private }
ObjectShape >> labelContainerShape: aExtent [

	^ RSBox new
		color: Color veryVeryLightGray;
		border: (RSBorder new color: Color black);
		extent: aExtent;
		addInteraction: (RSMenuActivable new
			menuDo: [ :aMenuMorph :aShape | 
				self menuEntries: menuEntries 
					in: aMenuMorph 
					for: model
			]
		);
		yourself
]

{ #category : #private }
ObjectShape >> labelShape [

	^ RSLabel new
		text: self model asString;
		color: Color black;
		yourself

	
]

{ #category : #accessing }
ObjectShape >> menuEntries: aMenuEntries [

	menuEntries := aMenuEntries
]

{ #category : #'private - rendering' }
ObjectShape >> menuEntries: aEntries in: aMenuMorph for: aInteraction [

	aEntries keysAndValuesDo: [ :k :v | 
		(aMenuMorph 
			add: k
			target: self
			selector: #performClickAction:
			argument: v)
	].
]

{ #category : #'private - rendering' }
ObjectShape >> performClickAction: aAction [

	aAction cull: model
]

{ #category : #accessing }
ObjectShape >> shape [

	| label container |
	label := self labelShape.
	container := self labelContainerShape: label extent + 10.
	^ { container . label } asShape
		  model: self model;
		  padding: 1;
		  draggable;
		  yourself
]
