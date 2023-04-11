Class {
	#name : #AssignmentTrace,
	#superclass : #Trace,
	#instVars : [
		'object',
		'method',
		'variable',
		'oldValue',
		'newValue',
		'objectOid'
	],
	#category : #'Scopeo-Trace'
}

{ #category : #'instance creation' }
AssignmentTrace class >> fromSeekerPS: aProgramState [

	| variable oid |
	variable := aProgramState node variable variable.
	oid := (aProgramState aliasOfObject: aProgramState context receiver).
	
	^ self new
		  pc: aProgramState contextPC;
	     bytecodeIndex: aProgramState bytecodeIndex;
		  objectOid: oid; 
		  object: aProgramState context receiver;
		  method: aProgramState method;
		  variable: variable;
		  oldValue: (variable readInContext: aProgramState context);
		  newValue: aProgramState assignmentNextValue;
		  seekerProgramState: aProgramState copy
]

{ #category : #testing }
AssignmentTrace >> isAssignment [

	^ true
]

{ #category : #accessing }
AssignmentTrace >> method [

	^ method
]

{ #category : #accessing }
AssignmentTrace >> method: anObject [

	method := anObject
]

{ #category : #accessing }
AssignmentTrace >> newValue [
	
	^ newValue
]

{ #category : #accessing }
AssignmentTrace >> newValue: aNewValue [

	newValue := aNewValue
]

{ #category : #accessing }
AssignmentTrace >> object [

	^ object
]

{ #category : #accessing }
AssignmentTrace >> object: anObject [

	object := anObject
]

{ #category : #accessing }
AssignmentTrace >> objectOid [

	^ objectOid
]

{ #category : #accessing }
AssignmentTrace >> objectOid: aObjectOid [

	objectOid := aObjectOid
]

{ #category : #accessing }
AssignmentTrace >> oldValue [

	^ oldValue
]

{ #category : #accessing }
AssignmentTrace >> oldValue: anOldValue [

	oldValue := anOldValue
]

{ #category : #accessing }
AssignmentTrace >> variable [

	^ variable
]

{ #category : #accessing }
AssignmentTrace >> variable: aVariable [

	variable := aVariable
]
