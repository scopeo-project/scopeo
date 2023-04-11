Class {
	#name : #ObjectGraphVertexGroupShape,
	#superclass : #ObjectGraphShape,
	#category : #'Scopeo-Graph-Visualization'
}

{ #category : #private }
ObjectGraphVertexGroupShape >> shape [

	^ RSComposite new
			draggable;
			border: (RSBorder new color: Color gray); 
			yourself
]
