Trait {
	#name : #ScpSpecPresenterServices,
	#instVars : [
		'spPresenter'
	],
	#category : #'Scopeo-Presenter-Traits'
}

{ #category : #services }
ScpSpecPresenterServices >> openInWorld [

	^ self spPresenter asWindow
		  title: self title;
		  open
]

{ #category : #services }
ScpSpecPresenterServices >> spPresenter [

	^ spPresenter
]

{ #category : #services }
ScpSpecPresenterServices >> title [

	self explicitRequirement
]
