Class {
	#name : #ScpInstrumentationIndirection,
	#superclass : #Object,
	#instVars : [
		'handler',
		'identifier',
		'arguments',
		'node',
		'symbol',
		'selector'
	],
	#category : #'Scopeo-Instrumentation'
}

{ #category : #accessing }
ScpInstrumentationIndirection >> handler [

	^ handler
]

{ #category : #parameters }
ScpInstrumentationIndirection >> handler: aHandler [

	handler := aHandler
]

{ #category : #private }
ScpInstrumentationIndirection >> indirectionNode: aNode [

	self subclassResponsibility
]

{ #category : #services }
ScpInstrumentationIndirection >> installOn: aNode [

	aNode parent replaceNode: aNode withNode: (self indirectionNode: aNode)
]
