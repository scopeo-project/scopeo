Class {
	#name : 'ScpInstrumentation',
	#superclass : 'Object',
	#instVars : [
		'methods',
		'identifier',
		'indirectionNode',
		'indirectionReceiverNode',
		'indirectionReceiverNodes',
		'linkForExecution',
		'linkForAssignment',
		'linkForInvocation',
		'handler'
	],
	#category : 'Scopeo-Instrumentation',
	#package : 'Scopeo-Instrumentation'
}

{ #category : 'private' }
ScpInstrumentation class >> uninstallAll [

	<script: 'self uninstallAll'>
	
	self allInstancesDo: [ :i | i uninstall ]

]

{ #category : 'parameters' }
ScpInstrumentation >> handler: aHandler [

	handler := aHandler



	
]

{ #category : 'services' }
ScpInstrumentation >> install [

	methods do: [ :method |
		self instrumentInvocations: method.
		self instrumentAssignments: method.
		self instrumentExecution: method.
	]
]

{ #category : 'private' }
ScpInstrumentation >> instrumentAssignments: aMethod [

	aMethod ast instanceVariableWriteNodes do: [ :node |
		node linkIfAbsent: self linkForAssignment
	]
]

{ #category : 'private' }
ScpInstrumentation >> instrumentExecution: aMethod [

	aMethod ast linkIfAbsent: self linkForExecution
]

{ #category : 'private' }
ScpInstrumentation >> instrumentInvocations: aMethod [

	| nodes |
	nodes := aMethod ast sendNodes.
	"nodes := nodes reject: [ :node | node arguments isNotEmpty ]."
	nodes := nodes reject: [ :node | node arguments anySatisfy: [ :a | a isBlock ] ].
	self haltOnCount: 2.	
	nodes do: [ :node |
		node linkIfAbsent: self linkForInvocation 
	]
]

{ #category : 'private' }
ScpInstrumentation >> linkForAssignment [

	^ linkForAssignment ifNil: [
		  linkForAssignment := MetaLink new.
		  linkForAssignment control: #before.
		  linkForAssignment arguments: #( object variable value ).
		  linkForAssignment optionArgsAsArray: true.
		  linkForAssignment optionCompileOnLinkInstallation: true.
		  linkForAssignment metaObject: self.
		  linkForAssignment selector: #onAssigment:.
		  ^ linkForAssignment ]
]

{ #category : 'private' }
ScpInstrumentation >> linkForExecution [

	^ linkForExecution ifNil: [
		  linkForExecution := MetaLink new.
		  linkForExecution control: #before.
		  linkForExecution arguments: #( sender selector receiver arguments ).
		  linkForExecution optionArgsAsArray: true.
		  linkForExecution optionCompileOnLinkInstallation: true.
		  linkForExecution metaObject: self.
		  linkForExecution selector: #onExecution:.
		  ^ linkForExecution ]
]

{ #category : 'private' }
ScpInstrumentation >> linkForInvocation [

	^ linkForInvocation ifNil: [
		  linkForInvocation := MetaLink new.
		  linkForInvocation control: #before.
		  linkForInvocation arguments: #( object selector receiver arguments ).
		  linkForInvocation optionArgsAsArray: true.
		  linkForInvocation optionCompileOnLinkInstallation: true.
		  linkForInvocation metaObject: self.
		  linkForInvocation selector: #onInvocation:.
		  ^ linkForInvocation ]
]

{ #category : 'accessing' }
ScpInstrumentation >> methods [

	^ methods
]

{ #category : 'parameters' }
ScpInstrumentation >> methods: aMethodCollection [

	methods := aMethodCollection
]

{ #category : 'private' }
ScpInstrumentation >> onAssignments: aArguments [
	"Arguments: object variable value"
	
	handler onAssignmentOf: aArguments third 
			to: aArguments second
			of: aArguments first.
]

{ #category : 'private' }
ScpInstrumentation >> onExecution: aArguments [
	"Arguments: sender selector receiver arguments"
	
	handler onCallOf: aArguments second 
			on: aArguments third 
			from: aArguments first 
			with: aArguments fourth.
]

{ #category : 'private' }
ScpInstrumentation >> onInvocation: aArguments [
	"Arguments: object selector receiver method"
	
	handler onCallOf: aArguments second 
			on: aArguments third 
			from: aArguments first 
			with: aArguments fourth.
]

{ #category : 'services' }
ScpInstrumentation >> uninstall [
	
	self linkForAssignment uninstall.
	self linkForInvocation uninstall.
	self linkForExecution uninstall.
]
