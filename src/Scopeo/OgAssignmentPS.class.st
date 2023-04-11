Class {
	#name : #OgAssignmentPS,
	#superclass : #OgProgramState,
	#instVars : [
		'object',
		'method',
		'variable',
		'oldValue',
		'newValue',
		'objectOid'
	],
	#category : #'Scopeo-Model-ProgramState'
}

{ #category : #'instance creation' }
OgAssignmentPS class >> fromSeekerPS: aProgramState [

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
OgAssignmentPS >> isAssignment [

	^ true
]

{ #category : #accessing }
OgAssignmentPS >> method [

	^ method
]

{ #category : #accessing }
OgAssignmentPS >> method: anObject [

	method := anObject
]

{ #category : #accessing }
OgAssignmentPS >> newValue [
	
	^ newValue
]

{ #category : #accessing }
OgAssignmentPS >> newValue: aNewValue [

	newValue := aNewValue
]

{ #category : #accessing }
OgAssignmentPS >> object [

	^ object
]

{ #category : #accessing }
OgAssignmentPS >> object: anObject [

	object := anObject
]

{ #category : #accessing }
OgAssignmentPS >> objectOid [

	^ objectOid
]

{ #category : #accessing }
OgAssignmentPS >> objectOid: aObjectOid [

	objectOid := aObjectOid
]

{ #category : #accessing }
OgAssignmentPS >> oldValue [

	^ oldValue
]

{ #category : #accessing }
OgAssignmentPS >> oldValue: anOldValue [

	oldValue := anOldValue
]

{ #category : #accessing }
OgAssignmentPS >> variable [

	^ variable
]

{ #category : #accessing }
OgAssignmentPS >> variable: aVariable [

	variable := aVariable
]
