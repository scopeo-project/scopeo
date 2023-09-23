Trait {
	#name : #ScpDataStorage,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-DataStorage'
}

{ #category : #'accessing - events' }
ScpDataStorage classSide >> consumedComponentEvents [
	<componentContract>
	^ {ScpScannerDataEvents}
]
