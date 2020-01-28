INSERT INTO dbo.FareRule
(
    FareClassKey,
    RouteKey,
    OriginZoneKey,
    DestinationZoneKey,
    ContainsZoneKey
)
SELECT cl.FareClassKey,
       rte.RouteKey,
	   origin.ZoneKey,
	   dest.ZoneKey,
	   cont.ZoneKey
FROM gtfs.FareRules rul
JOIN dbo.FareClass cl
ON cl.FareClassId = rul.fare_id
JOIN dbo.Route rte
ON rte.RouteId = rul.route_id
LEFT JOIN dbo.Zone origin
ON origin.ZoneId = rul.origin_id
LEFT JOIN dbo.Zone dest
ON dest.ZoneId = rul.destination_id
LEFT JOIN dbo.Zone cont
ON cont.ZoneId = rul.contains_id