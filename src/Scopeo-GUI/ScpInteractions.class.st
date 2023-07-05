Class {
	#name : #ScpInteractions,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'events',
		'forceScale',
		'edgeScale',
		'objectShapes',
		'eventShapes'
	],
	#category : #'Scopeo-GUI-Visualization'
}

{ #category : #layout }
ScpInteractions >> applyLayoutOn: aCanvas [

	| layout mockLines lines |
	layout := RSForceBasedLayout new
		          charge: -3000;
		          yourself.
	layout alpha: 0.100.
	layout addNodes: aCanvas nodes.
	layout addLines: aCanvas lines.

	mockLines := aCanvas lines collect: [ :each |
		             | mock |
		             mock := layout newMockLineFor: each.
		             mock strength: 4.
		             mock length: (forceScale scale: each model size).
		             mock ].
	lines := layout lines.
	lines addAll: mockLines.

	layout runLayoutSimply
]

{ #category : #private }
ScpInteractions >> computeScales [

	| values domain |
	values := events values collect: [ :e | e size ].
	domain := {
		          values min.
		          values max }.
	forceScale := NSScale linear
		              domain: domain;
		              range: { 300. 200 };
		              yourself.
	edgeScale := NSScale linear
		             domain: domain;
		             range: { 10. 100 };
		             yourself
]

{ #category : #private }
ScpInteractions >> createEventShapes [

	eventShapes := events values collect: [ :eventlist |
		               | source destination |
		               source := objectShapes at: eventlist first origin id.
		               destination := objectShapes at:
			                              eventlist first destination id.
		               ScpLinkShapeBuilder new
			               from: source to: destination;
			               events: eventlist;
								scale: edgeScale;
			               build ]
]

{ #category : #private }
ScpInteractions >> createObjectShape: aObject [

	objectShapes at: aObject id ifAbsentPut: [
		ScpObjectShapeBuilder new
			object: aObject;
			build ]
]

{ #category : #accessing }
ScpInteractions >> events: aEvents [
	aEvents do: [ :e | self registerEvent: e ].
	self computeScales.
	self createEventShapes.
	events := nil
]

{ #category : #private }
ScpInteractions >> highlightable [

	^ RSHighlightable new
		  withLines;
		  highlightBorder: (RSBorder new
				   color: Color red translucent;
				   width: 2;
				   yourself);
				yourself
]

{ #category : #initialization }
ScpInteractions >> initialize [ 

	objectShapes := Dictionary new.
	events := Dictionary new.
	
]

{ #category : #private }
ScpInteractions >> registerEvent: aEvent [

	| origin destination |
		
	aEvent isInteraction ifFalse: [^ self].
		origin := aEvent origin.
		destination := aEvent destination.

		self createObjectShape: origin.
		self createObjectShape: destination.

		events
			at: aEvent origin id , aEvent destination id
			ifPresent: [ :l | l add: aEvent ]
			ifAbsentPut: [
				OrderedCollection new
					add: aEvent;
					yourself ]
]

{ #category : #hooks }
ScpInteractions >> renderIn: aCanvas [

	aCanvas addAll: objectShapes values.
	aCanvas addAll: eventShapes.

	aCanvas nodes @ self highlightable.
	aCanvas lines pushBack.

	self applyLayoutOn: aCanvas.
	aCanvas @ RSCanvasController
]
