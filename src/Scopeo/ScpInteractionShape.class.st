Class {
	#name : #ScpInteractionShape,
	#superclass : #ScpInteractionsGraphShape,
	#instVars : [
		'origin',
		'destination',
		'onClickAction',
		'menuEntries'
	],
	#category : #'Scopeo-InteractionsVisualization'
}

{ #category : #'api - building' }
ScpInteractionShape >> destination: aDestinationShape [

	^ destination := aDestinationShape
]

{ #category : #accessing }
ScpInteractionShape >> menuEntries: aMenuEntries [

	menuEntries := aMenuEntries
]

{ #category : #'private - rendering' }
ScpInteractionShape >> menuEntries: aEntries in: aMenuMorph for: aInteraction [

	aEntries keysAndValuesDo: [ :k :v | 
		(aMenuMorph 
			add: k
			target: self
			selector: #performClickAction:
			argument: v)
	].
]

{ #category : #'api - building' }
ScpInteractionShape >> origin: aOriginShape [

	^ origin := aOriginShape
]

{ #category : #'private - rendering' }
ScpInteractionShape >> performClickAction: aAction [

	aAction cull: model
]

{ #category : #accessing }
ScpInteractionShape >> shape [
	
	^ (RSBezier new
			markerEnd: (RSShapeFactory arrow size: 5);
		   attachPoint: (RSBorderAttachPoint new endOffset: 2);
		   controlPointsController: RSSelfLoopCPController new;
		   from: origin;
		   to: destination)
		addInteraction: self tagShape;
		model: self model;
		color: Color black;
		popup; 
		yourself
]

{ #category : #'private - rendering' }
ScpInteractionShape >> tagLabelContainerShape: aExtent [

	^ RSBox new
		color: Color white;
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

{ #category : #'private - rendering' }
ScpInteractionShape >> tagLabelShape [
	
	| label |

	label := RSLabel new 
		text: self model selector asString;
		color: Color black; 
		yourself.	
	 ^ label
]

{ #category : #'private - rendering' }
ScpInteractionShape >> tagShape [
	
	| tag |
	
	tag := RSLabeled new.
	tag location inner; middle.
		
	tag shapeBuilder: [ :m | 
		| label container |
		label := self tagLabelShape.
		container := self tagLabelContainerShape: label extent + 5.
		{ container . label } asShape
	].
	
	^ tag
]
