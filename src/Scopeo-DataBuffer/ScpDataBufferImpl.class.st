Class {
	#name : #ScpDataBufferImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScpDataBuffer + ScpDataBufferParameters + ScpScannerDataEvents',
	#classTraits : 'ScpDataBuffer classTrait + ScpDataBufferParameters classTrait + ScpScannerDataEvents classTrait',
	#instVars : [
		'ignoredClasses'
	],
	#category : #'Scopeo-DataBuffer'
}

{ #category : #default }
ScpDataBufferImpl class >> defaultIgnoredClasses [

	| ignored |
	
	ignored := OrderedCollection new.
	ignored addAll: self defaultIgnoredCollections.
	ignored addAll: self defaultIgnoredKernel.		

	^ ignored 
]

{ #category : #default }
ScpDataBufferImpl class >> defaultIgnoredCollections [


	^ #( 'ManifestCollectionsArithmetic'
'SequenceableCollection'
'Collection'
'Float32Array'
'WordArray'
'Array'
'DoubleLinkedList'
'ManifestCollectionsDoubleLinkedList'
'DoubleLink'
'Generator'
'PositionableStream'
'ReadStream'
'WriteStream'
'NullStream'
'Stream'
'ReadWriteStream'
'ManifestCollectionsStreams'
'LimitedWriteStream'
'DecoratorStream'
'WeakKeyAssociation'
'WeakArray'
'ManifestCollectionsWeak'
'WeakIdentityValueDictionary'
'WeakOrderedCollection'
'WeakKeyDictionary'
'WeakValueDictionary'
'WeakSet'
'WeakIdentityKeyDictionary'
'WeakIdentitySet'
'WeakRegistry'
'ManifestCollectionsAbstractTraits'
'TSortable'
'Symbol'
'ByteString'
'ByteSymbol'
'ManifestCollectionsStrings'
'String'
'WideSymbol'
'WideString'
'Array2D'
'Number'
'SparseLargeTable'
'LinkedList'
'OrderedDictionary'
'Heap'
'SortedCollection'
'SharedQueue'
'Array'
'OrderedIdentityDictionary'
'OrderedCollection'
'SparseLargeArray'
'ManifestCollectionsSequenceable'
'Interval'
'ManifestCollectionsAtomic'
'AtomicQueueItem'
'WaitfreeQueue'
'AtomicSharedQueue'
'AtomicCollection'
'LIFOQueue'
'Association'
'CharacterSetComplement'
'ValueLink'
'ManifestCollectionsSupport'
'WeakValueAssociation'
'CollectionElement'
'Link'
'LookupKey'
'WideCharacterSet'
'CharacterSet'
'ArrayedCollection'
'CollectionIsEmpty'
'SizeMismatch'
'ManifestCollectionsAbstract'
'Character'
'SequenceableCollection'
'HashedCollection'
'CompiledMethod class'
'Collection'
'Object'
'NotFound'
'Behavior class'
'BlockClosure'
'Float64Array'
'ManifestCollectionsNative'
'DoubleWordArray'
'DoubleByteArray'
'ByteArray'
'Float32Array'
'WordArray'
'IntegerArray'
'Stack'
'ManifestCollectionsStack'
'KeyedTree'
'IdentityBag'
'PluggableDictionary'
'IdentitySet'
'Bag'
'KeyNotFound'
'SmallIdentityDictionary'
'Set'
'HashTableSizes'
'IdentityDictionary'
'Dictionary'
'PluggableSet'
'ValueNotFound'
'ManifestCollectionsUnordered'
'SmallDictionary' )
]

{ #category : #default }
ScpDataBufferImpl class >> defaultIgnoredKernel [

	^ #( 'ManifestKernelTraits' 'Trait' 'TComparable' 'TEmpty' 'Duration'
	     'Date' 'ExtendedDatePrinter' 'Time' 'DosTimestamp'
	     'Stopwatch' 'Integer' 'DateAndTime' 'BenchmarkResult'
	     'BlockClosure' 'DateParser' 'Year' 'Date' 'Time' 'DateAndTime'
	     'Week' 'Schedule' 'Month' 'ManifestKernelChronologyExtras'
	     'Timespan' 'PharoBootstrapAnalyzerStubWithNoNewDependency'
	     'PharoBootstrapAnalyzerStubWithNewDependency'
	     'NonBooleanReceiver' 'DelayWaitTimeout' 'FullBlockClosure'
	     'CannotReturn' 'Categorizer' 'Object' 'Timespan' 'AbstractLayout'
	     'DelayMillisecondTickerSimulation'
	     'AsciiCharset' 'ClassDescription' 'ShouldNotImplement'
	     'Mutex' 'DelayMicrosecondTickerSimulation'
	     'CurrentExecutionEnvironment' 'ProtoObject' 'FloatPrintPolicy'
	     'ModificationForbidden' 'DelayBasicScheduler'
	     'Error' 'SuperVariable' 'ClassOrganization' 'InstanceVariableNotFound'
	     'Character' 'DefaultExecutionEnvironment'
	     'Metaclass' 'SelfVariable' 'LargeInteger' 'ClassDefinitionPrinter'
	     'IndexedSlot' 'ExceptionSetWithExclusions'
	     'ImmediateLayout' 'ReservedVariable' 'ProcessLocalVariable'
	     'RecursionStopper' 'DelayNullScheduler' 'WorkspaceVariable'
	     'DuplicatedVariableError' 'ExecutionEnvironment'
	     'UndefinedObject' 'SmallFloat64' 'SubclassResponsibility'
	     'Slot' 'ConstantBlockClosure1Arg' 'Magnitude' 'LargePositiveInteger'
	     'Abort' 'IllegalResumeAttempt' 'DoubleByteLayout'
	     'Behavior' 'DoItVariable' 'ProcessSpecificVariable'
	     'InstructionClient' 'ManifestKernel' 'False' 'ProtocolOrganizer'
	     'NotYetImplemented' 'DateAndTime' 'Protocol' 'Message' 'DelaySemaphoreScheduler'
	     'Exception' 'AbstractProtocol' 'MessageSend' 'MethodDictionary'
	     'ThisContextVariable' 'NewUndeclaredWarning'
	     'DelayMillisecondTicker' 'AbstractDelayTicker'
	     'ShouldBeImplemented' 'Fraction' 'MonitorDelay' 'DelayMicrosecondTicker'
	     'Heap' 'Continuation' 'ByteLayout' 'WeakMessageSend'
	     'Delay' 'True' 'DynamicVariable' 'Notification' 'SelectorException'
	     'Deprecation' 'CompiledBlock' 'InexactFloatPrintPolicy'
	     'Float' 'DeepCopier' 'Time' 'ScaledDecimal' 'BlockClosure'
	     'AssertionFailure' 'ProcessList' 'ExceptionSet' 'LocalTimeZone'
	     'AllProtocol' 'Margin' 'BytecodeMappedInlinePrimitiveConfiguration'
	     'UnhandledError' 'EmptyLayout' 'AdditionalMethodState'
	     'Rectangle' 'ArgumentsCountMismatch' 'Semaphore' 'Warning'
	     'AdditionalBinding' 'PackageManifest' 'Number' 'ConstantBlockClosure3Arg'
	     'SmallInteger' 'ChronologyConstants' 'TimeZone' 'ConstantBlockClosure'
	     'DoubleWordLayout' 'TimeError' 'CompiledMethodLayout'
	     'CompiledMethod' 'BitsLayout' 'FixedLayout' 'BasicDatePrinter'
	     'Integer' 'Pragma' 'UndeclaredVariable' 'LiteralVariable'
	     'ProcessorScheduler' 'Duration' 'CompiledCode' 'CleanBlockClosure'
	     'AbstractTimeZone' 'DependentsArray' 'AbstractLayoutScope'
	     'DelayMutexScheduler' 'LargeNegativeInteger'
	     'ObjectLayout' 'MessageNotUnderstood' 'GlobalVariable'
	     'SimulationExceptionWrapper' 'MutexSet' 'DelayMicrosecondUncappedTicker'
	     'LayoutEmptyScope' 'FluidClassDefinitionPrinter'
	     'ArithmeticError' 'Monitor' 'Variable' 'DeprecationPerformedNotification'
	     'ContextCannotReturn' 'WordLayout' 'SharedPool' 'WeakLayout'
	     'Boolean' 'OutOfMemory' 'TimedOut' 'DateError' 'BoxedFloat64'
	     'UnwindError' 'OldPharoClassDefinitionPrinter'
	     'RuntimeSyntaxError' 'ProcessAlreadyTerminating'
	     'ExactFloatPrintPolicy' 'LayoutClassScope' 'LocalRecursionStopper'
	     'EphemeronLayout' 'VariableLayout' 'UndefinedSlot'
	     'Point' 'SystemNotification' 'ZeroDivide' 'Halt' 'ConstantBlockClosure2Arg'
	     'SubscriptOutOfBounds' 'Context' 'CompiledMethodTrailer'
	     'Process' 'BlockCannotReturn' 'ClassVariable' 'Date' 'InstanceVariableSlot'
	     'VariableNotDeclared' 'DomainError' 'PrimitiveFailed'
	     'PointerLayout' 'Class' 'InstructionStream' 'LegacyClassDefinitionPrinter'
	     'UnhandledException' 'ClassHierarchyPrinter'
	     'ArchitecturalCritique' 'SendsDeprecatedMethodToGlobalRule'
	     'PharoBootstrapRule' 'FloatReferencesRule' 'OverridesDeprecatedMethodRule'
	     'UnicodeTestRNG' 'ManifestKernelTestsExtended'
	     'BlockClosuresTestCase' 'WriteBarrierAnotherStub'
	     'ReferencedClassesTestClass' 'WriteBarrierStub'
	     'EncoderForSistaV1' 'BytecodeEncoder' )
]

{ #category : #'life cycle' }
ScpDataBufferImpl >> componentActivate [

	self getScpScannerDataEventsSubscriber subscribe: self
]

{ #category : #'life cycle' }
ScpDataBufferImpl >> componentPassivate [

	self getScpScannerDataEventsSubscriber unsubscribe: self
]

{ #category : #'component accessing' }
ScpDataBufferImpl >> getScpDataBufferEventsNotifier [
	^self eventsNotifiers at: ScpDataBufferEvents ifAbsent: [^MolNotFoundEventsNotifier new interface: ScpDataBufferEvents name: nil].
]

{ #category : #'component accessing' }
ScpDataBufferImpl >> getScpScannerDataEventsSubscriber [
	| eventsSymbol eventsSubscriber itf |
	itf := ScpScannerDataEvents.
	eventsSymbol := self eventsSubscribers at: itf ifAbsent: [^MolNotFoundEventsSubscriber new interface: itf name: nil].
	eventsSymbol isCollection
	 	ifTrue: 
			[eventsSubscriber := MolComponentManager default locatorServices 
						searchEventsSubscriberFor: ScpScannerDataEvents named: eventsSymbol ]. 
	^eventsSubscriber
]

{ #category : #parameters }
ScpDataBufferImpl >> ignoreClasses: aCollection [
	"Classes which will be filtered by the buffer"
	
	ignoredClasses := aCollection

	
]

{ #category : #initialization }
ScpDataBufferImpl >> initialize [

	ignoredClasses := OrderedCollection new.
	ignoredClasses addAll: self class defaultIgnoredClasses
]

{ #category : #events }
ScpDataBufferImpl >> instanceVariableAssigned: anScpScannedAssigment [
	"A new value has been assigned to an object instance variable."

	(self mustIgnore: anScpScannedAssigment object) ifTrue: [ ^ nil ].
	self getScpDataBufferEventsNotifier instanceVariableAssigned: anScpScannedAssigment
]

{ #category : #events }
ScpDataBufferImpl >> messageSent: aScpScannedMessage [
	"A message has been sent by an object during the execution of the program."

	(self mustIgnore: aScpScannedMessage sender) ifTrue: [ ^ nil ].
	self getScpDataBufferEventsNotifier messageSent: aScpScannedMessage.
]

{ #category : #testing }
ScpDataBufferImpl >> mustIgnore: anObject [

	anObject ifNil: [ ^ true ].
	^ ignoredClasses includes: anObject class name
]
