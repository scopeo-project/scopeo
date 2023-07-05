Class {
	#name : #ScpScopeUpdated,
	#superclass : #Announcement,
	#instVars : [
		'associations'
	],
	#category : #'Scopeo-Logic'
}

{ #category : #accessing }
ScpScopeUpdated >> associations [

	^ associations
]

{ #category : #accessing }
ScpScopeUpdated >> associations: anAssociations [

	associations := anAssociations 
]
