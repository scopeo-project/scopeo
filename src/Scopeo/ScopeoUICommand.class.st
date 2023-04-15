Class {
	#name : #ScopeoUICommand,
	#superclass : #CmCommand,
	#category : #'Scopeo-GUI'
}

{ #category : #testing }
ScopeoUICommand class >> isAbstract [
		
	^ self == ScopeoUICommand
]

{ #category : #executing }
ScopeoUICommand >> getSelectedObject [

	| selectedNode selectedContext |

	selectedContext := self skPresenter tracer selectedContext.
	selectedNode := self skPresenter tracer selectedNode.

	selectedNode ifNil: [ ^ self error: 'No variable selected' ].
	selectedNode isVariable ifFalse: [ ^ self error: 'Only works for variables' ].

	^ selectedContext readVariableNamed: selectedNode variable name
]

{ #category : #accessing }
ScopeoUICommand >> ogPresenter [

	context extensionTools
		detect: [ :e | e class = ScopeoPresenter ]
		ifFound: [ :e | ^ e ]
		ifNone: [ ^ nil ]
]

{ #category : #accessing }
ScopeoUICommand >> skPresenter [

	context extensionTools
		detect: [ :e | e class = SeekerDebuggerPresenter ]
		ifFound: [ :e | ^ e ]
		ifNone: [ ^ nil ]
]
