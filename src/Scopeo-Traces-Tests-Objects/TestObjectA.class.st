Class {
	#name : 'TestObjectA',
	#superclass : 'Object',
	#category : 'Scopeo-Traces-Tests-Objects',
	#package : 'Scopeo-Traces-Tests-Objects'
}

{ #category : 'as yet unclassified' }
TestObjectA >> myMethod [

	^ 10
]

{ #category : 'as yet unclassified' }
TestObjectA >> truc [

	^ self myMethod
]
