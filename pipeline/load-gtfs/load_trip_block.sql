INSERT INTO dbo.TripBlock
(
    TripBlockId
)
SELECT DISTINCT
       trp.block_id
FROM gtfs.Trips trp
WHERE NULLIF(LTRIM(RTRIM(trp.block_id)), '') IS NOT NULL;