SELECT route_name, 
       distance, 
       creation_date, 
       status,
       required_vehicle_type_id,
       type_name
FROM trip_request tr 
LEFT JOIN vehicle_type vh ON tr.required_vehicle_type_id = vh.id
WHERE status = 'Ожидает'
ORDER BY creation_date;
