SELECT
    id,
    full_name,
    employment_start,
    availabilitychecker.getdriverworkedhours(id, :workDate) as worked_hours
FROM
         driver d
    JOIN driver_license dl ON d.id = dl.driver_id
    JOIN vehilce_type vt ON dl.license_category_id = vt.required_license_id 
                                    AND dvt.vehicle_type_id = :requeredVehicleTypeId
WHERE
    d.employment_end IS NULL OR d.employment_end >= :workDate AND
    availabilitychecker.isdriverfree(id, :startDateTime, :endDateTime);