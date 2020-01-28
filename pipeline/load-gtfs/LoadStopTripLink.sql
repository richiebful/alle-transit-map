INSERT INTO dbo.StopTripLink
(
    StopKey,
    TripKey,
    ArrivalTime,
    DepartureTime,
    StopSequence,
    StopHeadsign,
    PickupTypeKey,
    DropOffTypeKey,
    ShapeDistanceMetersTravelled,
    IsTimepoint
)
SELECT stp.StopKey,
       trp.TripKey,
       stptm.arrival_time,
       stptm.departure_time,
       stptm.stop_sequence,
       stptm.stop_headsign,
       pktyp.PickupTypeKey,
	   drofftyp.DropOffTypeKey,       
       stptm.shape_dist_traveled,
       ISNULL(stptm.timepoint, 1) AS IsTimepoint
FROM gtfs.StopTimes stptm
    JOIN dbo.Stop stp
        ON stp.StopId = stptm.stop_id
    JOIN dbo.Trip trp
        ON trp.TripId = stptm.trip_id
    LEFT JOIN dbo.PickupType pktyp
        ON pktyp.PickupTypeId = stptm.pickup_type
    LEFT JOIN dbo.DropOffType drofftyp
        ON drofftyp.DropOffTypeId = stptm.drop_off_type;