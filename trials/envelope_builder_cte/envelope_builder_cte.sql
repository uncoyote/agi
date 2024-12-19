WITH 

params AS (
    SELECT        
        1000 AS point_dist, -- distance between points ON edge
        2 AS points_per_edge, -- points per edge. edge length = (points_per_edge - 1) * point_dist
        100 AS env_count_xy, -- number OF envelopes IN x AND y dimension. num_polygons = (edges_xy * edges_xy)
        1200000 AS ymin,
        2600000 AS xmin,
        2056 AS epsg
),

edge_coord AS (
    SELECT
        generate_series(0, (points_per_edge - 1) * point_dist, point_dist) AS coord
    FROM 
        params
),

edge_points AS (
    SELECT 
        ST_SetSRID(ST_MakePoint(xmin, coord + ymin), 2056) AS point,
        'left' AS line_id
    FROM 
        edge_coord, 
        params
    UNION ALL 
    SELECT 
        ST_SetSRID(ST_MakePoint(xmin + (points_per_edge - 1) * point_dist, coord + ymin), epsg) AS point, 
        'right' AS line_id
    FROM 
        edge_coord, 
        params
    UNION ALL 
    SELECT 
        ST_SetSRID(ST_MakePoint(coord + xmin, ymin), epsg) AS point,
        'lower' AS line_id
    FROM 
        edge_coord, 
        params
    UNION ALL 
    SELECT 
        ST_SetSRID(ST_MakePoint(coord + xmin, ymin + (points_per_edge - 1) * point_dist), epsg) AS point,
        'upper' AS line_id
    FROM 
        edge_coord, 
        params
),

edge AS (
    SELECT 
        ST_MakeLine(point ORDER BY point) AS line
    FROM 
        edge_points
    GROUP BY 
        line_id
),

envelope AS (
    SELECT 
        (ST_Dump(
            ST_Polygonize(
                ST_Node(line)
            )
        )).geom AS env
    FROM 
        edge  
),

env_index_xy AS (
    SELECT
        generate_series(0, env_count_xy - 1) AS env_index
    FROM 
        params
),

env_x AS (
    SELECT 
        ST_Translate(env, env_index * (points_per_edge - 1) * point_dist, 0) AS env
    FROM 
        envelope,
        params
    CROSS JOIN 
        env_index_xy
),

env_xy AS (
    SELECT 
        ST_Translate(env, 0, env_index * (points_per_edge - 1) * point_dist) AS env
    FROM 
        env_x,
        params
    CROSS JOIN 
        env_index_xy
)

SELECT * FROM env_xy

