Class {
	#name : #SelectObject,
	#superclass : #ObjectGraphCommand,
	#category : #'Scopeo-StDebugger-Extension-UI'
}

{ #category : #'accessing - defaults' }
SelectObject class >> defaultDescription [

	^ 'Selects an object from the execution context'
]

{ #category : #'accessing - defaults' }
SelectObject class >> defaultName [

	<toolbarExtensionDebugCommand: 50>
	<codeExtensionDebugCommand:1>
	^ 'Select object to analyse'
]

{ #category : #executing }
SelectObject >> execute [

	self ogPresenter selectObject: self getSelectedObject.
]
