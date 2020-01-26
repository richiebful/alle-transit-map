INSERT INTO	dbo.Stop
(
    StopId,
    ShortName,
    FullName,
    Description,
    Location,
    ZoneKey,
    WebURL,
    LocationTypeKey,
    PlatformCode,
    WheelchairBoardingTypeKey,
    TimezoneKey
)
SELECT stp.stop_id,
       stp.stop_code,
       stp.stop_name,
       stp.stop_desc,
       geography::Point(stp.stop_lat, stp.stop_lon, 4326),
       zn.ZoneId,
       stp.stop_url,
       loctyp.LocationTypeKey,
	   stp.platform_code,
       wb.WheelchairBoardingTypeKey,
       tz.TimezoneId AS StopTimezone
FROM gtfs.Stops stp
LEFT JOIN dbo.[Zone] zn
ON zn.ZoneId = stp.zone_id
LEFT JOIN dbo.[Timezone] tz
ON tz.TimezoneId = stp.stop_timezone
LEFT JOIN dbo.LocationType loctyp
ON loctyp.LocationTypeId = stp.location_type
LEFT JOIN dbo.WheelchairBoardingType wb
ON wb.WheelchairBoardingTypeId = stp.wheelchair_boarding

UPDATE child
SET ParentStopKey = parent.StopKey
FROM dbo.[Stop] child
JOIN gtfs.Stops instop
ON instop.stop_id = child.StopId
JOIN dbo.[Stop] parent
ON parent.StopId = instop.parent_station