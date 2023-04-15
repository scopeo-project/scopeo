Class {
	#name : #Selector,
	#superclass : #Predicate,
	#instVars : [
		'selectors'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'instance creation' }
Selector class >> is: aSymbol [

	^ self new 
		selector: aSymbol;
		yourself
]

{ #category : #'instance creation' }
Selector class >> selector: aSelector [

	^ self new 
		selector: aSelector;
		yourself
]

{ #category : #accessing }
Selector >> selector: aSelector [

	selectors := { aSelector }
]

{ #category : #accessing }
Selector >> selectors: aSelectorArray [

	selectors := aSelectorArray
]

{ #category : #'target resize' }
Selector >> verify: aEvent in: aEvents [	
	^ aEvent isInteraction and: [ selectors includes: aEvent selector ]
]
