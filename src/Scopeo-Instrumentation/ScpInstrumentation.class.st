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
		'linkForMethodCall'
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
ScpInstrumentation >> classesOfMethodsToInstrument [

	^ classesOfMethodsToInstrument
]

{ #category : 'parameters' }
ScpInstrumentation >> handler: aHandler [

	handler := aHandler



	
]

{ #category : 'accessing' }
ScpInstrumentation >> imageMethods: aSelector [

	^ imageMethods select: [ :m | m selector = aSelector ]
]

{ #category : 'parameters' }
ScpInstrumentation >> initialize [

	imageMethods := SystemNavigation default allMethodsSelect: [ :b | true ].

]

{ #category : 'services' }
ScpInstrumentation >> install [

	self methodsToInstrument do: [ :method |
		self instrumentMethodCall: method.
		self instrumentMessageSends: method.
		self instrumentAssignments: method.
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
	
	| nodes methods |
	nodes := aMethod ast sendNodes.
	nodes := nodes reject: [ :n | n receiver isBlock ].
	methods := nodes flatCollect: [ :n | self imageMethods: n selector ].
	methods := methods reject: [ :m | self methodsToInstrument includes: m ].
	methods do: [ :m |
		m ast linkIfAbsent: self linkForMessageSend.
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
		  linkForAssignment control: #before.
		  linkForAssignment arguments: #( value variable object).
		  "linkForAssignment optionArgsAsArray: true."
		  linkForAssignment optionCompileOnLinkInstallation: true.
		  linkForAssignment metaObject: handler.
		  linkForAssignment selector: #onAssignmentOf:to:of:.
		  ^ linkForAssignment ]
]

{ #category : 'private' }
ScpInstrumentation >> linkForMessageSend [

	^ linkForMessageSend ifNil: [
		  linkForMessageSend := MetaLink new.
		  linkForMessageSend control: #before.
		  linkForMessageSend arguments: #( method receiver object arguments ).
		  "linkForMessageSend optionArgsAsArray: true."
		  linkForMessageSend optionCompileOnLinkInstallation: true.
		  linkForMessageSend metaObject: handler.
		  linkForMessageSend selector: ##onCallOf:on:from:with:.
		  ^ linkForMessageSend ]
]

{ #category : 'private' }
ScpInstrumentation >> linkForMethodCall [

	^ linkForMethodCall ifNil: [
		  linkForMethodCall := MetaLink new.
		  linkForMethodCall control: #before.
		  linkForMethodCall arguments: #( method object sender arguments ).
		  "linkForMethodCall optionArgsAsArray: true."
		  linkForMethodCall optionCompileOnLinkInstallation: true.
		  linkForMethodCall metaObject: handler.
		  linkForMethodCall selector: #onCallOf:on:from:with:.
		  ^ linkForMethodCall ]
]

{ #category : 'accessing' }
ScpInstrumentation >> methodsToInstrument [

	^ methodsToInstrument
]

{ #category : 'parameters' }
ScpInstrumentation >> methodsToInstrument: aMethodCollection [

	methodsToInstrument := aMethodCollection asIdentitySet.
	classesOfMethodsToInstrument := aMethodCollection collect: [ :m | m methodClass ].
	classesOfMethodsToInstrument := classesOfMethodsToInstrument asIdentitySet.
]

{ #category : 'private' }
ScpInstrumentation >> onMessageSend: aMethod to: aReceiver from: aSender with: aArguments [
	
	(self classesOfMethodsToInstrument includes: aSender class) ifFalse: [ ^ self ].
	handler onCallOf: aMethod on: aReceiver from: aSender with: aArguments.
				
]

{ #category : 'services' }
ScpInstrumentation >> uninstall [
	
	self linkForAssignment uninstall.
	self linkForMessageSend uninstall.
	self linkForMethodCall uninstall.
]
