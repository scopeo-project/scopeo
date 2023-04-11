Class {
	#name : #ObjectGraphVisitor,
	#superclass : #Object,
	#category : #'Scopeo-Graph'
}

{ #category : #testing }
ObjectGraphVisitor class >> isAbstract [
		
	^ self == ObjectGraphVisitor
]

{ #category : #visiting }
ObjectGraphVisitor >> visitEdge: aEdge [

	self notYetImplemented
]

{ #category : #visiting }
ObjectGraphVisitor >> visitGraph: aGraph [

	self notYetImplemented
]

{ #category : #visiting }
ObjectGraphVisitor >> visitVertex: aVertex [

	self notYetImplemented
]
