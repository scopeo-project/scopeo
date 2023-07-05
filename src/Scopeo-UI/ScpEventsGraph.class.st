Class {
	#name : #ScpEventsGraph,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'events',
		'forceScale',
		'edgeScale',
		'objectShapes',
		'eventShapes'
	],
	#category : #'Scopeo-UI-EventsGraph'
}

{ #category : #layout }
ScpEventsGraph >> applyLayoutOn: aCanvas [

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
ScpEventsGraph >> computeScales [

	| values domain |
	values := events values collect: [ :e | e size ].
	domain := {
		          values min.
		          values max }.
	forceScale := NSScale linear
		              domain: domain;
<<<<<<< HEAD
		              range: { 400. 200 };
=======
		              range: { 300. 200 };
>>>>>>> new-objectevent-model
		              yourself.
	edgeScale := NSScale linear
		             domain: domain;
		             range: { 10. 100 };
		             yourself
]

{ #category : #private }
ScpEventsGraph >> createEventShapes [

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
ScpEventsGraph >> createObjectShape: aObject [

	objectShapes at: aObject id ifAbsentPut: [
		ScpObjectShapeBuilder new
			object: aObject;
			build ]
]

{ #category : #accessing }
ScpEventsGraph >> events: aEvents [
<<<<<<< HEAD

	aEvents objects do: [ :o | self createObjectShape: o ].
	aEvents events do: [ :e | self registerEvent: e ].
=======
	
	aEvents do: [ :e | self registerEvent: e ].
>>>>>>> new-objectevent-model
	self computeScales.
	self createEventShapes.
	events := nil
]

{ #category : #private }
ScpEventsGraph >> highlightable [

	^ RSHighlightable new
		  withLines;
		  highlightBorder: (RSBorder new
				   color: Color red translucent;
				   width: 2;
				   yourself);
				yourself
]

{ #category : #initialization }
ScpEventsGraph >> initialize [ 

	objectShapes := Dictionary new.
	events := Dictionary new.
	
]

{ #category : #private }
ScpEventsGraph >> registerEvent: aEvent [

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
ScpEventsGraph >> renderIn: aCanvas [

	aCanvas addAll: objectShapes values.
	aCanvas addAll: eventShapes.

	aCanvas nodes @ self highlightable.
	aCanvas lines pushBack.

	self applyLayoutOn: aCanvas.
	aCanvas @ RSCanvasController
]
