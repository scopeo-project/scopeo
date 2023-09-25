Trait {
	#name : #ScpDataBuffer,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-DataBuffer'
}

{ #category : #'accessing - events' }
ScpDataBuffer classSide >> consumedComponentEvents [

	<componentContract>
	^ { ScpScannerDataEvents }
]

{ #category : #'accessing - events' }
ScpDataBuffer classSide >> producedComponentEvents [

	<componentContract>
	^ { ScpDataBufferEvents }
]

{ #category : #'accessing - parameters' }
ScpDataBuffer classSide >> providedComponentParameters [

	<componentContract>
	^ { ScpDataBufferParameters }
]
