Class {
	#name : 'ScpBlock',
	#superclass : 'ScpExpression',
	#instVars : [
		'parameters',
		'body'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpBlock class >> uml: aStream [

	super uml: aStream.
	aStream cr << self name << ' o- "parameters" ' << ScpVariable name.
	aStream cr << self name << ' o- "body" ' << ScpSequence name
]

{ #category : 'visiting' }
ScpBlock >> accept: aVisitor [

	^ aVisitor visitBlock: self
]

{ #category : 'accessing' }
ScpBlock >> body [

	^ body
]

{ #category : 'accessing' }
ScpBlock >> body: aSequenceExpression [

	body := aSequenceExpression.
	body parent: self
	
]

{ #category : 'testing' }
ScpBlock >> isBlock [

	^ true
]

{ #category : 'accessing' }
ScpBlock >> parameters [

	^ parameters
]

{ #category : 'accessing' }
ScpBlock >> parameters: aVariableCollection [

	parameters := aVariableCollection asOrderedCollection
]
