Class {
	#name : 'ScpInstrumentation',
	#superclass : 'Object',
	#instVars : [
		'linkForAssignment',
		'linkForInvocation',
		'handler',
		'imageMethods',
		'methodsToInstrument',
		'classesOfMethodsToInstrument',
		'linkForMessageSend',
		'linkForMethodCall',
		'errors'
	],
	#category : 'Scopeo-Instrumentation',
	#package : 'Scopeo-Instrumentation'
}

{ #category : 'private' }
ScpInstrumentation class >> uninstallAll [

	<script: 'self uninstallAll'>
	
	self allInstancesDo: [ :i | i uninstall ]

]

{ #category : 'private' }
ScpInstrumentation >> compileInstrumentedMethod: aMethod [

	aMethod invalidate.
	aMethod reflectiveMethod ifNotNil: [ :r |
		[ r compileAndInstallCompiledMethod ]
			on: Error
			do: [ :error | errors add: error ] ]
]

{ #category : 'accessing' }
ScpInstrumentation >> errors [

	^ errors
]

{ #category : 'parameters' }
ScpInstrumentation >> handler: aHandler [

	handler := aHandler



	
]

{ #category : 'initialization' }
ScpInstrumentation >> initialize [

	errors := OrderedCollection new
]

{ #category : 'services' }
ScpInstrumentation >> install [

	self methodsToInstrument do: [ :method |
		self instrumentMethodCall: method.
		self instrumentMessageSends: method.
		self instrumentAssignments: method.
		self compileInstrumentedMethod: method.
	]
]

{ #category : 'private' }
ScpInstrumentation >> instrumentAssignments: aMethod [

	aMethod ast instanceVariableWriteNodes do: [ :node |
		node linkIfAbsent: self linkForAssignment
	]
]

{ #category : 'private' }
ScpInstrumentation >> instrumentMessageSends: aMethod [
	
	aMethod ast sendNodes do: [ :n |
		n linkIfAbsent: self linkForMessageSend.
	]
]

{ #category : 'private' }
ScpInstrumentation >> instrumentMethodCall: aMethod [

	aMethod ast linkIfAbsent: self linkForMethodCall.
]

{ #category : 'private' }
ScpInstrumentation >> linkForAssignment [

	^ linkForAssignment ifNil: [
		  linkForAssignment := MetaLink new.
		  linkForAssignment control: #instead.
		  linkForAssignment arguments: #( operation ).
		  "linkForAssignment optionArgsAsArray: true."
		  linkForAssignment metaObject: self.
		  linkForAssignment selector: #onAssignment:.
		  ^ linkForAssignment ]
]

{ #category : 'private' }
ScpInstrumentation >> linkForMessageSend [

	^ linkForMessageSend ifNil: [
		  linkForMessageSend := MetaLink new.
		  linkForMessageSend control: #instead.
		  linkForMessageSend arguments: #( object operation ).
		  linkForMessageSend optionArgsAsArray: true.
		  linkForMessageSend metaObject: self.
		  linkForMessageSend selector: #onMessageSend:.
		  ^ linkForMessageSend ]
]

{ #category : 'private' }
ScpInstrumentation >> linkForMethodCall [

	^ linkForMethodCall ifNil: [
		  linkForMethodCall := MetaLink new.
		  linkForMethodCall control: #instead.
		  linkForMethodCall arguments: #( sender operation ).
		  linkForMethodCall optionArgsAsArray: true.
		  linkForMethodCall metaObject: self.
		  linkForMethodCall selector: #onMethodCall:.
		  ^ linkForMethodCall ]
]

{ #category : 'accessing' }
ScpInstrumentation >> methodsToInstrument [

	^ methodsToInstrument
]

{ #category : 'parameters' }
ScpInstrumentation >> methodsToInstrument: aMethodCollection [

	methodsToInstrument := aMethodCollection
]

{ #category : 'private' }
ScpInstrumentation >> onAssignment: aArguments [

	| operation |
	
	operation := aArguments first.
	
	handler onAssignmentOf: operation assignedValue to: operation variable name of: operation object.
	operation value. 
]

{ #category : 'private' }
ScpInstrumentation >> onMessageSend: aArguments [

	| sender operation |
	
	sender := aArguments first.
	operation := aArguments second.
	
	handler onCallOf: operation selector on: operation receiver from: sender with: operation arguments.
	operation value. 
]

{ #category : 'private' }
ScpInstrumentation >> onMethodCall: aArguments [

	| sender operation |
	
	sender := aArguments first.
	operation := aArguments second.
	
	handler onCallOf: operation method selector on: operation receiver from: sender with: operation arguments.
	operation value.
]

{ #category : 'services' }
ScpInstrumentation >> uninstall [
	
	self linkForAssignment uninstall.
	self linkForMessageSend uninstall.
	self linkForMethodCall uninstall.
	self methodsToInstrument do: [ :m | m recompile ]
]
