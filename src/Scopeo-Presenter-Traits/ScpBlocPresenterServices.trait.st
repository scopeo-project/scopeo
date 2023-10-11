Trait {
	#name : #ScpBlocPresenterServices,
	#traits : 'ScpSpecPresenterServices',
	#classTraits : 'ScpSpecPresenterServices classTrait',
	#category : #Scopeo
}

{ #category : #accessing }
ScpBlocPresenterServices >> blPresenter [

	^ self explicitRequirement
]

{ #category : #accessing }
ScpBlocPresenterServices >> openInSpace [

	^ self blPresenter openInSpace title: self title
]

{ #category : #accessing }
ScpBlocPresenterServices >> spPresenter [

	| presenter |
	presenter := SpBlSpaceInMorphPresenter new.
	presenter space addChild: self blPresenter.
	^ presenter
]
