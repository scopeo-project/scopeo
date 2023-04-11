Class {
	#name : #ObjectGraphPresenter,
	#superclass : #SpPresenter,
	#traits : 'TStDebuggerExtension',
	#classTraits : 'TStDebuggerExtension classTrait',
	#instVars : [
		'model',
		'narrowedGraphObject',
		'narrowedGraph',
		'selectedObject',
		'selectedInteraction',
		'selectedValue',
		'tracer',
		'objectLabel',
		'interactionLabel',
		'valueLabel',
		'canvas',
		'initializeBtn',
		'incomingInteractionsBtn',
		'outgoingInteractionsBtn',
		'interactionBeforeBtn',
		'containsValueBtn'
	],
	#category : #'Scopeo-StDebugger-Extension-UI'
}

{ #category : #layout }
ObjectGraphPresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #objectLabel expand: false fill: false;
		add: #interactionLabel expand: false fill: false;
		add: #valueLabel expand: false fill: false;
		add: #interactionLabel expand: false fill: false;
		add: #initializeBtn expand: false fill: false;
		add: #incomingInteractionsBtn expand: false fill: false;
		add: #interactionBeforeBtn expand: false fill: false;
		add: #containsValueBtn expand: false fill: false;
		add: #canvas;
		yourself
]

{ #category : #initialization }
ObjectGraphPresenter >> connectPresenters [

]

{ #category : #'debugger extension' }
ObjectGraphPresenter >> debuggerExtensionToolName [

	^ 'Scopeo'
]

{ #category : #initialization }
ObjectGraphPresenter >> initializeModel [

	tracer := debugger debuggerActionModel tracer.
	model := ObjectGraphBuilder new 
		debuggerTracer: tracer; 
		build.
]

{ #category : #initialization }
ObjectGraphPresenter >> initializePresenters [

	objectLabel := self newLabel.
	interactionLabel := self newLabel.
	valueLabel := self newLabel.
		
	initializeBtn := self newButton
		label: 'Initialize';
		action: [ self initializeModel ].
	
	incomingInteractionsBtn := self newButton 
		label: 'Incoming interactions to selected object';
		action: [ self updateGraphPresenter:   
			(IsIncomingInteraction oid: (tracer getOidOf: selectedObject))
		].
	
	interactionBeforeBtn := self newButton 
		label: 'Selected interaction trace';
		action: [ self updateGraphPresenter: (IsInteractionBefore edge: selectedInteraction) ].
		
	containsValueBtn := self newButton 
		label: 'Selected interaction trace with selected value';
		action: [ self updateGraphPresenter: 
			(And 
				l: (IsInteractionBefore edge: selectedInteraction) 
				r: (MessageWithArgument value: selectedValue))
		].
	
	canvas := self newRoassal.
]

{ #category : #accessing }
ObjectGraphPresenter >> selectObject: aObject [

	selectedObject := aObject.
	self updatePresenter
]

{ #category : #accessing }
ObjectGraphPresenter >> selectValue: aObject [

	selectedValue := aObject.
	self updatePresenter
]

{ #category : #initialization }
ObjectGraphPresenter >> updateGraphPresenter: aPredicate [

	| graph |
	graph := ObjectGraphQuery new 
		graph: model; 
		predicate: (
			And
				l: (InteractionToType new class: Player)
				r: aPredicate
		);
		execute.

	canvas refresh.
	ObjectGraphVisualization new
		graph: graph;
		canvas: canvas canvas;
		onEdgeClickDo: [ :e | 
			selectedInteraction := e.
			tracer timeTravelToBytecodeIndex: e action bytecodeIndex.
			self updatePresenter.
		];
		render.

]

{ #category : #initialization }
ObjectGraphPresenter >> updatePresenter [

	selectedObject ifNotNil: [ 
		objectLabel label: 
			'Selected object: '
			, selectedObject className
			, '(', (tracer getOidOf: selectedObject) asString , ')'
	].
	
	selectedInteraction ifNotNil: [ 
		interactionLabel label: 'Selected interaction: ' , selectedInteraction asString		
	].

	selectedValue ifNotNil: [ 
		valueLabel label: 
			'Selected value: ' 
			, selectedValue asString
	].
]
