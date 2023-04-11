Class {
	#name : #ObjectGraphVertexShape,
	#superclass : #ObjectGraphShape,
	#category : #'Scopeo-Graph-Visualization'
}

{ #category : #private }
ObjectGraphVertexShape >> labelContainerShape: aExtent [

	^ RSBox new
		color: Color veryVeryLightGray;
		border: (RSBorder new color: Color black);
		extent: aExtent;
		yourself
]

{ #category : #private }
ObjectGraphVertexShape >> labelShape [

	^ RSLabel new
		text: self model object className , '(', self model objectOid asString, ')';
		color: Color black;
		yourself

	
]

{ #category : #accessing }
ObjectGraphVertexShape >> shape [

	| label container |
	label := self labelShape.
	container := self labelContainerShape: label extent + 10.
	^ { container . label } asShape
		  model: self model;
		  padding: 1;
		  draggable;
		  yourself
]
