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
