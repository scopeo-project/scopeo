Class {
	#name : #ScpObjectShapeBuilder,
	#superclass : #ScpShapeBuilder,
	#instVars : [
		'object',
		'menuEntries'
	],
	#category : #'Scopeo-UI-Visualization'
}

{ #category : #building }
ScpObjectShapeBuilder >> build [

	| shape label container labeled |
	"label := self buildLabel.
	container := self buildContainerFor: label.
	shape := {
		         container.
		         label } asShape
		         model: object;
		         padding: 1;
		         yourself.
	shape @ RSGhostßDraggable."
	shape := self buildContainerFor: nil.
	shape model: object.
	labeled := RSLabeled new.
	labeled location inner middle; center.
	shape @ labeled.
	shape draggable.
	^ shape
]

{ #category : #building }
ScpObjectShapeBuilder >> buildContainerFor: aLabel [

	^ RSCircle new
		  color: Color veryVeryLightGray;
		  size: 100;
		  addInteraction:
			  (RSMenuActivable new menuDo: [ :aMenuMorph :aBoxShape |
					   self menuEntries: menuEntries in: aMenuMorph ]);
		  yourself
]

{ #category : #building }
ScpObjectShapeBuilder >> buildLabel [

	^ RSLabel new
		  text: object asString;
		  color: Color black;
		  yourself
]

{ #category : #accessing }
ScpObjectShapeBuilder >> menuEntries: aMenuEntries [

	menuEntries := aMenuEntries
]

{ #category : #building }
ScpObjectShapeBuilder >> menuEntries: aEntries in: aMenuMorph [

	aEntries keysAndValuesDo: [ :k :v |
		aMenuMorph
			add: k
			target: self
			selector: #performClickAction:
			argument: v ]
]

{ #category : #accessing }
ScpObjectShapeBuilder >> object: aObject [

	object := aObject
]
