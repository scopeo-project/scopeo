Class {
	#name : #InteractionShape,
	#superclass : #ObjectGraphShape,
	#instVars : [
		'origin',
		'destination',
		'onClickAction',
		'menuEntries'
	],
	#category : #'Scopeo-Visualizations'
}

{ #category : #'api - building' }
InteractionShape >> destination: aDestinationShape [

	^ destination := aDestinationShape
]

{ #category : #accessing }
InteractionShape >> menuEntries: aMenuEntries [

	menuEntries := aMenuEntries
]

{ #category : #'private - rendering' }
InteractionShape >> menuEntries: aEntries in: aMenuMorph for: aInteraction [

	aEntries keysAndValuesDo: [ :k :v | 
		(aMenuMorph 
			add: k
			target: self
			selector: #performClickAction:
			argument: v)
	].
]

{ #category : #'api - building' }
InteractionShape >> origin: aOriginShape [

	^ origin := aOriginShape
]

{ #category : #'private - rendering' }
InteractionShape >> performClickAction: aAction [

	aAction cull: model
]

{ #category : #accessing }
InteractionShape >> shape [
	
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
InteractionShape >> tagLabelContainerShape: aExtent [

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
InteractionShape >> tagLabelShape [
	
	| label |

	label := RSLabel new 
		text: self model selector asString;
		color: Color black; 
		yourself.	
	 ^ label
]

{ #category : #'private - rendering' }
InteractionShape >> tagShape [
	
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
