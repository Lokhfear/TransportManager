SELECT driver_id, license_category_id, issue_date, expiration_date
from driver_license dl join license_category lc on dl.license_category_id = lc.id
order by dl.driver_id, lc.category_name