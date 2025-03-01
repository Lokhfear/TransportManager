SELECT
    id,
    full_name,
    employment_start
FROM
         driver d
    JOIN driver_vehicle_type dvt ON d.id = dvt.driver_id
                                   
WHERE
    id NOT IN (
        SELECT
            driver_id
        FROM
                 trip t
            JOIN trip_request tr ON t.trip_request_id = tr.id
                                    AND tr.status = 'В процессе'
    )
    group by id, full_name, employment_start
    order by full_name