Class {
	#name : #ObjectGraphCommand,
	#superclass : #CmCommand,
	#category : #'Scopeo-StDebugger-Extension-UI'
}

{ #category : #testing }
ObjectGraphCommand class >> isAbstract [
		
	^ self == ObjectGraphCommand
]

{ #category : #executing }
ObjectGraphCommand >> getSelectedObject [

	| selectedNode selectedContext |

	selectedContext := self skPresenter tracer selectedContext.
	selectedNode := self skPresenter tracer selectedNode.

	selectedNode ifNil: [ ^ self error: 'No variable selected' ].
	selectedNode isVariable ifFalse: [ ^ self error: 'Only works for variables' ].

	^ selectedContext readVariableNamed: selectedNode variable name
]

{ #category : #accessing }
ObjectGraphCommand >> ogPresenter [

	context extensionTools
		detect: [ :e | e class = ObjectGraphPresenter ]
		ifFound: [ :e | ^ e ]
		ifNone: [ ^ nil ]
]

{ #category : #accessing }
ObjectGraphCommand >> skPresenter [

	context extensionTools
		detect: [ :e | e class = SeekerDebuggerPresenter ]
		ifFound: [ :e | ^ e ]
		ifNone: [ ^ nil ]
]
