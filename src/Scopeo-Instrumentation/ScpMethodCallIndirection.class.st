Class {
	#name : #ScpMethodCallIndirection,
	#superclass : #ScpInstrumentationIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #private }
ScpMethodCallIndirection >> indirectionNode: aNode [

	^ RBParser parseExpression: (
		'(ScpInstrumentationRegistry instance at: {1}) method: #{2} of: self from: (thisContext sender receiver) with: {3}'
		format: { self hash 
			. aNode selector
			. '{', (aNode argumentNames joinUsing: ' . ') , '}'
		}
	)
]

{ #category : #services }
ScpMethodCallIndirection >> installOn: aNode [

	aNode isMethod ifFalse: [ 
		self error: 'Cannot install method call indirection on node: ', aNode asString 
	].
	aNode body addNodeFirst: (self indirectionNode: aNode).
]

{ #category : #private }
ScpMethodCallIndirection >> method: aSelector of: aReceiver from: aSender with: aArguments [
	
	handler onMethodCall: aSelector of: aReceiver from: aSender with: aArguments
	
]
