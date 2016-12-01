# MI-model

MI-model parses MI-Json data into backbone.js Models and Collections.

The Models are connected in such a way that accessing various parts of the Complex are done through chaining `get()` methods.
For example, to get the sequence of a protein starting at the participant...

```javascript
complex.get("participants").get(1).get("interactor").get("sequence")
```

Complexes have three useful collections:

```javascript
complex.get("participants") // A Collection of Participant Models
complex.get("interactors") // A Collection of Interactor Models
complex.get("links") // A Collection of Link Models
```

The Models returned from those collections have relationships to "connected" Models. For instance, one can traverse a "linked feature" like so:

```javascript
complex.get("participants").get(1).get("features").get(4).get("participant")

```



## Installation

### Browser

```html
<script src="mi-model.js"></script>
```

```javascript
$.get( "json/EBI-9082861.json", function( data ) {
  var complex = new MIModel.complex(data);
});
```

### NodeJS

`npm install --save-dev mi-model`


```javascript
MIModel = require('MI-model')

var mijson = require('./test-data/EBI-9082861.json')

var complex = new MIModel.complex(mijson)
```

## Usage


```javascript

// NOTE: Interactors have a string ID
// Returns an Interactor with ID "uniprotkb_P01127"
complex.get("interactors").get("uniprotkb_P01127")

// NOTE: All other Models have an integer ID (from MIJson)
// Returns a Participant model with ID 4
complex.get("participants").get(1)

// Get a participant's Interactor model
complex.get("participants").get(1).get("interactor")
```



MIModel

## Development

While the application is written
