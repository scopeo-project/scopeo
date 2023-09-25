Trait {
	#name : #ScpDataLogger,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-DataLogger'
}

{ #category : #'accessing - events' }
ScpDataLogger classSide >> consumedComponentEvents [

	<componentContract>
	^ { ScpDataBufferEvents }
]
