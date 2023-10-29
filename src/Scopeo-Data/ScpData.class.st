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

{ #category : #'as yet unclassified' }
ScpData class >> defaultRejectedClasses [

	^ {  }
]

{ #category : #'as yet unclassified' }
ScpData class >> defaultRejectedPackages [

	^ { 'Kernel'. 'Collections-Sequenceable-Tests'.
	  'Collections-Atomic-Tests'. 'Collections-Unordered-Tests'.
	  'Collections-Stack'. 'Collections-Native'. 'Collections-Weak-Tests'.
	  'Collections-Arithmetic'. 'Collections-Unordered'.
	  'Collections-Atomic'. 'Collections-Tests'. 'Collections-Streams-Tests'.
	  'Collections-Strings-Tests'. 'Collections-Abstract-Traits'.
	  'Collections-Support'. 'Collections-Sequenceable'.
	  'Collections-Abstract-Tests'. 'Collections-Strings'.
	  'Collections-Arithmetic-Tests'. 'Collections-Stack-Tests'.
	  'Collections-DoubleLinkedList-Tests'.
	  'Collections-Native-Tests'. 'Collections-Abstract'.
	  'Collections-Weak'. 'Collections-Streams'. 'Collections-Support-Tests'.
	  'Collections-DoubleLinkedList'. 'Transcript-Core' }
]

{ #category : #private }
ScpData >> addMessage: aMessage [

	storage addMessage: aMessage
]

{ #category : #private }
ScpData >> addStateUpdate: aStateUpdate [

	storage addStateUpdate: aStateUpdate 
]

{ #category : #services }
ScpData >> fetch: aPredicate [

	^ storage fetch: aPredicate
]

{ #category : #initialization }
ScpData >> initialize [

	scanner := ScpDataScanner new
		           data: self;
		           yourself.
	storage := ScpDataStorage new.

	self rejectPackages: self class defaultRejectedPackages.
	self rejectClasses: self class defaultRejectedClasses
]

{ #category : #parameters }
ScpData >> rejectClasses: aClassNameCollection [

	scanner rejectClasses: aClassNameCollection

	 
]

{ #category : #parameters }
ScpData >> rejectPackages: aPackageNameCollection [

	scanner rejectPackages: aPackageNameCollection

	 
]

{ #category : #services }
ScpData >> scan: aProgram [

	storage clear.
	^ scanner scan: aProgram
]
