SELECT
    number_plate,
    vt.type_name,
    start_exploitation,
    end_exploitation
FROM
         transport t
    JOIN vehicle_type vt ON t.vehicle_type_id = vt.id
                            AND t.vehicle_type_id = :requeredVehicleTypeId
WHERE
    availabilitychecker.istransportfree(number_plate, :startDateTime, :endDateTime)
    AND t.end_exploitation > sysdate