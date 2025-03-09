INSERT INTO trip_request (route_name, distance, creation_date, required_vehicle_type_id, start_datetime, end_datetime)
VALUES (:route_name, :distance, SYSDATE, :required_vehicle_type_id, :start_datetime, :end_datetime);
