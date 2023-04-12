Class {
	#name : #ObjectsEventsGraphVisualization,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'graph',
		'canvas',
		'vertexShapes',
		'vertexGroupShapes',
		'onEdgeClickDo'
	],
	#category : #'Scopeo-Graph-Visualization'
}

{ #category : #'api - building' }
ObjectsEventsGraphVisualization >> graph: aGraph [

	graph := aGraph
]

{ #category : #initialization }
ObjectsEventsGraphVisualization >> initialize [
	
	vertexShapes := Dictionary new.
	vertexGroupShapes := Dictionary new.
	
]

{ #category : #accessing }
ObjectsEventsGraphVisualization >> onEdgeClickDo: aBlock [

	onEdgeClickDo := aBlock
]

{ #category : #visiting }
ObjectsEventsGraphVisualization >> renderEdge: aEdge in: aCanvas [

	aCanvas add: (
		ObjectGraphEdgeShape new 
			model: aEdge;
			origin: (self vertexShapeAt: aEdge origin); 
			destination: (self vertexShapeAt: aEdge destination);
			onClickDo: [ onEdgeClickDo cull: aEdge ];
			shape
	)
]

{ #category : #private }
ObjectsEventsGraphVisualization >> renderGroupShape: aVertex in: aCanvas [

	vertexGroupShapes at: aVertex object className ifAbsentPut: [
		aCanvas add: (ObjectGraphVertexGroupShape new shape)
	].

	^ vertexGroupShapes at: aVertex object className 
]

{ #category : #hooks }
ObjectsEventsGraphVisualization >> renderIn: aCanvas [

	graph vertices valuesDo: [ :v | self renderVertex: v in: aCanvas ].
	graph edges do: [ :e | self renderEdge: e in: aCanvas  ].

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
ObjectsEventsGraphVisualization >> renderVertex: aVertex in: aCanvas [

	vertexShapes at: aVertex objectOid ifAbsentPut: [ 
		ObjectGraphVertexShape new
			model: aVertex;
			shape 
	].

	(self renderGroupShape: aVertex in: aCanvas) add: (self vertexShapeAt: aVertex)
]

{ #category : #private }
ObjectsEventsGraphVisualization >> vertexShapeAt: aVertex [

	^ vertexShapes at: aVertex objectOid
]
