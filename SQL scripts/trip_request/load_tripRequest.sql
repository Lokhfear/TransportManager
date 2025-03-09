SELECT
    tr.id,
    route_name,
    distance,
    creation_date,
    status_name,
    tr.required_vehicle_type_id,
    vh.type_name,
    to_char(start_datetime, 'DD.MM.YYYY HH24:MI') AS start_datetime,
    to_char(end_datetime, 'DD.MM.YYYY HH24:MI')   AS end_datetime
FROM
    trip_request tr
    LEFT JOIN vehicle_type vh ON tr.required_vehicle_type_id = vh.id
    JOIN status       s ON tr.status_id = s.id
                     AND s.status_name = 'Ожидает подтверждения'
ORDER BY
    creation_date;