Trait {
	#name : #ScpSpecPresenterServices,
	#instVars : [
		'spPresenter'
	],
	#category : #'Scopeo-Presenter-Traits'
}

{ #category : #accessing }
ScpSpecPresenterServices >> openInWorld [

	^ self spPresenter asWindow
		  title: self title;
		  open
]

{ #category : #accessing }
ScpSpecPresenterServices >> spPresenter [

	^ spPresenter
]

{ #category : #accessing }
ScpSpecPresenterServices >> title [

	self explicitRequirement
]
