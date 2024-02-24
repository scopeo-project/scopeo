Class {
	#name : #ScpTraceSourceBrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'packageTable',
		'classTable',
		'methodTable',
		'allPackagesButton',
		'allClassesButton',
		'allMethodsButton',
		'selectAllPackagesButton',
		'unselectAllPackagesButton',
		'selectAllClassesButton',
		'unselectAllClassesButton',
		'selectAllMethodsButton',
		'unselectAllMethodsButton',
		'packagesFilterInput',
		'classesFilterInput',
		'methodsFilterInput',
		'validateButton',
		'cancelButton'
	],
	#category : #'Scopeo-TraceRecorder-Source-Browser-UI'
}

{ #category : #initialization }
ScpTraceSourceBrowserPresenter >> connectPresenters [

	model announcer
		when: ScpTraceSourceBrowserItemsUpdateEvent
		send: #refresh
		to: self.

	model announcer
		when: ScpTraceSourceBrowserValidateEvent
		do: [ self window close ].

	model announcer
		when: ScpTraceSourceBrowserCancelEvent
		do: [ self window close ].


	packagesFilterInput whenTextChangedDo: [ :t |
		model filter packages: t ].
	classesFilterInput whenTextChangedDo: [ :t | model filter classes: t ].
	methodsFilterInput whenTextChangedDo: [ :t | model filter methods: t ].

	selectAllPackagesButton action: [ model selection selectAllPackages ].
	selectAllClassesButton action: [ model selection selectAllClasses ].
	selectAllMethodsButton action: [ model selection selectAllMethods ].

	unselectAllPackagesButton action: [
		model selection unselectAllPackages ].
	unselectAllClassesButton action: [
		model selection unselectAllClasses ].
	unselectAllMethodsButton action: [
		model selection unselectAllMethods ].

	validateButton action: [ model validate ].
	cancelButton action: [ model cancel ]
]

{ #category : #initialization }
ScpTraceSourceBrowserPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: (SpBoxLayout newVertical
						    spacing: 4;
						    add: packageTable;
						    add: packagesFilterInput expand: false;
						    add: (SpBoxLayout newHorizontal
								     beHomogeneous;
								     spacing: 4;
								     add: selectAllPackagesButton;
								     add: unselectAllPackagesButton;
								     yourself)
						    expand: false;
						    yourself);
				   add: (SpBoxLayout newVertical
						    spacing: 4;
						    add: classTable;
						    add: classesFilterInput expand: false;
						    add: (SpBoxLayout newHorizontal
								     beHomogeneous;
								     spacing: 4;
								     add: selectAllClassesButton;
								     add: unselectAllClassesButton;
								     yourself)
						    expand: false;
						    yourself);
				   add: (SpBoxLayout newVertical
						    spacing: 4;
						    add: methodTable;
						    add: methodsFilterInput expand: false;
						    add: (SpBoxLayout newHorizontal
								     beHomogeneous;
								     spacing: 4;
								     add: selectAllMethodsButton;
								     add: unselectAllMethodsButton;
								     yourself)
						    expand: false;
						    yourself);
				   yourself);
		  add: (SpBoxLayout newHorizontal
				   add: validateButton width: 200;
				   add: cancelButton;
				   hAlignEnd;
				   spacing: 4;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : #initialization }
ScpTraceSourceBrowserPresenter >> initializeButtonsPresenters [

	validateButton := self newButton
		                  icon:
			                  ((self iconNamed: #validate) scaledToSize:
					                   15 @ 15);
		                  label: 'Validate methods selection';
		                  yourself.
	cancelButton := self newButton
		                icon:
			                ((self iconNamed: #cancel) scaledToSize: 15 @ 15);
		                label: 'Cancel';
		                yourself.

	selectAllPackagesButton := self newButton
		                           icon:
			                           ((self iconNamed: #checkAll)
				                            scaledToSize: 20 @ 20);
		                           label: 'Select all packages';
		                           yourself.
	unselectAllPackagesButton := self newButton
		                             icon:
			                             ((self iconNamed: #uncheckAll)
				                              scaledToSize: 20 @ 20);
		                             label: 'Unselect all packages';
		                             yourself.

	selectAllClassesButton := self newButton
		                          icon:
			                          ((self iconNamed: #checkAll)
				                           scaledToSize: 20 @ 20);
		                          label: 'Select all classes';
		                          yourself.
	unselectAllClassesButton := self newButton
		                            icon:
			                            ((self iconNamed: #uncheckAll)
				                             scaledToSize: 20 @ 20);
		                            label: 'Unselect all classes';
		                            yourself.

	selectAllMethodsButton := self newButton
		                          icon:
			                          ((self iconNamed: #checkAll)
				                           scaledToSize: 20 @ 20);
		                          label: 'Select all methods';
		                          yourself.
	unselectAllMethodsButton := self newButton
		                            icon:
			                            ((self iconNamed: #uncheckAll)
				                             scaledToSize: 20 @ 20);
		                            label: 'Unselect all methods';
		                            yourself
]

{ #category : #initialization }
ScpTraceSourceBrowserPresenter >> initializeFilterPresenters [

	packagesFilterInput := self newTextInput 
		placeholder: 'Type a text or a regular expression to filter packages'; 
		yourself.
	classesFilterInput := self newTextInput 
		placeholder: 'Type a text or a regular expression to filter classes'; 
		yourself.
	methodsFilterInput := self newTextInput 
		placeholder: 'Type a text or a regular expression to filter methods';
		yourself
]

{ #category : #initialization }
ScpTraceSourceBrowserPresenter >> initializePresenters [

	self initializeTablePresenters.
	self initializeFilterPresenters.
	self initializeButtonsPresenters.
	
	self refresh.
	
]

{ #category : #initialization }
ScpTraceSourceBrowserPresenter >> initializeTablePresenters [

	packageTable := self newTable
		                addColumn: ((SpCheckBoxTableColumn
				                  title: ' '
				                  evaluated: [ :p | model selection isPackageSelected: p ])
				                 onActivation: [ :p | model selection selectPackage: p ];
				                 onDeactivation: [ :p | model selection unselectPackage: p ];
				                 width: 20;
				                 yourself);
		                addColumn: ((SpImageTableColumn
				                  title: ' '
				                  evaluated: [ :p | self iconNamed: #package ])
				                 width: 20;
				                 yourself);
		                addColumn:
		                (SpStringTableColumn
			                 title: 'Package names'
			                 evaluated: #name);
		                yourself.
	
	classTable := self newTable
		              addColumn: ((SpCheckBoxTableColumn
				                title: ' '
				                evaluated: [ :c | model selection isClassSelected: c ])
				               onActivation: [ :c | model selection selectClass: c ];
				               onDeactivation: [ :c | model selection unselectClass: c ];
				               width: 20;
				               yourself);
		              addColumn: ((SpImageTableColumn
				                title: ' '
				                evaluated: [ :c |
					                self iconNamed: c systemIconName ])
				               width: 20;
				               yourself);
		              addColumn:
		              (SpStringTableColumn
			               title: 'Class names'
			               evaluated: #name);
		              yourself.
	
	methodTable := self newTable
		               addColumn: ((SpCheckBoxTableColumn
				                 title: ' '
				                 evaluated: [ :m | model selection isMethodSelected: m ])
				                onActivation: [ :m | model selection selectMethod: m ];
				                onDeactivation: [ :m | model selection unselectMethod: m ];
				                width: 20;
				                yourself);
		               addColumn:
		               (SpStringTableColumn
			                title: 'Method names'
			                evaluated: #name);
		               yourself.
]

{ #category : #initialization }
ScpTraceSourceBrowserPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Scopeo trace source browser'.
	aWindowPresenter initialExtent: 920 @ 570.
	aWindowPresenter whenClosedDo: [ model cancel ]
]

{ #category : #refreshing }
ScpTraceSourceBrowserPresenter >> refresh [

	packageTable items: model items packages.
	classTable items: model items classes.
	methodTable items: model items methods.

	model selection hasMethodsSelected
		ifTrue: [ validateButton enable ]
		ifFalse: [ validateButton disable ]
]

{ #category : #'accessing - model' }
ScpTraceSourceBrowserPresenter >> setModelBeforeInitialization: aModel [

	model := aModel
]
