INSERT INTO dbo.Trip
(
    TripId,
    ServiceScheduleKey,
    RouteKey,
    Headsign,
    ShortName,
    TripDirectionKey,
    TripBlockKey,
    ShapeKey,
    WheelchairAccessibleTypeKey,
    BikesAllowedTypeKey
)
SELECT trp.trip_id,
       sched.ServiceScheduleKey,
	   rte.RouteKey,
	   trp.trip_headsign,
	   trp.trip_short_name,
	   dir.TripDirectionKey,
	   blk.TripBlockKey,
	   shp.ShapeKey,
	   access.WheelchairAccessibleTypeKey,
	   bka.BikesAllowedTypeKey
FROM gtfs.Trips trp
JOIN dbo.ServiceSchedule sched
ON sched.ServiceScheduleId = trp.service_id
JOIN dbo.Route rte
ON rte.RouteId = trp.route_id
LEFT JOIN dbo.TripDirection dir
ON dir.TripDirectionId = trp.direction_id
LEFT JOIN dbo.TripBlock blk
ON blk.TripBlockId = trp.block_id
LEFT JOIN dbo.Shape shp
ON shp.ShapeId = trp.shape_id
LEFT JOIN dbo.WheelchairAccessibleType access
ON access.WheelchairAccessibleTypeId = trp.wheelchair_accessible
LEFT JOIN dbo.BikesAllowedType bka
ON bka.BikesAllowedTypeId = trp.bikes_allowed
