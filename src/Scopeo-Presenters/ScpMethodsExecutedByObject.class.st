Class {
	#name : 'ScpMethodsExecutedByObject',
	#superclass : 'ScpObjectCentricQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpMethodsExecutedByObject class >> label [

	^ 'All methods executed by <an Object>, in <scope>'
]

{ #category : 'as yet unclassified' }
ScpMethodsExecutedByObject >> isMethodMatching: aScpMethodTrace [

	| matching |

	matching := false.

	(aScpMethodTrace receiver == subject) ifTrue: [ 
		self add: aScpMethodTrace receiver reference: aScpMethodTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpMethodsExecutedByObject >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpMethodsExecutedByObject >> label [
	
	^ 'All methods executed by "', subject asString , '-' , subject hash asString , '", in scope: ', scope label
]
