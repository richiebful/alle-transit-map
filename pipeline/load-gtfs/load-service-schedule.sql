WITH ServiceIdentifiers AS (
	SELECT DISTINCT service_id
	FROM gtfs.Calendar
	UNION
	SELECT DISTINCT service_id
	FROM gtfs.CalendarDates
)
INSERT INTO dbo.ServiceSchedule
(
    ServiceScheduleId,
    [MondayServiceTypeKey],
    [TuesdayServiceTypeKey],
    [WednesdayServiceTypeKey],
    [ThursdayServiceTypeKey],
    [FridayServiceTypeKey],
    [SaturdayServiceTypeKey],
    [SundayServiceTypeKey],
    [StartDate],
    [EndDate]
)
SELECT svcid.service_id,
       mon.ServiceTypeKey,
       tue.ServiceTypeKey,
       wed.ServiceTypeKey,
       thu.ServiceTypeKey,
       fri.ServiceTypeKey,
       sat.ServiceTypeKey,
       sun.ServiceTypeKey,
       cal.start_date,
       cal.end_date
FROM ServiceIdentifiers svcid
	LEFT JOIN gtfs.Calendar cal
		ON cal.service_id = svcid.service_id
    LEFT JOIN dbo.ServiceType mon
        ON mon.ServiceTypeId = cal.monday
    LEFT JOIN dbo.ServiceType tue
        ON tue.ServiceTypeId = cal.tuesday
    LEFT JOIN dbo.ServiceType wed
        ON wed.ServiceTypeId = cal.wednesday
    LEFT JOIN dbo.ServiceType thu
        ON thu.ServiceTypeId = cal.thursday
    LEFT JOIN dbo.ServiceType fri
        ON fri.ServiceTypeId = cal.friday
    LEFT JOIN dbo.ServiceType sat
        ON sat.ServiceTypeId = cal.saturday
    LEFT JOIN dbo.ServiceType sun
        ON sun.ServiceTypeId = cal.sunday
