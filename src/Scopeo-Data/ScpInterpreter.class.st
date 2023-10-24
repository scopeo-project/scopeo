Class {
	#name : 'ScpInterpreter',
	#superclass : 'DASTInterpreter',
	#category : 'Scopeo-Data-',
	#package : 'Scopeo-Data',
	#tag : ''
}

{ #category : 'api' }
ScpInterpreter >> currentContext: aContext [

	currentContext := aContext
]

{ #category : 'api' }
ScpInterpreter >> flattenedNodesFrom: aRBNode [

	^ DASTPostOrderTreeVisitor new flattenedNodesFrom: aRBNode.
]
