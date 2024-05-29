Class {
	#name : 'ScpExecutionModel',
	#superclass : 'ScpInstrumentationHandler',
	#instVars : [
		'timestamp',
		'events',
		'callStack',
		'storedObjects',
		'storedClasses'
	],
	#category : 'Scopeo',
	#package : 'Scopeo'
}

{ #category : 'events handling' }
ScpExecutionModel >> addClass: aClass [

	| class |
	self haltIf: aClass name = 'ScpExampleObjectA'.
	storedClasses at: aClass name ifPresent: [ :c | ^ c ].
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
	storedClasses at: class name put: class.
	^ class
]

{ #category : 'adding' }
ScpExecutionModel >> addMethod: aMethod class: aClass [
	
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

{ #category : 'events handling' }
ScpExecutionModel >> addObject: anObject [

	| class object |
	
	anObject isClass ifTrue: [ ^ self addClass: anObject ].
	storedObjects at: anObject ifPresent: [ :o | ^ o ].
	
	class := self addClass: anObject class.
	object := ScpObject new.
	object objectClass: class.
	object state: ( class attributes collect: [ :a |
		ScpBindedVariable new 
			variable: a;
			value: (self addObject: (anObject readSlotNamed: a name)); 
			yourself	
	]). 
	storedObjects at: anObject put: object .
	
	^ object
]

{ #category : 'accessing' }
ScpExecutionModel >> events [

	^ events
]

{ #category : 'initialization' }
ScpExecutionModel >> initialize [

	timestamp := 0.
	
	events := Stack new.
	callStack := Stack new.

	storedObjects := WeakKeyDictionary new.
	storedClasses := Dictionary new.
]

{ #category : 'events handling' }
ScpExecutionModel >> method: aSelector sender: aSender receiver: aReceiver arguments: anArguments [
	
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
	
	callStack push: call

]

{ #category : 'as yet unclassified' }
ScpExecutionModel >> nextEvent: anEvent [

	self previousEvent ifNotNil: [ :e | e next: anEvent ].
	events push: anEvent
]

{ #category : 'events handling' }
ScpExecutionModel >> node: aNodeId assignment: aVariable object: anObject value: aValue [

	| update expression value |

	expression := ScpAssignment new identifier: aNodeId; yourself.
	callStack top method addCoveredExpression: expression.
	
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

{ #category : 'events handling' }
ScpExecutionModel >> node: aNodeId message: aSelector sender: aSender receiver: aReceiver arguments: anArguments [

	| call expression |
	
	expression := ScpMessageSend new identifier: aNodeId; yourself.
	callStack top method addCoveredExpression: expression.
	
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
	callStack push: call.
]

{ #category : 'events handling' }
ScpExecutionModel >> node: aNodeId return: aValue [

	callStack pop return: (self addObject: aValue)
]

{ #category : 'events handling' }
ScpExecutionModel >> node: aNodeId super: aSelector sender: aSender arguments: anArguments [

	| call expression |

	expression := ScpMessageSend new identifier: aNodeId; yourself.
	callStack top method addCoveredExpression: expression.
	
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
	callStack push: call.
]

{ #category : 'accessing' }
ScpExecutionModel >> previousEvent [

	events ifEmpty: [ ^ nil ].
	^ events top.
]

{ #category : 'accessing' }
ScpExecutionModel >> timestamp [

	timestamp := timestamp + 1.
	^ timestamp
]
