Class {
	#name : #ObjectShape,
	#superclass : #ObjectGraphShape,
	#instVars : [
		'object',
		'objectId'
	],
	#category : #'Scopeo-Visualizations'
}

{ #category : #private }
ObjectShape >> labelContainerShape: aExtent [

	^ RSBox new
		color: Color veryVeryLightGray;
		border: (RSBorder new color: Color black);
		extent: aExtent;
		yourself
]

{ #category : #private }
ObjectShape >> labelShape [

	^ RSLabel new
		text: object className , '(', objectId asString, ')';
		color: Color black;
		yourself

	
]

{ #category : #accessing }
ObjectShape >> object [

	^ object
]

{ #category : #accessing }
ObjectShape >> object: anObject [

	object := anObject
]

{ #category : #accessing }
ObjectShape >> objectId [

	^ objectId
]

{ #category : #accessing }
ObjectShape >> objectId: anObject [

	objectId := anObject
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
