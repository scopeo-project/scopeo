Trait {
	#name : #ScpScanner,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-Scanner'
}

{ #category : #'accessing - events' }
ScpScanner classSide >> producedComponentEvents [
	<componentContract>
	^ { ScpScannerDataEvents } 
]

{ #category : #'accessing - services' }
ScpScanner classSide >> providedComponentServices [
	<componentContract>
	^ { ScpScannerServices }
]
