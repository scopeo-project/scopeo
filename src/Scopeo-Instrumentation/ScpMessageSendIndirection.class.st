Class {
	#name : #ScpMessageSendIndirection,
	#superclass : #ScpInstrumentationIndirection,
	#instVars : [
		'receiverNodes'
	],
	#category : #'Scopeo-Instrumentation'
}

{ #category : #private }
ScpMessageSendIndirection >> indirectionNode: aNode [

	^ RBParser parseExpression: (
		'(ScpInstrumentationRegistry instance at: {1}) message: [{2}] selector: #{3} to: {4} with: {5} '
		format: { 
			self hash 
			. aNode sourceCode
			. aNode selector
			. aNode receiver sourceCode
			. '{', ((aNode arguments collect: [:a | a sourceCode ]) joinUsing: ' . ') , '}'
		}
	)
]

{ #category : #services }
ScpMessageSendIndirection >> installOn: aNode [

	aNode isMessage ifFalse: [ 
		self error: 'Cannot install message send indirection on node: ', aNode 
	].
	super installOn: aNode
]

{ #category : #private }
ScpMessageSendIndirection >> message: aMessageBlock selector: aSelector to: aReceiver with: aArguments [

	handler onMessageSent: aSelector to: aReceiver with: aArguments.
	aMessageBlock value
]
