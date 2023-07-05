Class {
	#name : #ScpLinkShapeBuilder,
	#superclass : #ScpShapeBuilder,
	#instVars : [
		'source',
		'destination',
		'events',
		'scale'
	],
	#category : #'Scopeo-UI-Visualization'
}

{ #category : #building }
ScpLinkShapeBuilder >> build [

	^ RSBimetricLine new
		  model: events;
		  widthFrom: (scale scale: events size);
		  widthTo: 1;
		  paint: Color veryVeryLightGray;
		  border: nil;
		  withBorderAttachPoint;
		  from: source;
		  to: destination;
		  yourself
]

{ #category : #building }
ScpLinkShapeBuilder >> buildLink [

	^ RSBimetricLine new
		  widthFrom: 50;
		  widthTo: 1;
		  paint: Color veryVeryLightGray ;
		  border: nil;
		  withBorderAttachPoint;
		  from: source;
		  to: destination;
		  yourself
]

{ #category : #accessing }
ScpLinkShapeBuilder >> events: aEvents [

	events := aEvents
]

{ #category : #'instance creation' }
ScpLinkShapeBuilder >> from: aSource to: aDestination [

	source := aSource.
	destination := aDestination
]

{ #category : #accessing }
ScpLinkShapeBuilder >> scale: aScale [

	scale := aScale
]
