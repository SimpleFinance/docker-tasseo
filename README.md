docker-tasseo
=============

Docker image for https://github.com/obfuscurity/tasseo

Run as:

```
docker run -d -e GRAPHITE_URL=http://yourgraphiteserver -p 5000 -v /path/to/dashboards:/tasseo/dashboards swenson/tasseo
```

where you put in your own graphite server and a path to your own dashboards
directory (which should contains your `*.js` files).
