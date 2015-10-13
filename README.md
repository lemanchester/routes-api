## Routes API


### Description

The main goal is to create a Webservice to calculate the shortest and cheapest path given a previously registered map with its routes.

Example, given the map DarkMoon has the following routes:

```Origin, Destiation and Distance (km)```

```
A B 10
B D 15
A C 20
C D 30
B E 50
D E 30
```

And the API receives the params `map: DarkMoon, origin: A, destiation: D, autonomy: 10, liter_value: 2.50`

The response it should tell you:

`route: A B D  cost: 6,25`


### Requirements

* Ruby 2.2.3
* Rails 4.2.4
* Postgres 9.3.x

### Thoughts

- Create a simple Ruby Webserivce to create map and routes and search for the cheasp path;
- Make sure that is everything tested;
- Use rails to create simple Rest API;

### Interacting with the API

#### Create Map

```bash
curl -H "Content-Type: application/json" -X POST "http://localhost:3000/api/v1/maps/" -d'
{
    "map": {
        "name": "xxx"
    }
}'
```

#### List Maps

```bash
curl http://localhost:3000/api/v1/maps/
```

Response:
```
{
    "maps": [
        {
            "id": 2,
            "name": "Dark Moon"
        },
        {
            "id": 3,
            "name": "foo"
        },
        {
            "id": 4,
            "name": "xyy"
        }
    ]
}
```


#### Create Routes

```bash
curl -H "Content-Type: application/json" -X POST  http://localhost:3000/api/v1/maps/3/routes -d'
{
  "routes": [
      { "origin": "A", "destination": "B", "distance": 10 },
      { "origin": "B", "destination": "C", "distance": 20 },
      { "origin": "D", "destination": "E", "distance": 16 },
      { "origin": "E", "destination": "F", "distance": 30 }
  ]
}'
```

#### List Routes per Map

```bash
curl http://localhost:3000/api/v1/maps/3/routes
```

Response:
```
{
    "routes": [
        {
            "id": 11,
            "origin": "A",
            "destination": "B",
            "distance": 10
        },
        {
            "id": 12,
            "origin": "B",
            "destination": "C",
            "distance": 20
        },
        {
            "id": 13,
            "origin": "D",
            "destination": "E",
            "distance": 16
        },
        {
            "id": 14,
            "origin": "E",
            "destination": "F",
            "distance": 30
        }
    ]
}
```

