Class {
	#name : #ObjectsInteractionsVisualization,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'vertexShapes',
		'vertexGroupShapes',
		'objectsInteractions',
		'interactionMenuEntries',
		'objectMenuEntries',
		'aId'
	],
	#category : #'Scopeo-InteractionsVisualization'
}

{ #category : #hooks }
ObjectsInteractionsVisualization >> addInteractionMenuEntry: aName do: aAction [

	interactionMenuEntries at: aName put: aAction
	
]

{ #category : #hooks }
ObjectsInteractionsVisualization >> addObjectMenuEntry: aName do: aAction [

	objectMenuEntries at: aName put: aAction
	
]

{ #category : #initialization }
ObjectsInteractionsVisualization >> initialize [
	
	vertexShapes := Dictionary new.
	vertexGroupShapes := Dictionary new.
	
	interactionMenuEntries := Dictionary new.
	objectMenuEntries := Dictionary new.

]

{ #category : #'private - rendering' }
ObjectsInteractionsVisualization >> menuEntries: aEntries in: aMenuMorph for: aInteraction [

	aEntries keysAndValuesDo: [ :k :v | 
		(aMenuMorph 
			add: k
			target: self
			selector: #onClick:perform:
			argumentList: {  aInteraction . v })
	].

	
]

{ #category : #'private - rendering' }
ObjectsInteractionsVisualization >> objectShapeAt: aObjectId [

	^ vertexShapes at: aObjectId
]

{ #category : #'api - building' }
ObjectsInteractionsVisualization >> objectsInteractions: aObjectsInteractions [

	objectsInteractions := aObjectsInteractions 
]

{ #category : #'private - rendering' }
ObjectsInteractionsVisualization >> renderGroupShape: aObject in: aCanvas [

	vertexGroupShapes at: aObject className ifAbsentPut: [
		aCanvas add: (ObjectsGroupShape new shape)
	].

	^ vertexGroupShapes at: aObject className 
]

{ #category : #hooks }
ObjectsInteractionsVisualization >> renderIn: aCanvas [

	objectsInteractions objects valuesDo: [ :o | 
		self renderObject: o in: aCanvas 
	].
	objectsInteractions interactions do: [ :e | self renderInteraction: e in: aCanvas  ].

	aCanvas nodes do: [ :aComposite |
		RSSimpleForceBasedLayout new on: aComposite nodes.
		aComposite adjustToChildren.
		aComposite padding: 10.
	].

	aCanvas lines pushBack.
	RSSimpleForceBasedLayout new on: aCanvas nodes.
	aCanvas @ RSResizeParentWhenChildMoves.
	aCanvas @ RSCanvasController
]

{ #category : #'private - rendering' }
ObjectsInteractionsVisualization >> renderInteraction: aInteraction in: aCanvas [

	aCanvas add: (
		InteractionShape new 
			model: aInteraction;
			origin: (self objectShapeAt: aInteraction origin id); 
			destination: (self objectShapeAt: aInteraction destination id);
			menuEntries: interactionMenuEntries;
			shape
	)
]

{ #category : #'private - rendering' }
ObjectsInteractionsVisualization >> renderObject: aObject in: aCanvas [

	vertexShapes at: aObject id ifAbsentPut: [ 
		ObjectShape new
			model: aObject;
			menuEntries: objectMenuEntries;
			shape 
	].

	(self renderGroupShape: aObject in: aCanvas) add: (self objectShapeAt: aObject id)
]
