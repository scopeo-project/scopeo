Class {
	#name : #Scopeo,
	#superclass : #Object,
	#instVars : [
		'model',
		'presentationModel',
		'presenter'
	],
	#category : #Scopeo
}

{ #category : #accessing }
Scopeo class >> openOn: aProgram [

	^ self new
		  scan: aProgram;
		  open;
		  yourself
]

{ #category : #'instance creation' }
Scopeo >> close [

	presenter window close
]

{ #category : #initialization }
Scopeo >> initialize [

	model := ScpModel new.
	presentationModel := ScpOldPresentationModel on: model.
	presenter := ScopeoPresenter on: presentationModel
]

{ #category : #'instance creation' }
Scopeo >> open [

	presenter open
]

{ #category : #'public api' }
Scopeo >> scan: aProgram [
	
	^ model scan: aProgram
]
