Class {
	#name : #ScpData,
	#superclass : #Object,
	#instVars : [
		'scanner',
		'filter',
		'storage'
	],
	#category : #'Scopeo-Data'
}

{ #category : #services }
ScpData >> fetch: aPredicate [

	^ storage fetch: aPredicate
]

{ #category : #initialization }
ScpData >> initialize [

	scanner := ScpDataScanner new.
	filter := ScpDataFilter new.
	storage := ScpDataStorage new.
	
	filter observe: scanner.
	storage observe: filter.
]

{ #category : #parameters }
ScpData >> rejectClasses: aClasses [

	^ filter rejectClasses: aClasses
]

{ #category : #services }
ScpData >> scan: aProgram [

	storage clear.
	^ scanner scan: aProgram
]
