Trait {
	#name : #ScpBlocPresenterServices,
	#instVars : [
		'blPresenter'
	],
	#traits : 'ScpSpecPresenterServices',
	#classTraits : 'ScpSpecPresenterServices classTrait',
	#category : #'Scopeo-Presenter-Traits'
}

{ #category : #services }
ScpBlocPresenterServices >> blPresenter [

	^ blPresenter
]

{ #category : #services }
ScpBlocPresenterServices >> openInSpace [

	^ self blPresenter openInSpace title: self title
]

{ #category : #services }
ScpBlocPresenterServices >> spPresenter [

	spPresenter ifNil: [ 
		spPresenter := SpBlSpaceInMorphPresenter new.
		spPresenter space addChild: self blPresenter.
		spPresenter space root background: Color paleBlue.
		spPresenter space root layout: BlFlowLayout horizontal.
	].

	^  spPresenter

]
