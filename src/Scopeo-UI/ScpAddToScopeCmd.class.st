Class {
	#name : #ScpAddToScopeCmd,
	#superclass : #CmCommand,
	#category : #'Scopeo-UI-Commands'
}

{ #category : #accessing }
ScpAddToScopeCmd class >> defaultDescription [

	^ 'Select a variable to add its value to the Scopeo debugging scope'
]

{ #category : #accessing }
ScpAddToScopeCmd class >> defaultName [

	"<toolbarExtensionDebugCommand: 50>"
	<codeExtensionDebugCommand:1>
	^ 'Scopeo - Add object to scope'
]

{ #category : #executing }
ScpAddToScopeCmd >> execute [

	| selectedContext selectedNode name object|

	selectedContext := self tracer selectedContext.
	selectedNode := self tracer selectedNode.

	selectedNode ifNil: [ ^ self error: 'No variable selected' ].
	selectedNode isVariable ifFalse: [ ^ self error: 'Only works for variables' ].
	
	name := selectedNode variable name.
	object := selectedContext readVariableNamed: name.
	
	name := UIManager default request: 'Object name' initialAnswer: name.
	name ifNil: [ ^ self ].
	
	^ self scopeModel 
		putObject: (
			ScpObjectWrapper 
				fromId: (self tracer getOidOf: object) 
				object: object
		)
		named: name.
]

{ #category : #private }
ScpAddToScopeCmd >> scopeModel [

	^ self scopeoPresenter scopeModel
]

{ #category : #private }
ScpAddToScopeCmd >> scopeoPresenter [

	context extensionTools 
		detect: [ :e | e class = ScopeoPresenter ]
		ifFound: [ :e | ^ e ]

]

{ #category : #private }
ScpAddToScopeCmd >> steppingModel [

	^ self scopeoPresenter steppingModel
]

{ #category : #accessing }
ScpAddToScopeCmd >> tracer [

	^ self steppingModel tracer
]
