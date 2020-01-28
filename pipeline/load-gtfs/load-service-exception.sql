INSERT INTO dbo.ServiceException
(
    ServiceScheduleKey,
    ExceptionDate,
    ExceptionTypeKey
)
SELECT sched.ServiceScheduleKey,
       caldat.[date],
	   exc.ServiceExceptionTypeKey
FROM gtfs.CalendarDates caldat
JOIN dbo.ServiceSchedule sched
ON sched.ServiceScheduleId = caldat.service_id
JOIN dbo.ServiceExceptionType exc
ON exc.ServiceExceptionTypeId = caldat.exception_type