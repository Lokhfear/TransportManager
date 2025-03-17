WITH daily_work AS (
    SELECT 
        d.id AS driver_id,
        d.full_name,
        tr.required_vehicle_type_id AS vehicle_type,
        TRUNC(tr.start_datetime) AS work_day, 
        COUNT(t.id) AS count_trip, 
        SUM(EXTRACT(HOUR FROM (tr.end_datetime - tr.start_datetime) DAY TO SECOND) + 
            EXTRACT(MINUTE FROM (tr.end_datetime - tr.start_datetime) DAY TO SECOND) / 60) AS sum_hours
    FROM driver d
    JOIN trip t ON d.id = t.driver_id
    JOIN trip_request tr ON t.trip_request_id = tr.id
    WHERE tr.status_id = 2                     --поездки в процессе. Надо только заверщенные. (я нигде не ставлю статус завершенный)
    GROUP BY d.id, d.full_name, tr.required_vehicle_type_id, TRUNC(tr.start_datetime)
)

SELECT 
    dw.full_name, 
    SUM(dw.count_trip) AS total_trips,
    ROUND(SUM(dw.sum_hours), 2) AS total_hours,
    ROUND(AVG(dw.sum_hours), 2) AS avg_hours_per_day,

    --
    ROUND(SUM(CASE WHEN dw.vehicle_type = 1 THEN dw.sum_hours ELSE 0 END), 2) AS vehicle_type_1,
    ROUND(SUM(CASE WHEN dw.vehicle_type = 2 THEN dw.sum_hours ELSE 0 END), 2) AS vehicle_type_2,
    ROUND(SUM(CASE WHEN dw.vehicle_type = 3 THEN dw.sum_hours ELSE 0 END), 2) AS vehicle_type_3,
    ROUND(SUM(CASE WHEN dw.vehicle_type = 4 THEN dw.sum_hours ELSE 0 END), 2) AS vehicle_type_4,
    ROUND(SUM(CASE WHEN dw.vehicle_type = 5 THEN dw.sum_hours ELSE 0 END), 2) AS vehicle_type_5,
    ROUND(SUM(CASE WHEN dw.vehicle_type = 6 THEN dw.sum_hours ELSE 0 END), 2) AS vehicle_type_6,
    ROUND(SUM(CASE WHEN dw.vehicle_type = 7 THEN dw.sum_hours ELSE 0 END), 2) AS vehicle_type_7

FROM daily_work dw
GROUP BY dw.full_name;
