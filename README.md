# SoupSpoon

Extension methods for [Soup](https://github.com/pharo-contributions/Soup).

## Loading instructions

### Starting from a Pharo image

Open a playground window (`Ctrl+O+W`) and evaluate:

```smalltalk
Metacello new baseline: 'SoupSpoon';
    repository: 'github://capsulecorplab/SoupSpoon:main';
    load.
```

Note: Evaluate by highlighting the text, then either right-click on the highlighted text and click `Do it` or press `Ctrl+D`.

## Quick examples

Retrieve html contents from url

```smalltalk
contents := 'https://pharo.org' asUrl retrieveContents.
```

Then parse contents with Soup

```smalltalk
soup := Soup fromString: contents
```

Soup object can then be queried for a list of HREF elements
```smalltalk
soup hrefs
```

Soup object can also be queried for a list of absolute URL's
```smalltalk
soup absoluteURLs
```

