Class {
	#name : 'ScpMethodsExecutedByObject',
	#superclass : 'ScpObjectCentricQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpMethodsExecutedByObject class >> label [

	^ 'All messages passing <an Object> in argument, in <scope>'
]

{ #category : 'testing' }
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
	
	^ 'All methods executed by "', subject asString, '", in scope: ', scope label
]
