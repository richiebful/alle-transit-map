INSERT INTO dbo.Shape
(
    ShapeId
)
SELECT DISTINCT shp.shape_id
FROM gtfs.Shapes shp