Trait {
	#name : #ScpSpecPresenterServices,
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

	self explicitRequirement
]

{ #category : #accessing }
ScpSpecPresenterServices >> title [

	self explicitRequirement
]
