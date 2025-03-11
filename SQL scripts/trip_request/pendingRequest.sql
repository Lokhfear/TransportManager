SELECT 
    tr.id, 
    tr.route_name, 
    tr.distance, 
    tr.creation_date, 
    tr.status_id, 
    s.status_name, 
    tr.required_vehicle_type_id, 
    vh.type_name, 
    TO_CHAR(tr.start_datetime, 'DD.MM.YYYY HH24:MI') AS start_datetime, 
    TO_CHAR(tr.end_datetime, 'DD.MM.YYYY HH24:MI') AS end_datetime
FROM 
    trip_request tr
LEFT JOIN 
    vehicle_type vh ON tr.required_vehicle_type_id = vh.id
JOIN 
    status s ON tr.status_id = s.id 
    AND s.id = 1
ORDER BY 
    tr.creation_date;
