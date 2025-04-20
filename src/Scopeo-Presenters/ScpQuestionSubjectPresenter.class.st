Class {
	#name : 'ScpQuestionSubjectPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'model',
		'onSelectedBlock'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'testing' }
ScpQuestionSubjectPresenter class >> isAbstract [

	^ self == ScpQuestionSubjectPresenter
]

{ #category : 'initialization' }
ScpQuestionSubjectPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Scopeo questions subject presenter';
		initialExtent: 500 @ 500
]

{ #category : 'enumerating' }
ScpQuestionSubjectPresenter >> whenSelectedDo: aBlock [

	onSelectedBlock := aBlock
]
