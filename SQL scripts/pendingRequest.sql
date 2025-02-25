SELECT route_name AS "Маршрут", 
       distance AS "Расстояние", 
       creation_date AS "Дата создания", 
       status AS "Статус", 
       type_name AS "Транспорт"
FROM trip_request tr 
LEFT JOIN vehicle_type vh ON tr.required_vehicle_type_id = vh.id
WHERE status = 'Ожидает'
ORDER BY creation_date;
