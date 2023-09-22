Trait {
	#name : #ScpScanner,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-Scanner-Molecule'
}

{ #category : #'accessing - events' }
ScpScanner classSide >> producedComponentEvents [
	<componentContract>
	^ { ScpScannerDataEvents } 
]

{ #category : #'accessing - parameters' }
ScpScanner classSide >> providedComponentParameters [
	<componentContract>
	^ { ScpScannerParameters } 
]

{ #category : #'accessing - services' }
ScpScanner classSide >> providedComponentServices [
	<componentContract>
	^ { ScpScannerServices }
]
