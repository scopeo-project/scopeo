Class {
	#name : 'ScpQuestion',
	#superclass : 'Object',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'testing' }
ScpQuestion class >> isAbstract [

	^ self == ScpQuestion
]

{ #category : 'accessing' }
ScpQuestion class >> label [

 	self subclassResponsibility
]

{ #category : 'accessing' }
ScpQuestion >> answer [

	self subclassResponsibility
]

{ #category : 'accessing' }
ScpQuestion >> label [
	^ self class label
]
