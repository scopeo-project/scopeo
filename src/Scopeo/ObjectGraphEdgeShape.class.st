Class {
	#name : #ObjectGraphEdgeShape,
	#superclass : #ObjectGraphShape,
	#instVars : [
		'origin',
		'destination',
		'onClickAction'
	],
	#category : #'Scopeo-Graph-Visualization'
}

{ #category : #'api - building' }
ObjectGraphEdgeShape >> destination: aDestinationShape [

	^ destination := aDestinationShape
]

{ #category : #enumerating }
ObjectGraphEdgeShape >> onClickDo: aBlock [
	
	onClickAction := aBlock
]

{ #category : #'api - building' }
ObjectGraphEdgeShape >> origin: aOriginShape [

	^ origin := aOriginShape
]

{ #category : #accessing }
ObjectGraphEdgeShape >> shape [
	
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
ObjectGraphEdgeShape >> tagLabelContainerShape: aExtent [

	^ RSBox new
		color: Color white;
		border: (RSBorder new color: Color black);
		extent: aExtent;
		yourself
]

{ #category : #private }
ObjectGraphEdgeShape >> tagLabelShape [
	
	| text label |

	text := self model action isAssignment 
		ifTrue: [ self model action variable asString ]
		ifFalse: [ self model action selector asString ].

	label := RSLabel new 
		text: text;
		color: Color black; 
		yourself.

	onClickAction ifNotNil: [ 
		label when: RSMouseClick do: onClickAction
	].
	
	 ^ label
]

{ #category : #private }
ObjectGraphEdgeShape >> tagShape [
	
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
