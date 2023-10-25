Class {
	#name : 'ScpInterpreter',
	#superclass : 'DASTInterpreter',
	#category : 'Scopeo-Data',
	#package : 'Scopeo-Data'
}

{ #category : 'api' }
ScpInterpreter >> currentContext: aContext [

	currentContext := aContext
]

{ #category : 'api' }
ScpInterpreter >> flattenedNodesFrom: aRBNode [

	^ DASTPostOrderTreeVisitor new flattenedNodesFrom: aRBNode.
]

{ #category : 'accessing' }
ScpInterpreter >> programCounter: aCounter [

	programCounter := aCounter
]
