Class {
	#name : #ScpMethodCallIndirection,
	#superclass : #ScpASTIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #accessing }
ScpMethodCallIndirection >> indirectionNode: aNode [

	^ RBParser parseExpression: (
		'(ScpInstrumentationRegistry instance at: {1}) onMethodCall: {2} of: self from: thisContext receiver with: {3}' 
		format: {identifier . aNode selector . aNode arguments}
	  ).
	
]

{ #category : #displaying }
ScpMethodCallIndirection >> installOn: aNode [

	super installOn: aNode.
	aNode ast body addNodeFirst: (self indirectionNode: aNode ast).
]

{ #category : #testing }
ScpMethodCallIndirection >> isCompatibleWith: aNode [

	^ aNode isMethod
]

{ #category : #accessing }
ScpMethodCallIndirection >> name [

	^ 'Method call indirection'
]

{ #category : #'events handling' }
ScpMethodCallIndirection >> onMethodCall: aMethodSelector of: aReceiver from: aSender with: aArguments [
   
	handler onMethodCall: aMethodSelector of: aReceiver from: aSender with: aArguments
]
