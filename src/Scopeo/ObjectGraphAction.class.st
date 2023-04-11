Class {
	#name : #ObjectGraphAction,
	#superclass : #Object,
	#instVars : [
		'bytecodeIndex',
		'pc'
	],
	#category : #'Scopeo-Graph'
}

{ #category : #testing }
ObjectGraphAction class >> isAbstract [
		
	^ self == ObjectGraphAction
]

{ #category : #accessing }
ObjectGraphAction >> bytecodeIndex [

	^ bytecodeIndex
]

{ #category : #accessing }
ObjectGraphAction >> bytecodeIndex: aBytecodeIndex [

	bytecodeIndex := aBytecodeIndex
]

{ #category : #testing }
ObjectGraphAction >> isAssignment [

	^ false
]

{ #category : #testing }
ObjectGraphAction >> isMessage [

	^ false
]

{ #category : #accessing }
ObjectGraphAction >> pc [

	^ pc
]

{ #category : #accessing }
ObjectGraphAction >> pc: aProgramCounter [

	pc := aProgramCounter
]
