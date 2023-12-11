Class {
	#name : 'ScpExampleObjectB',
	#superclass : 'Object',
	#instVars : [
		'#exampleInstanceVariable',
		'#exampleInstanceObservable => ObservableSlot'
	],
	#category : 'Scopeo-Traces-Tests-Objects',
	#package : 'Scopeo-Traces-Tests-Objects'
}

{ #category : 'examples' }
ScpExampleObjectB >> exampleAccessor [

	^ exampleInstanceVariable
]

{ #category : 'examples' }
ScpExampleObjectB >> exampleSetter: aValue [

	exampleInstanceVariable := aValue
]

{ #category : 'examples' }
ScpExampleObjectB >> exampleSetterObservableSlot: aValue [

	exampleInstanceObservable := aValue
]

{ #category : 'initialization' }
ScpExampleObjectB >> initialize [

	self class initializeSlots: self.
	super initialize.
]
