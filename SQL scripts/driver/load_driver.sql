SELECT 
    d.id, 
    d.full_name, 
    d.employment_start,
    d.employment_end,
    LISTAGG(lc.category_name, ', ') WITHIN GROUP (ORDER BY lc.category_name) AS license_categories
FROM driver d
LEFT JOIN driver_license dl ON d.id = dl.driver_id
LEFT JOIN license_category lc ON dl.license_category_id = lc.id
GROUP BY d.id, d.full_name, d.employment_start, d.employment_end
ORDER BY d.full_name;
