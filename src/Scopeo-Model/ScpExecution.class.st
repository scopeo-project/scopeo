Class {
	#name : #ScpExecution,
	#superclass : #Object,
	#instVars : [
		'classes',
		'objects',
		'events',
		'timestamp',
		'callStack',
		'calls'
	],
	#category : #'Scopeo-Model'
}

{ #category : #'adding events' }
ScpExecution >> addAssignmentEvent: aVariable object: anObject value: aValue node: aNodeId [

	| update expression value |

	expression := ScpAssignment new identifier: aNodeId; yourself.
	calls top method addCoveredExpression: expression.
	
	value := ScpBindedVariable new 
		variable: ((self addObject: anObject) objectClass attributeNamed: aVariable);
		value: (self addObject: aValue);
		yourself.
		
	update := ScpStateUpdate new
		timestamp: self timestamp;
		previous: self previousEvent;
		object: (self addObject: anObject);
		source: expression;
		value: value;
		yourself.
		
	self nextEvent: update
]

{ #category : #'adding source' }
ScpExecution >> addClass: aClass [

	| class |
	classes at: aClass name ifPresent: [ :c | ^ c ].
	class := ScpClass new 
		name: aClass name; 
		yourself.
	aClass allSlots do: [ :s |
		class addAttribute:(
			ScpAttribute new 
				name: s name; 
				yourself
		).
	].
	classes at: class name put: class.
	^ class
]

{ #category : #'adding events' }
ScpExecution >> addMessageEvent: aSelector sender: aSender receiver: aReceiver arguments: anArguments node: aNodeId [

	| call expression |
	
	expression := ScpMessageSend new identifier: aNodeId; yourself.
	calls top method addCoveredExpression: expression.
	
	call := ScpMethodCall new
		timestamp: self timestamp;
		previous: self previousEvent;
		object: (self addObject: aReceiver);
		method: (self addMethod: aSelector class: aReceiver class);
		source: expression;
		yourself.
		
	call arguments: ((1 to: anArguments size) collect: [ :i | 
		ScpBindedVariable new
			variable: (call method parameters at: i);
			value: (self addObject: (anArguments at: i));
			yourself
	]).
	self nextEvent: call.
	calls push: call.
]

{ #category : #'adding source' }
ScpExecution >> addMethod: aMethod class: aClass [
	
	| class method |
	class := self addClass: aClass.
	method := ScpMethod new 
		name: aMethod;
		yourself.
	method parameters: ((aClass lookupSelector: aMethod) argumentNames collect: [ :a |
		ScpVariable new 
			name: a;
			yourself 
	]).
	^ class addMethod: method
]

{ #category : #'adding events' }
ScpExecution >> addMethodEvent: aSelector sender: aSender receiver: aReceiver arguments: anArguments [
	
	| call |

	call := ScpExternalMethodCall new
		timestamp: self timestamp;
		previous: self previousEvent;
		sender: (self addObject: aSender);
		object: (self addObject: aReceiver);
		method: (self addMethod: aSelector class: aReceiver class);
		yourself. 
	call arguments: ((1 to: anArguments size) collect: [ :i | 
		ScpBindedVariable new
			variable: (call method parameters at: i);
			value: (self addObject: (anArguments at: i));
			yourself
	]).

	self nextEvent: call.
	calls push: call

]

{ #category : #'adding source' }
ScpExecution >> addObject: anObject [

	| class object |

	anObject isClass ifTrue: [ ^ self addClass: anObject ].
	objects at: anObject hash ifPresent: [ :o | ^ o ].
	
	class := self addClass: anObject class.
	anObject isLiteral 
		ifTrue: [ 
			 object := ScpObjectLiteral new.
			 object literalValue: anObject. 
		]
		ifFalse: [ 
			 object := ScpObject new.
			 object state: (class attributes collect: [ :a |
			 ScpBindedVariable new 
				variable: a;
				value: (self addObject: (anObject readSlotNamed: a name)); 
				yourself	
			]). 	
		].
	object objectClass: class.
	objects at: anObject hash put: object .
	
	^ object
]

{ #category : #'adding events' }
ScpExecution >> addReturnEvent: aValue node: aNodeId [ 

	calls pop return: (self addObject: aValue)
]

{ #category : #'adding events' }
ScpExecution >> addSuperEvent: aSelector sender: aSender arguments: anArguments node: aNodeId [

	| call expression |

	expression := ScpMessageSend new identifier: aNodeId; yourself.
	calls top method addCoveredExpression: expression.
	
	call := ScpSuperMethodCall new
		timestamp: self timestamp;
		previous: self previousEvent;
		object: (self addObject: aSender);
		method: (self addMethod: aSelector class: aSender class);
		source: expression;
		yourself.
		
	call arguments: ((1 to: anArguments size) collect: [ :i | 
		ScpBindedVariable new
			variable: (call method arguments at: i);
			value: (self addObject: (anArguments at: i));
			yourself
	]).
	self nextEvent: call.
	calls push: call.
]

{ #category : #accessing }
ScpExecution >> classes [

	^ classes values
]

{ #category : #accessing }
ScpExecution >> events [

	^ events
]

{ #category : #initialization }
ScpExecution >> initialize [

	timestamp := 0.
	
	classes := Dictionary new.
	objects := Dictionary new.
	events := Stack new.
	calls := Stack new.
	
]

{ #category : #private }
ScpExecution >> nextEvent: anEvent [

	self previousEvent ifNotNil: [ :e | e next: anEvent ].
	events push: anEvent
]

{ #category : #accessing }
ScpExecution >> objects [

	^ objects
]

{ #category : #private }
ScpExecution >> previousEvent [

	events ifEmpty: [ ^ nil ].
	^ events top.
]

{ #category : #private }
ScpExecution >> timestamp [

	timestamp := timestamp + 1.
	^ timestamp
]
