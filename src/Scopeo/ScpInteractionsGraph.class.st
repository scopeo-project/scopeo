Class {
	#name : #ScpInteractionsGraph,
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
ScpInteractionsGraph >> addInteractionMenuEntry: aName do: aAction [

	interactionMenuEntries at: aName put: aAction
	
]

{ #category : #hooks }
ScpInteractionsGraph >> addObjectMenuEntry: aName do: aAction [

	objectMenuEntries at: aName put: aAction
	
]

{ #category : #initialization }
ScpInteractionsGraph >> initialize [
	
	vertexShapes := Dictionary new.
	vertexGroupShapes := Dictionary new.
	
	interactionMenuEntries := Dictionary new.
	objectMenuEntries := Dictionary new.

]

{ #category : #'private - rendering' }
ScpInteractionsGraph >> menuEntries: aEntries in: aMenuMorph for: aInteraction [

	aEntries keysAndValuesDo: [ :k :v | 
		(aMenuMorph 
			add: k
			target: self
			selector: #onClick:perform:
			argumentList: {  aInteraction . v })
	].

	
]

{ #category : #'private - rendering' }
ScpInteractionsGraph >> objectShapeAt: aObjectId [

	^ vertexShapes at: aObjectId
]

{ #category : #'api - building' }
ScpInteractionsGraph >> objectsInteractions: aObjectsInteractions [

	objectsInteractions := aObjectsInteractions 
]

{ #category : #'private - rendering' }
ScpInteractionsGraph >> renderGroupShape: aObject in: aCanvas [

	vertexGroupShapes at: aObject className ifAbsentPut: [
		aCanvas add: (ScpObjectsGroupShape new shape)
	].

	^ vertexGroupShapes at: aObject className 
]

{ #category : #hooks }
ScpInteractionsGraph >> renderIn: aCanvas [

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
ScpInteractionsGraph >> renderInteraction: aInteraction in: aCanvas [

	aCanvas add: (
		ScpInteractionShape new 
			model: aInteraction;
			origin: (self objectShapeAt: aInteraction origin id); 
			destination: (self objectShapeAt: aInteraction destination id);
			menuEntries: interactionMenuEntries;
			shape
	)
]

{ #category : #'private - rendering' }
ScpInteractionsGraph >> renderObject: aObject in: aCanvas [

	vertexShapes at: aObject id ifAbsentPut: [ 
		ScpObjectShape new
			model: aObject;
			menuEntries: objectMenuEntries;
			shape 
	].

	(self renderGroupShape: aObject in: aCanvas) add: (self objectShapeAt: aObject id)
]
