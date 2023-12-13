Class {
	#name : #ScpRBValueNodeIndirection,
	#superclass : #ScpRBNodeIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #actions }
ScpRBValueNodeIndirection >> install [

	super install.
	self node parent 
		replaceNode: self node 
		withNode: self indirectionNode
]
