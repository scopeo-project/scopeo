Class {
	#name : #ScpTypedIndirection,
	#superclass : #ScpASTIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #accessing }
ScpTypedIndirection >> indirectionNode: aNode [

	self subclassResponsibility
]

{ #category : #displaying }
ScpTypedIndirection >> installOn: aNode [

	(self isCompatibleWith: aNode) ifFalse: [ 
		self error: self name , ' cannot be installed on node: ' , aNode 
	].
	(self nodes includes: aNode) ifTrue: [ 
		self error: self name , ' already installed on node: ' , aNode  
	].
	self nodes add: aNode
]

{ #category : #testing }
ScpTypedIndirection >> isCompatibleWith: aNode [

	^ false
]

{ #category : #accessing }
ScpTypedIndirection >> name [

	self subclassResponsibility
]
