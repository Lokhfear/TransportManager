SELECT
    brand_name,
    type_name        AS vehicle_type,
    trn.number_plate,
    COUNT(t.id) as total_trip,
    SUM(tr.distance) AS total_distancem,
    --считает только по дням в которых были поездки. Надо добивить промежуток времени
    round(SUM(distance) / COUNT(DISTINCT trunc(start_datetime)),2) AS avg_daily_distance
FROM
         trip_request tr
    JOIN trip            t ON tr.id = t.trip_request_id
    JOIN transport       trn ON t.transport_id = trn.number_plate
    JOIN transport_brand tran_b ON trn.transport_brand_id = tran_b.id
    JOIN vehicle_type    vt ON trn.vehicle_type_id = vt.id
WHERE
    tr.status_id = 2 --Поменять статус?
    -- добавить параметры для периода времени
GROUP BY
    brand_name,
    type_name,
    trn.number_plate
ORDER BY
    type_name, brand_name 