-- 1. Retrieve Locations of specific features
SELECT 
    feature_name, 
    latitude, 
    longitude
FROM 
    features_table
WHERE 
    feature_type = 'specific';
	
	-- 2. Calculate Distance between points
SELECT 
    p1.point_name AS point1_name,
    p2.point_name AS point2_name,
    SQRT(POW(p2.latitude - p1.latitude, 2) + POW(p2.longitude - p1.longitude, 2)) AS distance
FROM 
    points_table p1
CROSS JOIN 
    points_table p2
WHERE 
    p1.point_id < p2.point_id;
	
	-- 3. Calculate Areas of Interest
SELECT 
    group_id,
    SUM(length * width) AS area_of_interest
FROM 
    areas_table
GROUP BY 
    group_id;
	
	
	-- 4. Analyze the queries
EXPLAIN ANALYZE 
SELECT;

-- 5. Sorting and Limit Executions
SELECT 
    point_name,
    latitude,
    longitude
FROM 
    points_table
ORDER BY 
    latitude DESC, 
    longitude ASC
LIMIT 10;

-- 6. Optimize the queries to speed up execution time
CREATE INDEX IF NOT EXISTS idx_point_name ON points_table (point_name);

-- 7. N-Optimization of queries
CREATE INDEX IF NOT EXISTS idx_point_latitude_longitude ON points_table (point_id, latitude, longitude);

-- For the Sorting and Limit Executions query
CREATE INDEX IF NOT EXISTS idx_point_name_lat_lon ON points_table (point_name, latitude, longitude);
