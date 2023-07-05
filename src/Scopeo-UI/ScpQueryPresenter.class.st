Class {
	#name : #ScpQueryPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'predicate',
		'history',
		'editor',
		'list',
		'visualization'
	],
	#category : #'Scopeo-UI-Presenters'
}

{ #category : #execution }
ScpQueryPresenter >> execute [
]

{ #category : #initialization }
ScpQueryPresenter >> initializePresenters [

	editor := self newCode.
	editor syntaxHighlight: true.

	list := self newButton
		        label: 'Open results';
		        action: [ self execute. self openResults ]; yourself.
	visualization := self newButton
		        label: 'Open visualization';
		        action: [ self execute. self openVisualization ]; yourself.
]

{ #category : #execution }
ScpQueryPresenter >> openResults [
]

{ #category : #execution }
ScpQueryPresenter >> openVisualization [
]
