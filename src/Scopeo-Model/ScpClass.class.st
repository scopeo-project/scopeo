Class {
	#name : 'ScpClass',
	#superclass : 'ScpStaticElement',
	#instVars : [
		'parent',
		'name',
		'attributes',
		'methods'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpClass class >> uml: aStream [

	super uml: aStream.
	aStream cr << self name << ' *-- "methods" ' << ScpMethod name.
	aStream cr << self name << ' *-- "attributes" ' << ScpAttribute name.
	aStream cr << self name << ' o-- "parent" ' << self name
	
]

{ #category : 'adding' }
ScpClass >> addAttribute: anAttributeName [

	^ attributes at: anAttributeName asSymbol ifAbsentPut: [ 
			ScpAttribute new 
				name: anAttributeName;
				attributeClass: self; 
				yourself
	  ]
]

{ #category : 'adding' }
ScpClass >> addMethod: aMethod [

	^ methods at: aMethod name ifAbsent: [ 
		methods at: aMethod name put: aMethod.
		aMethod methodClass: self
	]
]

{ #category : 'adding' }
ScpClass >> attributeNamed: aStringOrSymbol [

	^ attributes at: aStringOrSymbol asString ifAbsent: [ ^ nil ]
]

{ #category : 'accessing' }
ScpClass >> attributes [

	^ attributes
]

{ #category : 'accessing' }
ScpClass >> attributes: anAttributeList [

	anAttributeList do: [ :a |
		self addAttribute: a name
	]
]

{ #category : 'initialization' }
ScpClass >> initialize [

	attributes := Dictionary new.
	methods := Dictionary new.
]

{ #category : 'adding' }
ScpClass >> methodNamed: aStringOrSymbol [

	^ methods at: aStringOrSymbol asSymbol ifAbsent: [ ^ nil ]
]

{ #category : 'accessing' }
ScpClass >> methods [

	^ methods
]

{ #category : 'accessing' }
ScpClass >> name [

	^ name
]

{ #category : 'accessing' }
ScpClass >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
ScpClass >> parent [

	^ parent
]

{ #category : 'printing' }
ScpClass >> printOn: aStream [

	aStream << self name asString
]
