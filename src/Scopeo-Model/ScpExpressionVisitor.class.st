Class {
	#name : 'ScpExpressionVisitor',
	#superclass : 'Object',
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'testing' }
ScpExpressionVisitor class >> isAbstract [

	^ self == ScpExpressionVisitor
]

{ #category : 'visiting' }
ScpExpressionVisitor >> visit: anExpression [

	^ anExpression accept: self
]

{ #category : 'visiting' }
ScpExpressionVisitor >> visitArray: anArray [

	anArray elements do: [ :e | e accept: self ].

	^ anArray
]

{ #category : 'visiting' }
ScpExpressionVisitor >> visitAssignment: anAssignment [

	^ anAssignment expression accept: self
]

{ #category : 'visiting' }
ScpExpressionVisitor >> visitBlock: aBlock [

	^ aBlock body accept: self
]

{ #category : 'visiting' }
ScpExpressionVisitor >> visitLiteralArray: aLiteralArray [

	aLiteralArray literals do: [ :l | self visitLiteralValue: l ].

	^ aLiteralArray 
]

{ #category : 'visiting' }
ScpExpressionVisitor >> visitLiteralValue: aLiteralValue [

	^ aLiteralValue
]

{ #category : 'visiting' }
ScpExpressionVisitor >> visitMessageSend: aMessageSend [

	aMessageSend receiver accept: self.
	aMessageSend arguments do: [ :a |
		a accept: self
	].	

	^ aMessageSend
]

{ #category : 'visiting' }
ScpExpressionVisitor >> visitReturn: aReturn [

	^ aReturn expression accept: self
]

{ #category : 'visiting' }
ScpExpressionVisitor >> visitSequence: aSequence [

	^ aSequence statements collect: [ :s | s accept: self ]
]

{ #category : 'visiting' }
ScpExpressionVisitor >> visitVariableReference: aReference [

	^ aReference
]
