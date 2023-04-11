Class {
	#name : #SelectValue,
	#superclass : #ObjectGraphCommand,
	#category : #'Scopeo-StDebugger-Extension-UI'
}

{ #category : #'accessing - defaults' }
SelectValue class >> defaultDescription [

	^ 'Selects a value to track among the selected object interactions'
]

{ #category : #'accessing - defaults' }
SelectValue class >> defaultName [

	<toolbarExtensionDebugCommand: 50>
	<codeExtensionDebugCommand:1>
	^ 'Select a value to track'
]

{ #category : #execution }
SelectValue >> execute [

	self ogPresenter selectValue: self getSelectedObject.
]
