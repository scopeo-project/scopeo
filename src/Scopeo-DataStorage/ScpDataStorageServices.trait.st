Trait {
	#name : #ScpDataStorageServices,
	#traits : 'MolComponentServices',
	#classTraits : 'MolComponentServices classTrait',
	#category : #'Scopeo-DataStorage'
}

{ #category : #accessing }
ScpDataStorageServices >> events [
	"Returns the stored events."

	self explicitRequirement
]
