Class {
	#name : 'BaselineOfSoupSpoon',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSoupSpoon',
	#package : 'BaselineOfSoupSpoon'
}

{ #category : 'baselines' }
BaselineOfSoupSpoon >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Dependencies"
			self soup: spec. "Packages"
			spec package: 'SoupSpoon' ]
]

{ #category : 'baselines' }
BaselineOfSoupSpoon >> soup: spec [

	spec
		baseline: 'Soup'
		with: [ spec repository: 'github://pharo-contributions/Soup/' ]
]
