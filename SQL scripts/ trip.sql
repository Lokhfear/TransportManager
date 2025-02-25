SELECT 
    TO_CHAR(t.start_datetime, 'YYYY-MM-DD HH24:MI') AS "Время отъезда",
    TO_CHAR(t.end_datetime, 'YYYY-MM-DD HH24:MI') AS "Время прибытия",
    vt.type_name AS "Тип транспорта",
    d.full_name AS "ФИО водителя"
FROM trip t
LEFT JOIN transport tr ON t.transport_id = tr.id
LEFT JOIN vehicle_type vt ON tr.vehicle_type_id = vt.id  -- Исправленная связь
LEFT JOIN driver d ON t.driver_id = d.id                 -- Если водители хранятся отдельно
ORDER BY t.start_datetime DESC;
