Class {
	#name : #ScpInstrumentation,
	#superclass : #Object,
	#instVars : [
		'handler',
		'methodsToInstrument',
		'visitor'
	],
	#classInstVars : [
		'instrumentedMethods'
	],
	#category : #'Scopeo-Instrumentation'
}

{ #category : #private }
ScpInstrumentation class >> uninstallAll [

	<script: 'self uninstallAll'>
	ScpInstrumentationRegistry instance instrumentations do: [ :i | 
		i uninstall 
	]

]

{ #category : #private }
ScpInstrumentation >> assignment: aBlockAssignment variable: aVariable of: anObject value: aValue [

	handler onAssignment: aVariable of: anObject value: aValue.
	^ aBlockAssignment value
]

{ #category : #parameters }
ScpInstrumentation >> handler: aHandler [

	handler := aHandler



	
]

{ #category : #initialization }
ScpInstrumentation >> initialize [

	visitor := ScpInstrumentationRBVisitor new
		indirectionIdentifier: self hash;
		yourself
]

{ #category : #services }
ScpInstrumentation >> install [

	self methodsToInstrument ifEmpty: [ ^ self ].
	
	self registry register: self.
	
	self methodsToInstrument do: [ :method |
		| ast |
		ast := method ast copy.
		ast := visitor visit: ast.
		method methodClass compile: ast formattedCode.

		[ self registry addMethod: method ] 
			on: Error 
			do: [ self uninstall ]
	]
]

{ #category : #private }
ScpInstrumentation >> message: aMessageBlock selector: aMessageSelector to: aReceiver with: anArguments [

	handler
		onMessageSent: aMessageSelector
		to: aReceiver
		with: anArguments.
	^ aMessageBlock value
]

{ #category : #private }
ScpInstrumentation >> method: aMethodSelector of: aReceiver from: aSender with: anArguments [

	handler
		onMethodCall: aMethodSelector
		of: aReceiver
		from: aSender
		with: anArguments
]

{ #category : #accessing }
ScpInstrumentation >> methodsToInstrument [

	^ methodsToInstrument
]

{ #category : #parameters }
ScpInstrumentation >> methodsToInstrument: aMethodCollection [

	(self registry instrumentedMethods includesAny: aMethodCollection) ifTrue: [ 
		self error: 'At least one of the methods provided has already been instrumented.' 
	].
	methodsToInstrument := aMethodCollection
]

{ #category : #private }
ScpInstrumentation >> registry [

	^ ScpInstrumentationRegistry instance
]

{ #category : #services }
ScpInstrumentation >> uninstall [
	
	self methodsToInstrument ifNotNil: [ :methods | 
		methods do: [ :m | 
			m methodClass addSelector: m selector withMethod: m.
			self registry removeMethod: m
		]
	].
	self registry unregister: self
]
