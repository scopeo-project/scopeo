Class {
	#name : 'ScpVariable',
	#superclass : 'ScpStaticElement',
	#instVars : [
		'name',
		'references'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'global' }
ScpVariable class >> selfVariable [

	^ self new 
		name: #self;
		yourself
]

{ #category : 'global' }
ScpVariable class >> superVariable [

	^ self new 
		name: #super;
		yourself
]

{ #category : 'global' }
ScpVariable class >> thisContextVariable [

	^ self new 
		name: #thisContext;
		yourself
]

{ #category : 'uml' }
ScpVariable class >> uml: aStream [

	super uml: aStream.
	
	self = ScpVariable ifFalse: [ ^ self ].
	aStream cr << self name << ' --> "*" ' << ScpVariableReference name.
]

{ #category : 'visiting' }
ScpVariable >> accept: aVisitor [

	^ aVisitor visitVariableReference: self 
]

{ #category : 'adding' }
ScpVariable >> addReference: aReference [

	references add: aReference
]

{ #category : 'adding' }
ScpVariable >> initialize [
	
	references := OrderedCollection new
]

{ #category : 'testing' }
ScpVariable >> isSelfVariable [

	^ self name = #self
]

{ #category : 'testing' }
ScpVariable >> isSuperVariable [

	^ self name = #super
]

{ #category : 'testing' }
ScpVariable >> isThisContextVariable [ 

	^ self name = #thisContext
]

{ #category : 'accessing' }
ScpVariable >> name [

	^ name
]

{ #category : 'accessing' }
ScpVariable >> name: aString [

	name := aString
]

{ #category : 'printing' }
ScpVariable >> printOn: aStream [

	aStream << 'Var(' << self name asString << ')'
]
