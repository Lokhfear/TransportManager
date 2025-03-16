SELECT 
    t.number_plate, 
    vt.type_name,
    lc.category_name as license_category,
    tb.brand_name,
    t.start_exploitation, 
    t.end_exploitation
FROM transport t
JOIN vehicle_type vt ON t.vehicle_type_id = vt.id
JOIN license_category lc ON vt.required_license_id = lc.id
JOIN transport_brand tb On t.transport_brand_id = tb.id
order by type_name