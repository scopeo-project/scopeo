Class {
	#name : #ObjectGraphVisualization,
	#superclass : #ObjectGraphVisitor,
	#instVars : [
		'graph',
		'canvas',
		'vertexShapes',
		'vertexGroupShapes',
		'onEdgeClickDo'
	],
	#category : #'Scopeo-Graph-Visualization'
}

{ #category : #accessing }
ObjectGraphVisualization >> canvas [

^ canvas
]

{ #category : #'api - building' }
ObjectGraphVisualization >> canvas: aCanvas [

	^ canvas := aCanvas
]

{ #category : #'api - building' }
ObjectGraphVisualization >> graph: aGraph [

	graph := aGraph
]

{ #category : #initialization }
ObjectGraphVisualization >> initialize [

	canvas := RSCanvas new.
	
	vertexShapes := Dictionary new.
	vertexGroupShapes := Dictionary new.
	
]

{ #category : #accessing }
ObjectGraphVisualization >> onEdgeClickDo: aBlock [

	onEdgeClickDo := aBlock
]

{ #category : #'api - showing' }
ObjectGraphVisualization >> open [
	
	^ canvas open
]

{ #category : #'api - showing' }
ObjectGraphVisualization >> render [

	graph accept: self
]

{ #category : #'api - showing' }
ObjectGraphVisualization >> show [
	
	self render.
	self open
]

{ #category : #private }
ObjectGraphVisualization >> vertexGroupShape: aVertex [

	vertexGroupShapes at: aVertex object className ifAbsentPut: [
		canvas add: (ObjectGraphVertexGroupShape new shape)
	].

	^ vertexGroupShapes at: aVertex object className 
]

{ #category : #private }
ObjectGraphVisualization >> vertexShapeAt: aVertex [

	^ vertexShapes at: aVertex objectOid
]

{ #category : #visiting }
ObjectGraphVisualization >> visitEdge: aEdge [

	canvas add: (
		ObjectGraphEdgeShape new 
			model: aEdge;
			origin: (self vertexShapeAt: aEdge origin); 
			destination: (self vertexShapeAt: aEdge destination);
			onClickDo: [ onEdgeClickDo cull: aEdge ];
			shape
	)
]

{ #category : #visiting }
ObjectGraphVisualization >> visitGraph: aGraph [

	aGraph vertices valuesDo: [ :e | e accept: self ].
	aGraph edges do: [ :e | e accept: self ].

	canvas nodes do: [ :aComposite |
		RSSimpleForceBasedLayout new on: aComposite nodes.
		aComposite adjustToChildren.
		aComposite padding: 10.
	].

	canvas lines pushBack.
	RSSimpleForceBasedLayout new on: canvas nodes.
	canvas @ RSResizeParentWhenChildMoves.
	canvas @ RSCanvasController
	
	
	
]

{ #category : #visiting }
ObjectGraphVisualization >> visitVertex: aVertex [

	vertexShapes at: aVertex objectOid ifAbsentPut: [ 
		ObjectGraphVertexShape new
			model: aVertex;
			shape 
	].

	(self vertexGroupShape: aVertex) add: (self vertexShapeAt: aVertex)
]
