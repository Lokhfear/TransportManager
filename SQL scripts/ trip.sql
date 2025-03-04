SELECT 
    t.id,
    d.full_name,
    t.driver_id,
    trq.route_name,
    trq.distance,
    t.transport_id,
    vt.type_name,
    TO_CHAR(t.start_datetime, 'YYYY-MM-DD HH24:MI') as start_datetime,
    TO_CHAR(t.end_datetime, 'YYYY-MM-DD HH24:MI') as end_datetime,
    trq.required_vehicle_type_id
    
FROM trip t
LEFT JOIN transport tr ON t.transport_id = tr.number_plate
LEFT JOIN vehicle_type vt ON tr.vehicle_type_id = vt.id
LEFT JOIN driver d ON t.driver_id = d.id 
JOIN trip_request trq on t.trip_request_id = trq.id
ORDER BY t.start_datetime DESC;
