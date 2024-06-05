Class {
	#name : #ScpClass,
	#superclass : #Object,
	#instVars : [
		'parent',
		'name',
		'attributes',
		'methods'
	],
	#category : 'Scopeo-Model'
}

{ #category : #adding }
ScpClass >> addAttribute: aAttribute [

	^ attributes at: aAttribute name asString ifAbsentPut: [ 
			aAttribute attributeClass: self; 
			yourself
	  ]
]

{ #category : #adding }
ScpClass >> addMethod: aMethod [

	^ methods at: aMethod name ifAbsentPut: [ aMethod methodClass: self; yourself]
]

{ #category : #adding }
ScpClass >> attributeNamed: aStringOrSymbol [

	^ attributes at: aStringOrSymbol asString
]

{ #category : #accessing }
ScpClass >> attributes [

	^ attributes
]

{ #category : #initialization }
ScpClass >> initialize [

	attributes := Dictionary new.
	methods := Dictionary new.
]

{ #category : #adding }
ScpClass >> methodNamed: aString [

	^ methods at: aString
]

{ #category : #accessing }
ScpClass >> methods [

	^ methods
]

{ #category : #accessing }
ScpClass >> name [

	^ name
]

{ #category : #accessing }
ScpClass >> name: anObject [

	name := anObject
]

{ #category : #accessing }
ScpClass >> parent [

	^ parent
]
