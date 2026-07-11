Extension { #name : 'SoupElement' }

{ #category : '*SoupSpoon' }
SoupElement >> absoluteUrls [

	| urlsAsSet |
	urlsAsSet := Set newFrom:
		             ((self hrefs select: [ :href | href isString ])
			              select: [ :href | 'http*' match: href ]).
	^ urlsAsSet asOrderedCollection
]

{ #category : '*SoupSpoon' }
SoupElement >> hrefs [

	| hrefs recurseSoup |
	hrefs := Set new.
	recurseSoup := [ :soupElement |
		               | href |
		               "attempt to extract href"
		               href := (soupElement
			                        attributeAt: 'href'
			                        ifAbsent: [ '' ]) ifNotNil: [
			                       soupElement
				                       attributeAt: 'href'
				                       ifAbsent: [ '' ] ].
		               "if no href, check for children"
		               href = ''
			               ifTrue: [ "if children, loop children"
					               soupElement children isNotEmpty ifTrue: [
							               soupElement children do: [ :child | "recurse child"
								               recurseSoup value: child ] ] ]
			               ifFalse: [ "href not blank" hrefs add: href ] ].
	recurseSoup value: self.
	^ (hrefs select: [ :href | href isString ]) asOrderedCollection
]
