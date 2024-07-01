Class {
	#name : 'ScpSystem',
	#superclass : 'Object',
	#instVars : [
		'classes',
		'objects',
		'events',
		'timestamp',
		'callStack',
		'calls'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'adding source' }
ScpSystem >> addPharoClass: aClass [

	^ classes at: aClass name ifAbsentPut: [
		ScpClass new 
			name: aClass name; 
			attributes: (aClass allSlots do: [ :s |
				ScpAttribute new 
					name: s name; 
					yourself
		
			]);
			yourself	
	]
]

{ #category : 'adding' }
ScpSystem >> addPharoLiteral: aLiteralObject [

	^ objects at: aLiteralObject hash ifAbsentPut: [
		ScpObjectLiteral new
			objectClass: (self addPharoClass: aLiteralObject class);
			literalValue: aLiteralObject;
			yourself	
	].
 
]

{ #category : 'adding source' }
ScpSystem >> addPharoMethod: aMethod [
	
	^ ScpMethodBuilder new 
		install: aMethod 
		in: (self addPharoClass: aMethod methodClass)
]

{ #category : 'adding source' }
ScpSystem >> addPharoObject: anObject [

	anObject isClass ifTrue: [ ^ self addPharoClass: anObject ].
	anObject isLiteral ifTrue: [ ^ self addPharoLiteral: anObject ].
	
	^ objects at: anObject hash ifAbsentPut: [
		ScpObject new
			objectClass: (self addPharoClass: anObject class);
		 	state: ((self addPharoClass: anObject class) attributes collect: [ :a |
		 		ScpBindedVariable new 
				variable: a;
				value: (self addPharoObject: (anObject readSlotNamed: a name)); 
				yourself	
			]); 
			yourself.	
	].
]

{ #category : 'adding source' }
ScpSystem >> classNamed: aClassName [

	^ classes at: aClassName asSymbol ifAbsent: [ ^ nil ]
]

{ #category : 'accessing' }
ScpSystem >> classes [

	^ classes values
]

{ #category : 'initialization' }
ScpSystem >> initialize [

	timestamp := 0.
	
	classes := Dictionary new.
	objects := Dictionary new.
	events := Stack new.
	calls := Stack new.
	
]

{ #category : 'accessing' }
ScpSystem >> objectAt: anIdentifier [

	^ objects at: anIdentifier ifAbsent: [ ^ nil ]
]

{ #category : 'accessing' }
ScpSystem >> objects [

	^ objects
]
