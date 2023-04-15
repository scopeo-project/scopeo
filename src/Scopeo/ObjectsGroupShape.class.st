Class {
	#name : #ObjectsGroupShape,
	#superclass : #ObjectGraphShape,
	#category : #'Scopeo-Visualizations'
}

{ #category : #private }
ObjectsGroupShape >> shape [

	^ RSComposite new
			draggable;
			border: (RSBorder new color: Color gray); 
			yourself
]
