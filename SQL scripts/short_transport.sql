SELECT
    t.id      AS номер,
    type_name AS "Тип транспорта"
FROM
         transport t
    JOIN vehicle_type vt ON t.vehicle_type_id = vt.id