---
created: 2023-04-21T10:17:57.753Z
modified: 2023-04-21T12:55:44.760Z
tags: [mbta,api,transit,web,data,location,geographic]
---
# MBTA API

## Basics

### URL

`https://api-v3.mbta.com/`

#### Vehicles

Vehicles describes any mass transit vehicles with a GPS location.
You access those by using this URL, where `base_url` is the URL above.

`base_url/vehicles/?filter[route]=1&include=trip`
The request has a few attributes to note.
First, the `vehicles` sub-route accesses data about vehicles.
Then the query parameter indicated first by a `?` and
then the `filter` directive is used to filter the data,
in this case by the `route` attribute.
Then the `&` separates query parameters, in this case `include`.
The `include` parameter states that the `trip` attribute should be included in the response.

### Example Response

Using the `vehicles` sub-route and the `filter` and `include` parameters,
we get the below response:

```json
{
  "data": [
    {
      "attributes": {
        "bearing": 329,
        "current_status": "IN_TRANSIT_TO",
        "current_stop_sequence": 13,
        "direction_id": 0,
        "label": "1881",
        "latitude": 42.346310529,
        "longitude": -71.087339869,
        "occupancy_status": "MANY_SEATS_AVAILABLE",
        "speed": null,
        "updated_at": "2023-04-21T08:51:11-04:00"
      },
      "id": "y1881",
      "links": {
        "self": "/vehicles/y1881"
      },
      "relationships": {
        "route": {
          "data": {
            "id": "1",
            "type": "route"
          }
        },
        "stop": {
          "data": {
            "id": "93",
            "type": "stop"
          }
        },
        "trip": {
          "data": {
            "id": "55867330",
            "type": "trip"
          }
        }
      },
      "type": "vehicle"
    },
    {
      "attributes": {
        "bearing": 350,
        "current_status": "IN_TRANSIT_TO",
        "current_stop_sequence": 14,
        "direction_id": 0,
        "label": "1857",
        "latitude": 42.34987075,
        "longitude": -71.088932139,
        "occupancy_status": "FEW_SEATS_AVAILABLE",
        "speed": null,
        "updated_at": "2023-04-21T08:51:11-04:00"
      },
      "id": "y1857",
      "links": {
        "self": "/vehicles/y1857"
      },
      "relationships": {
        "route": {
          "data": {
            "id": "1",
            "type": "route"
          }
        },
        "stop": {
          "data": {
            "id": "95",
            "type": "stop"
          }
        },
        "trip": {
          "data": {
            "id": "55867332",
            "type": "trip"
          }
        }
      },
      "type": "vehicle"
    },
    {
      "attributes": {
        "bearing": 38,
        "current_status": "IN_TRANSIT_TO",
        "current_stop_sequence": 3,
        "direction_id": 0,
        "label": "1776",
        "latitude": 42.33239015,
        "longitude": -71.08135421,
        "occupancy_status": "FEW_SEATS_AVAILABLE",
        "speed": null,
        "updated_at": "2023-04-21T08:51:13-04:00"
      },
      "id": "y1776",
      "links": {
        "self": "/vehicles/y1776"
      },
      "relationships": {
        "route": {
          "data": {
            "id": "1",
            "type": "route"
          }
        },
        "stop": {
          "data": {
            "id": "2",
            "type": "stop"
          }
        },
        "trip": {
          "data": {
            "id": "55867336",
            "type": "trip"
          }
        }
      },
      "type": "vehicle"
    },
    {
      "attributes": {
        "bearing": 0,
        "current_status": "IN_TRANSIT_TO",
        "current_stop_sequence": 18,
        "direction_id": 1,
        "label": "1772",
        "latitude": 42.33501974,
        "longitude": -71.0752513,
        "occupancy_status": "MANY_SEATS_AVAILABLE",
        "speed": null,
        "updated_at": "2023-04-21T08:51:12-04:00"
      },
      "id": "y1772",
      "links": {
        "self": "/vehicles/y1772"
      },
      "relationships": {
        "route": {
          "data": {
            "id": "1",
            "type": "route"
          }
        },
        "stop": {
          "data": {
            "id": "854",
            "type": "stop"
          }
        },
        "trip": {
          "data": {
            "id": "55867908",
            "type": "trip"
          }
        }
      },
      "type": "vehicle"
    },
    {
      "attributes": {
        "bearing": 0,
        "current_status": "IN_TRANSIT_TO",
        "current_stop_sequence": 1,
        "direction_id": 1,
        "label": "1736",
        "latitude": 42.329845579,
        "longitude": -71.08411292,
        "occupancy_status": "MANY_SEATS_AVAILABLE",
        "speed": null,
        "updated_at": "2023-04-21T08:51:04-04:00"
      },
      "id": "y1736",
      "links": {
        "self": "/vehicles/y1736"
      },
      "relationships": {
        "route": {
          "data": {
            "id": "1",
            "type": "route"
          }
        },
        "stop": {
          "data": {
            "id": "64",
            "type": "stop"
          }
        },
        "trip": {
          "data": {
            "id": "55867907",
            "type": "trip"
          }
        }
      },
      "type": "vehicle"
    }
  ],
  "included": [
    {
      "attributes": {
        "bikes_allowed": 1,
        "block_id": "C01-6",
        "direction_id": 0,
        "headsign": "Harvard",
        "name": "",
        "wheelchair_accessible": 1
      },
      "id": "55867330",
      "links": {
        "self": "/trips/55867330"
      },
      "relationships": {
        "route": {
          "data": {
            "id": "1",
            "type": "route"
          }
        },
        "route_pattern": {
          "data": {
            "id": "1-_-0",
            "type": "route_pattern"
          }
        },
        "service": {
          "data": {
            "id": "BUS223-4-Wdy-02",
            "type": "service"
          }
        },
        "shape": {
          "data": {
            "id": "010111",
            "type": "shape"
          }
        }
      },
      "type": "trip"
    },
    {
      "attributes": {
        "bikes_allowed": 1,
        "block_id": "C01-7",
        "direction_id": 0,
        "headsign": "Harvard",
        "name": "",
        "wheelchair_accessible": 1
      },
      "id": "55867332",
      "links": {
        "self": "/trips/55867332"
      },
      "relationships": {
        "route": {
          "data": {
            "id": "1",
            "type": "route"
          }
        },
        "route_pattern": {
          "data": {
            "id": "1-_-0",
            "type": "route_pattern"
          }
        },
        "service": {
          "data": {
            "id": "BUS223-4-Wdy-02",
            "type": "service"
          }
        },
        "shape": {
          "data": {
            "id": "010111",
            "type": "shape"
          }
        }
      },
      "type": "trip"
    },
    {
      "attributes": {
        "bikes_allowed": 1,
        "block_id": "C01-9",
        "direction_id": 0,
        "headsign": "Harvard",
        "name": "",
        "wheelchair_accessible": 1
      },
      "id": "55867336",
      "links": {
        "self": "/trips/55867336"
      },
      "relationships": {
        "route": {
          "data": {
            "id": "1",
            "type": "route"
          }
        },
        "route_pattern": {
          "data": {
            "id": "1-_-0",
            "type": "route_pattern"
          }
        },
        "service": {
          "data": {
            "id": "BUS223-4-Wdy-02",
            "type": "service"
          }
        },
        "shape": {
          "data": {
            "id": "010111",
            "type": "shape"
          }
        }
      },
      "type": "trip"
    },
    {
      "attributes": {
        "bikes_allowed": 1,
        "block_id": "C01-10",
        "direction_id": 1,
        "headsign": "Nubian",
        "name": "",
        "wheelchair_accessible": 1
      },
      "id": "55867907",
      "links": {
        "self": "/trips/55867907"
      },
      "relationships": {
        "route": {
          "data": {
            "id": "1",
            "type": "route"
          }
        },
        "route_pattern": {
          "data": {
            "id": "1-_-1",
            "type": "route_pattern"
          }
        },
        "service": {
          "data": {
            "id": "BUS223-4-Wdy-02",
            "type": "service"
          }
        },
        "shape": {
          "data": {
            "id": "010118",
            "type": "shape"
          }
        }
      },
      "type": "trip"
    },
    {
      "attributes": {
        "bikes_allowed": 1,
        "block_id": "C01-11",
        "direction_id": 1,
        "headsign": "Nubian",
        "name": "",
        "wheelchair_accessible": 1
      },
      "id": "55867908",
      "links": {
        "self": "/trips/55867908"
      },
      "relationships": {
        "route": {
          "data": {
            "id": "1",
            "type": "route"
          }
        },
        "route_pattern": {
          "data": {
            "id": "1-_-1",
            "type": "route_pattern"
          }
        },
        "service": {
          "data": {
            "id": "BUS223-4-Wdy-02",
            "type": "service"
          }
        },
        "shape": {
          "data": {
            "id": "010118",
            "type": "shape"
          }
        }
      },
      "type": "trip"
    }
  ],
  "jsonapi": {
    "version": "1.0"
  }
}
```

## Simple Python Client

To further analyze the results from the MBTA API,
it's useful to create clients that can parse the information in more digestible forms.

```python
import urllib.request
import json

# request json file
url = 'https://api-v3.mbta.com/vehicles?filter[route]=1&include=trip'
response = urllib.request.urlopen(url).read()
data = json.loads(response)

# write to console
print(json.dumps(data, indent=2))
```

## References

### Web Links

<!-- Hidden References -->

### Note Links

<!-- Hidden References -->
