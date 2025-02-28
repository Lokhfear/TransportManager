SELECT 
    d.id, 
    d.full_name AS "ФИО", 
d.employment_start AS "Дата начала работы", 
    COALESCE(LISTAGG(vt.type_name, ', ') WITHIN GROUP (ORDER BY vt.type_name), 'Нет типов') AS "Типы транспорта" 
    FROM driver d 
    LEFT JOIN driver_vehicle_type dvt ON d.id = dvt.driver_id 
    LEFT JOIN vehicle_type vt ON dvt.vehicle_type_id = vt.id 
    GROUP BY d.id, d.full_name, d.employment_start  
    ORDER BY d.full_name;