SELECT 
    t.id, 
    t.driver_id, 
    d.full_name, 
    trq.route_name, 
    trq.distance, 
    t.transport_id, 
    vt.type_name, 
    trq.required_vehicle_type_id,
    to_char(trq.start_datetime, 'DD.MM.YYYY HH24:MI') AS start_datetime,
    to_char(trq.end_datetime, 'DD.MM.YYYY HH24:MI')   AS end_datetime
FROM trip t 
LEFT JOIN transport tr ON t.transport_id = tr.number_plate 
LEFT JOIN vehicle_type vt ON tr.vehicle_type_id = vt.id 
LEFT JOIN driver d ON t.driver_id = d.id 
JOIN trip_request trq ON t.trip_request_id = trq.id 
ORDER BY trq.start_datetime DESC
