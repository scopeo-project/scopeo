Class {
	#name : #InteractionShape,
	#superclass : #ObjectGraphShape,
	#instVars : [
		'origin',
		'destination',
		'onClickAction'
	],
	#category : #'Scopeo-Visualizations'
}

{ #category : #'api - building' }
InteractionShape >> destination: aDestinationShape [

	^ destination := aDestinationShape
]

{ #category : #enumerating }
InteractionShape >> onClickDo: aBlock [
	
	onClickAction := aBlock
]

{ #category : #'api - building' }
InteractionShape >> origin: aOriginShape [

	^ origin := aOriginShape
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

{ #category : #private }
InteractionShape >> tagLabelContainerShape: aExtent [

	^ RSBox new
		color: Color white;
		border: (RSBorder new color: Color black);
		extent: aExtent;
		yourself
]

{ #category : #private }
InteractionShape >> tagLabelShape [
	
	| label |

	label := RSLabel new 
		text: self model selector asString;
		color: Color black; 
		yourself.

	onClickAction ifNotNil: [ 
		label when: RSMouseClick do: onClickAction
	].
	
	 ^ label
]

{ #category : #private }
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
