INSERT dbo.Agency
(
    Name,
    WebsiteURL,
    TimezoneKey,
    LanguageKey,
    CountryKey,
    PhoneNumber,
    FareURL,
    EmailAddress,
    AgencyId
)
SELECT 
       ag.agency_name,
       ag.agency_url,
	   tz.TimezoneKey,
	   lang.LanguageKey,
	   2,
       ag.agency_phone,
       ag.agency_fare_url,
       ag.agency_email,
	   ag.agency_id
FROM gtfs.Agency ag
JOIN dbo.Timezone tz
ON tz.TimezoneId = ag.agency_timezone
LEFT JOIN dbo.Language lang
ON lang.Code = ag.agency_lang