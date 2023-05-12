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
