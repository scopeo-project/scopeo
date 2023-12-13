Class {
	#name : #ScpMessageSendIndirection,
	#superclass : #ScpASTIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #accessing }
ScpMessageSendIndirection >> indirectionNode: aNode [

	^ RBParser parseExpression: (
		'(ScpInstrumentationRegistry instance at: {1}) onMessageSent: {2} of: {3} value: {4}' 
		format: {identifier . aNode selector . aNode receiver . aNode arguments}
	  ).
	
]

{ #category : #displaying }
ScpMessageSendIndirection >> installOn: aNode [

	super installOn: aNode.
]

{ #category : #testing }
ScpMessageSendIndirection >> isCompatibleWith: aNode [

	^ aNode isMessage
]

{ #category : #accessing }
ScpMessageSendIndirection >> name [

	^ 'Message send indirection'
]

{ #category : #'events handling' }
ScpMessageSendIndirection >> onMessageSent: aSelector to: aReceiver with: aArguments [

	handler onMessageSent: aSelector to: aReceiver with: aArguments.
	^ aReceiver perform: aSelector withArguments: aArguments.
]
