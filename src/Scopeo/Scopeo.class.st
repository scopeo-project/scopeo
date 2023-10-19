Class {
	#name : #Scopeo,
	#superclass : #Object,
	#category : #Scopeo
}

{ #category : #accessing }
Scopeo class >> open [

	| model presentationModel |
	
	
	model := ScpModel new.
	presentationModel := ScpPresentationModel new model: model; yourself.
	(ScopeoPresenter on: presentationModel) open.
]
