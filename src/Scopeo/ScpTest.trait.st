Trait {
	#name : #ScpTest,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #Scopeo
}

{ #category : #'accessing - services' }
ScpTest classSide >> usedComponentServices [
	<componentContract>
	^ {ScpResultsPresenterServices}
]
