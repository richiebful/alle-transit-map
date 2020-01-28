INSERT INTO dbo.ShapePoint
(
    ShapeId,
    Point,
    PointSequence,
    ShapeDistanceMetersTraveled
)
SELECT dboshp.ShapeKey,
       geography::Point(sh.shape_pt_lat, sh.shape_pt_lon, 4326),
       sh.shape_pt_sequence,
       sh.shape_dist_traveled
FROM gtfs.Shapes sh
    JOIN dbo.Shape dboshp
        ON dboshp.ShapeId = sh.shape_id;
