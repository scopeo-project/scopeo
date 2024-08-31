Extension { #name : 'Object' }

{ #category : '*Scopeo-Model' }
Object >> messagesReceived [

	^ ScpExecution messagesReceivedBy: self
]

{ #category : '*Scopeo-Model' }
Object >> messagesSent [

	^ ScpExecution messagesSentBy: self

	
]
