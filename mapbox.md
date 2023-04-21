---
created: 2023-04-20T14:07:29.769Z
modified: 2023-04-21T08:30:26.693Z
tags: [mapbox,geography,system,pcde,module16,transit,api,web]
---
# Mapbox

Mapbox is a powerful tool used to display maps within
your [HTML][-html] web applications.
Customizing maps and elements in Mapbox involves understanding some basic code and
required elements.

## Getting Started

To begin using Mapbox, first you will need to
create a Mapbox account using the [Mapbox account page][-mapbox-account].

When signing up it will ask you about work related stuff to
try and get you involved at the enterprise level. Ignore.

When done they'll send you an activation email, click the link.

When you have an account you can go to the [account page link][-mapbox-account]
and at the bottom there will be a default API token that you can start using.
If you want a custom token you can name and use for specific software,
you can add a new one there as well.

## Authenticating Requests

When requesting data from *Mapbox*,
you will need to use the [JWT API token][-jwt] that you created or
the default one created for you.
Mapbox has some [documentation on access tokens][-mapbox-access-tokens] for
getting a clearer picture.

The steps can be summarized as:

1. Create a new JSON Web Token (JWT) for a specific URL or
use the default public token that is found on the account page.
2. Be sure to include code similar to below in whatever language/library you are using.
3. Remember to include the Javascript and CSS files for Mapbox in the HTML.

```javascript
// step 2
mapboxgl.accessToken = `[$my_token]`;
```

```html
<script src='https://api.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.js'>
</script>
<link href='https://api.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.css' rel='stylesheet' />
```

## Mapbox Components

Styles and vector tiles are the backbone of Mapbox's performance and versatility.

* Styles outline the appearance of each map.
  * Defines style of features, shape of drawings and many more properties.
  * Styles can be global or nested within one another.
* Vector tiles are the data that is used to create the map.
  * It's a data format for storing geo-spatial vector data such as:
    * Points, lines, polygons

Mapbox supports dynamic displays and user interaction,
such as allowing the map to be repositioned and filtered.
This is made possible through client-side rendering,
meaning data is process in a web browser versus on a server.
With client-side rendering, styles and vector tiles are combined and
rendered quickly using [JavaScript][-js]

## Camera

The camera is the main component in Mapbox because
it is the point around which the field of view is centerd.
Consider the camera as
the eye-in-the-sky you can adust so your map has the desired area within
the window.
The camera dictates the map's view and
can be adjusted to nearly every imaginable arial position by
using four customizable fields:

### Customizable Camera Fields

| Field   | Description                                                     |
| ------- | --------------------------------------------------------------- |
| Center  | (long., lat.) Note, order matters & long. comes before lat.     |
| Zoom    | Any decimal number                                              |
| Bearing | 0 to 360 You can think of bearing as your N,S,E,W orientation   |
| Pitch   | 0 to 85 pitch of 85 tilts camera to nearly horizontal to ground |

To render a map using Mapbox in HTML,
you must include at least the center and zoom measurements.
The following is the minimum code needed to render a map in HTML:

```js
const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v11',
  center: [-74.5, 40],
  zoom: 9
});
```

## Layers

Another feature of Mapbox is **layers**.
**Layers** add complexity and customization to your map for a more interactive experience.
For instance, you can add *layers* to highlight streets,
colorize key buildings, or indicate parks.

The following steps outline how to add *layers* to your map:

1. Load a *layer* to you map using the following command:
`map.on('load', () => {})` .
This initial step allows a layer to be loaded before adding it to your map.
Without this step, Mapbox will attempt to add the *layer* before it exists.
2. Add and begin to define a layer `map.addLayer({/*sfuff here*/})` .

To define the layer you must always define the source and type.
There are five types of sources to choose from.
Sources must always be defined with a type and a URL.

For now,
you will focus on *vector* tiles.
**Vector** tiles allow you to add roads and parks to your map.
Sample code to use vector tiles is provided below:

```js
   source: {
      type: 'vector',
      url: 'mapbox://mapbox.3o7ubwm8'
    },
```

For more information about this,
look at the [Mapbox Style Specification Guide][-mapbox-style-specs-guide].

To ensure you get the correct source URL,
you are also required to provide a source-layer field,
which by convention is usually the original file name:

```txt
'source-layer': 'RPD_Parks'
```

Finally, you will set the desired visibility and the color you wish to use.

```js
layout: {
      visibility: 'visible'
    },
    paint: {
      'fill-color': 'rgba(61,153,80,0.55)'
    }
```

Putting it all together, here is a layer that colors all parks green:

```js
map.on('load', () => {
  map.addLayer({
    id: 'rpd_parks',
    type: 'fill',
    source: {
      type: 'vector',
      url: 'mapbox://mapbox.3o7ubwm8'
    },
    'source-layer': 'RPD_Parks',
    layout: {
      visibility: 'visible'
    },
    paint: {
      'fill-color': 'rgba(61,153,80,0.55)'
    }
  });
});
```

With its multiple layers and customizable elements, Mapbox is a powerful,
free tool that will add many features to your project.

Now you have an understanding of how to use style rules,
vector tiles, and layers in Mapbox.

## Further Reading

* [Mapbox Access Tokens][-mapbox-access-tokens]
* [Mapbox Demo: Bearing and Zoom][-mapbox-demo-bearing-zoom]
* [Mapbox: Vector][-mapbox-vector]
* [Mapbox: Vector Tiles][-mapbox-vector-tiles]
* [Mapbox: Web Applications][-mapbox-web-apps]

## References

### Web Links

* [Mapbox: Account Page][-mapbox-account]
* [Mapbox: Access Tokens][-mapbox-access-tokens]
* [Mapbox: Demo Bearing and Zoom][-mapbox-demo-bearing-zoom]
* [Mapbox: Vector][-mapbox-vector]
* [Mapbox: Vector Tiles][-mapbox-vector-tiles]
* [Mapbox: Web Applications][-mapbox-web-apps]

<!-- Hidden References -->
[-mapbox-account]: https://account.mapbox.com/auth/signin/?route-to=%22https://account.mapbox.com/%22 "Mapbox Account Page"
[-mapbox-access-tokens]: https://docs.mapbox.com/help/getting-started/access-tokens/ "Access Tokens (from docs.mapbox.com)"
[-mapbox-style-specs-guide]: https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/#vector "Mapbox Style Specifications Guide"
[-mapbox-demo-bearing-zoom]: https://docs.mapbox.com/help/demos/web-apps/bearing_and_zoom.html "Mapbox Demo: Bearing and Zoom"
[-mapbox-vector]: https://docs.mapbox.com/help/glossary/vector/ "Mapbox: Vector"
[-mapbox-vector-tiles]: https://docs.mapbox.com/help/glossary/vector-tiles/ "Mapbox: Vector Tiles"
[-mapbox-web-apps]: https://docs.mapbox.com/help/glossary/web-apps/ "Mapbox: Web Applications"

### Note Links

* [HTML][-html]
* [JWT][-jwt]
* [JavaScript][-js]

<!-- Hidden References -->
[-html]: html.md "HTML"
[-jwt]: jwt.md "JSON Web Token"
[-js]: javascript.md "JavaScript"
