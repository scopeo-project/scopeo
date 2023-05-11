Class {
	#name : #ObjectsGroupShape,
	#superclass : #ObjectGraphShape,
	#category : #'Scopeo-InteractionsVisualization'
}

{ #category : #private }
ObjectsGroupShape >> shape [

	^ RSComposite new
			draggable;
			border: (RSBorder new color: Color transparent); 
			yourself
]
