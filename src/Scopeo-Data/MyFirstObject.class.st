Class {
	#name : 'MyFirstObject',
	#superclass : 'Object',
	#category : 'Scopeo-Data',
	#package : 'Scopeo-Data'
}

{ #category : 'as yet unclassified' }
MyFirstObject >> try [

	 'test' crTrace
]

{ #category : 'as yet unclassified' }
MyFirstObject >> try: arg [

	'test' crTrace.
	arg crTrace.
	OrderedCollection new.
]
