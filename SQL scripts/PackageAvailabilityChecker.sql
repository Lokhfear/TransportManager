CREATE OR REPLACE PACKAGE AvailabilityChecker AS
  FUNCTION GetDriverWorkedHours(p_driver_id NUMBER, p_date DATE) RETURN NUMBER;
  FUNCTION IsDriverFree(p_driver_id NUMBER, p_start_time TIMESTAMP, p_end_time TIMESTAMP) RETURN BOOLEAN;
  FUNCTION IsTransportFree(p_transport_id VARCHAR2, p_start_time TIMESTAMP, p_end_time TIMESTAMP) RETURN BOOLEAN;
  FUNCTION IsDriverAvailable(p_driver_id NUMBER, p_start_time TIMESTAMP, p_end_time TIMESTAMP) RETURN BOOLEAN;
END AvailabilityChecker;
/

CREATE OR REPLACE PACKAGE BODY AvailabilityChecker AS

  --сколько часов водитель  отработал(ет) за день
 FUNCTION GetDriverWorkedHours(p_driver_id NUMBER, p_date DATE) RETURN NUMBER IS
    total_hours NUMBER := 0;
    total_minutes NUMBER := 0;
BEGIN
    SELECT COALESCE(SUM(EXTRACT(HOUR FROM (tr.end_datetime - tr.start_datetime) DAY TO SECOND)), 0) AS total_hours,
           COALESCE(SUM(EXTRACT(MINUTE FROM (tr.end_datetime - tr.start_datetime) DAY TO SECOND)), 0) AS total_minutes
    INTO total_hours, total_minutes
    FROM trip_request tr
    JOIN trip t ON t.trip_request_id = tr.id
    WHERE t.driver_id = p_driver_id
      AND TRUNC(tr.start_datetime) = p_date
      AND tr.status_id <> 5;                --не отменен

    total_hours := total_hours + (total_minutes / 60);

    RETURN total_hours;
END GetDriverWorkedHours;


  --свободен ли водитель в указанный период
  FUNCTION IsDriverFree(p_driver_id NUMBER, p_start_time TIMESTAMP, p_end_time TIMESTAMP) RETURN BOOLEAN IS
    flag NUMBER;
  BEGIN
    SELECT COUNT(*)
    INTO flag
    FROM trip_request tr
    JOIN trip t ON t.id = t.trip_request_id and t.driver_id = p_driver_id
    WHERE (p_start_time BETWEEN tr.start_datetime AND tr.end_datetime    --начинается в промежутке
        OR p_end_time BETWEEN tr.start_datetime AND tr.end_datetime)     --заканчивается в промежутке
        OR (p_start_time <= tr.start_datetime AND p_end_time >= tr.end_datetime);  --покрывает весь промежуток(т е вермя старой поездки полностью находиться в новой поезде)
    RETURN flag = 0;
  END IsDriverFree;

  -- свободен ли транспорт в указанный период
  FUNCTION IsTransportFree(p_transport_id VARCHAR2, p_start_time TIMESTAMP, p_end_time TIMESTAMP) RETURN BOOLEAN IS
    flag NUMBER;
  BEGIN
    SELECT COUNT(*)
    INTO flag
    FROM trip_request tr
    JOIN trip t ON tr.id = t.trip_request_id and  t.transport_id = p_transport_id
    WHERE (p_start_time BETWEEN tr.start_datetime AND tr.end_datetime
        OR p_end_time BETWEEN tr.start_datetime AND tr.end_datetime)
        OR (p_start_time <= tr.start_datetime AND p_end_time >= tr.end_datetime);
    RETURN flag = 0;
  END IsTransportFree;

  -- свободен ли водитель с учетом отработанного времени
  FUNCTION IsDriverAvailable(p_driver_id NUMBER, p_start_time TIMESTAMP, p_end_time TIMESTAMP) RETURN BOOLEAN IS
    worked_hours NUMBER;
  BEGIN
    worked_hours := GetDriverWorkedHours(p_driver_id, TRUNC(p_start_time));

    IF worked_hours + EXTRACT(HOUR FROM (p_end_time - p_start_time)  DAY TO SECOND) > 8 THEN
      RETURN FALSE;
    END IF;

    RETURN IsDriverFree(p_driver_id, p_start_time, p_end_time);
  END IsDriverAvailable;

END AvailabilityChecker;
/
