INSERT INTO dbo.Route
(
    RouteId,
    AgencyKey,
    ShortName,
    LongName,
    Description,
    RouteTypeKey,
    WebURL,
    Color,
    TextColor,
    SortOrder
)
SELECT rte.route_id,
       ag.AgencyKey,
       rte.route_short_name,
       rte.route_long_name,
       rte.route_desc,
       rtyp.RouteTypeKey,
	   rte.route_url,
       rte.route_color,
       rte.route_text_color,
       rte.route_sort_order
FROM gtfs.[Routes] rte
JOIN dbo.RouteType rtyp
ON rtyp.RouteTypeId = rte.route_type
LEFT JOIN dbo.[Agency] ag
ON ag.AgencyId = rte.agency_id