SELECT 
    id, 
    full_name, 
    employment_start, 
    'ПУСТО' AS vehicle_types
FROM 
    driver d
JOIN 
    driver_vehicle_type dvt ON d.id = dvt.driver_id
WHERE
    id NOT IN (
        SELECT
            driver_id
        FROM
            trip t
        JOIN 
            trip_request tr ON t.trip_request_id = tr.id
            AND tr.status = 'В процессе'
    )
GROUP BY 
    id, full_name, employment_start
ORDER BY 
    full_name;
