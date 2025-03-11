SELECT
    id,
    full_name,
    employment_start,
    availabilitychecker.getdriverworkedhours(id, :workDate) as worked_hours
FROM
         driver d
    JOIN driver_vehicle_type dvt ON d.id = dvt.driver_id
                                    AND dvt.vehicle_type_id = :requeredVehicleTypeId
WHERE
    availabilitychecker.isdriverfree(id, :startDateTime, :endDateTime)
ORDER BY worked_hours