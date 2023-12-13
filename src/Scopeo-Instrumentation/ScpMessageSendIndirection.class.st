Class {
	#name : #ScpMessageSendIndirection,
	#superclass : #ScpASTIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #'instance creation' }
ScpMessageSendIndirection >> for: aNode [

	aNode isInstanceVariable ifFalse: [ self error: 'Cannot install message send indirection on node: ', aNode ].
	super for: aNode
]
