Class {
	#name : #ScpObjectsGroupShape,
	#superclass : #ScpInteractionsGraphShape,
	#category : #'Scopeo-InteractionsVisualization'
}

{ #category : #private }
ScpObjectsGroupShape >> shape [

	^ RSComposite new
			draggable;
			border: (RSBorder new color: Color transparent); 
			yourself
]
