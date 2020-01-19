# Data conversion

## Allegheny County

1. Download route data from [WPRDC](https://data.wprdc.org/dataset/port-authority-current-transit-routes).
2. Unzip the .zip archive.
3. Run the following command: """ogr2ogr -f GeoJSON -t_srs crs:84 .\routes.geojson .\paac_routes_1909\PAAC_Routes_1909.shp"""

## Beaver County Transit Authority