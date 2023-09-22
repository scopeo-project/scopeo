Trait {
	#name : #ScpScannerParameters,
	#traits : 'MolComponentParameters',
	#classTraits : 'MolComponentParameters classTrait',
	#category : #'Scopeo-Scanner-Molecule'
}

{ #category : #'as yet unclassified' }
ScpScannerParameters >> ignoredPackages: aCollection [

	self explicitRequirement
]
