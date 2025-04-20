Class {
	#name : 'ScpWhichObjectsAreOfKindSubjectPresenter',
	#superclass : 'ScpQuestionSubjectPresenter',
	#instVars : [
		'classListPresenter',
		'selectClassButton'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpWhichObjectsAreOfKindSubjectPresenter >> connectPresenters [

	selectClassButton action: [ 
		classListPresenter listPresenter selection selectedItem 
			ifNil: [ 
				SpInformDialog new 
					title: 'No class selected';
					label: 'Please select a class';
					acceptLabel: 'Ok, will do!';
					openModal
			]
			ifNotNil: [ :class |
				onSelectedBlock value: class.
				self owner close
			] 
	].

	classListPresenter items: Smalltalk allClasses
]

{ #category : 'layout' }
ScpWhichObjectsAreOfKindSubjectPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: classListPresenter;
		add: selectClassButton expand: false;
		yourself 
]

{ #category : 'initialization' }
ScpWhichObjectsAreOfKindSubjectPresenter >> initializePresenters [

	classListPresenter := self newFilteringList.
	classListPresenter listPresenter
		headerTitle: 'Classes';
		displayIcon: [ self iconNamed: #class ].
		
	selectClassButton := self newButton
		label: 'Select';
		yourself
]
