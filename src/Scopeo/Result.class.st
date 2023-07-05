Class {
	#name : #Result,
	#superclass : #ScpPredicate,
	#instVars : [
		'counter',
		'numbers'
	],
	#category : #'Scopeo-Predicates'
}

{ #category : #api }
Result class >> number: aNumbers [

	^ self new numbers: aNumbers;
	yourself
]

{ #category : #accessing }
Result >> initialize [
	
	counter := 0.
]

{ #category : #accessing }
Result >> numbers: aNumbers [

	numbers := aNumbers
]

{ #category : #'target resize' }
Result >> verify: aEvent scope: aScope events: aProgamEvents [
	
	counter := counter + 1.
	^ numbers includes: counter
]
