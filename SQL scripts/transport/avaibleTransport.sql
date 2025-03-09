SELECT 
    t.number_plate, 
    t.start_exploitation, 
    t.end_exploitation, 
    vt.type_name
FROM transport t
JOIN vehicle_type vt 
    ON t.vehicle_type_id = vt.id
AND (t.end_exploitation IS NULL OR t.end_exploitation >= SYSDATE)
AND t.number_plate NOT IN (
    SELECT transport_id 
    FROM trip trip 
    JOIN trip_request tr 
        ON trip.trip_request_id = tr.id 
    WHERE tr.status = 'В процессе'
);
