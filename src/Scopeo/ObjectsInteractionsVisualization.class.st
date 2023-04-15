Class {
	#name : #ObjectsInteractionsVisualization,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'vertexShapes',
		'vertexGroupShapes',
		'onEdgeClickDo',
		'objectsInteractions'
	],
	#category : #'Scopeo-Visualizations'
}

{ #category : #initialization }
ObjectsInteractionsVisualization >> initialize [
	
	vertexShapes := Dictionary new.
	vertexGroupShapes := Dictionary new.
	
]

{ #category : #private }
ObjectsInteractionsVisualization >> objectShapeAt: aObjectId [

	^ vertexShapes at: aObjectId
]

{ #category : #'api - building' }
ObjectsInteractionsVisualization >> objectsInteractions: aObjectsInteractions [

	objectsInteractions := aObjectsInteractions 
]

{ #category : #accessing }
ObjectsInteractionsVisualization >> onInteractionClickDo: aBlock [

	onEdgeClickDo := aBlock
]

{ #category : #private }
ObjectsInteractionsVisualization >> renderGroupShape: aObject in: aCanvas [

	vertexGroupShapes at: aObject className ifAbsentPut: [
		aCanvas add: (ObjectsGroupShape new shape)
	].

	^ vertexGroupShapes at: aObject className 
]

{ #category : #hooks }
ObjectsInteractionsVisualization >> renderIn: aCanvas [

	objectsInteractions objects keysAndValuesDo: [ :k :v | 
		self renderObject: v withId: k in: aCanvas 
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

{ #category : #visiting }
ObjectsInteractionsVisualization >> renderInteraction: aInteraction in: aCanvas [

	aCanvas add: (
		InteractionShape new 
			model: aInteraction;
			origin: (self objectShapeAt: aInteraction originId); 
			destination: (self objectShapeAt: aInteraction destinationId);
			onClickDo: [ onEdgeClickDo cull: aInteraction ];
			shape
	)
]

{ #category : #visiting }
ObjectsInteractionsVisualization >> renderObject: aObject withId: aId in: aCanvas [

	vertexShapes at: aId ifAbsentPut: [ 
		ObjectShape new
			object: aObject;
			objectId: aId;
			model: aObject;
			shape 
	].

	(self renderGroupShape: aObject in: aCanvas) add: (self objectShapeAt: aId)
]
