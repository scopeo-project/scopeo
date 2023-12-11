Class {
	#name : 'ScpExampleObjectB',
	#superclass : 'ScpExampleObject',
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
ScpExampleObjectB >> exampleSelfCall [

	^ self exampleSetter: 'exampleSelf'
]

{ #category : 'examples' }
ScpExampleObjectB >> exampleSetter: aValue [

	exampleInstanceVariable := aValue
]

{ #category : 'examples' }
ScpExampleObjectB >> exampleSetterObservableSlot: aValue [

	exampleInstanceObservable := aValue
]

{ #category : 'examples' }
ScpExampleObjectB >> exampleSuperCall: aValue [

	^ super exampleSuperCall: aValue
]

{ #category : 'initialization' }
ScpExampleObjectB >> initialize [

	self class initializeSlots: self.
	super initialize.
]
