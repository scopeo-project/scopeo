Class {
	#name : 'ScpObjectEvent',
	#superclass : 'ScpDynamicElement',
	#instVars : [
		'timestamp',
		'object',
		'previous',
		'next',
		'source'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpObjectEvent class >> uml: aStream [

	super uml: aStream.
	
	self = ScpObjectEvent ifFalse: [ ^ self ].
	aStream cr << self name << ' o-- ' << self name.
	aStream cr << self name << ' o-- ' << ScpExpression name.
	
]

{ #category : 'testing' }
ScpObjectEvent >> hasNext [

	^ self next isNotNil
]

{ #category : 'testing' }
ScpObjectEvent >> hasPrevious [

	^ self previous isNotNil
]

{ #category : 'accessing' }
ScpObjectEvent >> next [

	^ next
]

{ #category : 'accessing' }
ScpObjectEvent >> next: anObjectEvent [

	next := anObjectEvent
]

{ #category : 'accessing' }
ScpObjectEvent >> object [

	^ object
]

{ #category : 'accessing' }
ScpObjectEvent >> object: anObject [

	object := anObject
]

{ #category : 'accessing' }
ScpObjectEvent >> previous [

	^ previous 
]

{ #category : 'accessing' }
ScpObjectEvent >> previous: anObjectEvent [

	previous := anObjectEvent
]

{ #category : 'accessing' }
ScpObjectEvent >> source [

	^ source
]

{ #category : 'accessing' }
ScpObjectEvent >> source: aNode [

	source := aNode
]

{ #category : 'accessing' }
ScpObjectEvent >> timestamp [

	^ timestamp
]

{ #category : 'accessing' }
ScpObjectEvent >> timestamp: anObject [

	timestamp := anObject
]
