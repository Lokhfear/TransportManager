-- Очистка таблиц (сначала дочерние, затем родительские)
DELETE FROM trip CASCADE;
DELETE FROM trip_request CASCADE;
DELETE FROM driver_vehicle_type CASCADE;
DELETE FROM transport CASCADE;
DELETE FROM driver CASCADE;
DELETE FROM vehicle_type CASCADE;

commit;

-- Вставка данных

-- Типы транспортных средств
INSERT INTO vehicle_type (type_name) VALUES ('Легковой автомобиль');
INSERT INTO vehicle_type (type_name) VALUES ('Минивэн');
INSERT INTO vehicle_type (type_name) VALUES ('Грузовик');
INSERT INTO vehicle_type (type_name) VALUES ('Специальная техника');
INSERT INTO vehicle_type (type_name) VALUES ('Грузовой автомобиль');
INSERT INTO vehicle_type (type_name) VALUES ('Легковой');
INSERT INTO vehicle_type (type_name) VALUES ('Новый');


-- Транспортные средства
INSERT INTO transport (number_plate, vehicle_type_id, start_exploitation, end_exploitation) VALUES ('A123BC77', 1, TO_DATE('2015-05-15', 'YYYY-MM-DD'), TO_DATE('2025-05-15', 'YYYY-MM-DD'));
INSERT INTO transport (number_plate, vehicle_type_id, start_exploitation, end_exploitation) VALUES ('B456DE99', 1, TO_DATE('2017-08-10', 'YYYY-MM-DD'), NULL);
INSERT INTO transport (number_plate, vehicle_type_id, start_exploitation, end_exploitation) VALUES ('C789FG33', 2, TO_DATE('2018-01-20', 'YYYY-MM-DD'), NULL);
INSERT INTO transport (number_plate, vehicle_type_id, start_exploitation, end_exploitation) VALUES ('D111HI55', 3, TO_DATE('2016-07-07', 'YYYY-MM-DD'), NULL);
INSERT INTO transport (number_plate, vehicle_type_id, start_exploitation, end_exploitation) VALUES ('E222JK77', 4, TO_DATE('2021-03-01', 'YYYY-MM-DD'), NULL);
INSERT INTO transport (number_plate, vehicle_type_id, start_exploitation, end_exploitation) VALUES ('F333LM88', 5, TO_DATE('2019-05-10', 'YYYY-MM-DD'), NULL);
INSERT INTO transport (number_plate, vehicle_type_id, start_exploitation, end_exploitation) VALUES ('G444NO99', 6, TO_DATE('2020-09-15', 'YYYY-MM-DD'), NULL);

-- Водители
INSERT INTO driver (full_name, employment_start)
  VALUES ('Джон Смит', TO_DATE('2010-03-01', 'YYYY-MM-DD'));
INSERT INTO driver (full_name, employment_start)
  VALUES ('Питер Джонсон', TO_DATE('2012-05-10', 'YYYY-MM-DD'));
INSERT INTO driver (full_name, employment_start)
  VALUES ('Роберт Браун', TO_DATE('2015-07-15', 'YYYY-MM-DD'));
INSERT INTO driver (full_name, employment_start)
  VALUES ('Анна Уильямс', TO_DATE('2018-09-05', 'YYYY-MM-DD'));
INSERT INTO driver (full_name, employment_start)
  VALUES ('Алекс Тейлор', TO_DATE('2017-02-25', 'YYYY-MM-DD'));
INSERT INTO driver (full_name, employment_start)
  VALUES ('Натали Грин', TO_DATE('2016-10-30', 'YYYY-MM-DD'));
INSERT INTO driver (full_name, employment_start)
  VALUES ('Дмитрий Уайт', TO_DATE('2019-04-01', 'YYYY-MM-DD'));

-- Водители и их категории
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (1, 1);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (1, 2);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (2, 1);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (1, 3);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (3, 2);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (3, 4);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (4, 2);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (4, 5);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (5, 3);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (5, 6);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (6, 3);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (7, 4);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (7, 5);
INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (6, 6);

-- Заявки на поездки
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Москва - Санкт-Петербург', 700, TO_DATE('2025-01-10', 'YYYY-MM-DD'), 'Ожидает', 1);
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Санкт-Петербург - Воронеж', 900, TO_DATE('2025-02-10', 'YYYY-MM-DD'), 'В процессе', 2);
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Воронеж - Краснодар', 650, TO_DATE('2025-03-05', 'YYYY-MM-DD'), 'В процессе', 3);
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Москва - Тула', 200, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 'В процессе', 1);
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Сочи - Москва', 1500, TO_DATE('2025-01-25', 'YYYY-MM-DD'), 'Завершено', 2);
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Казань - Нижний Новгород', 350, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 'В процессе', 3);
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Самара - Волгоград', 350, TO_DATE('2025-01-30', 'YYYY-MM-DD'), 'Завершено', 1);
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Краснодар - Ростов', 200, TO_DATE('2025-02-01', 'YYYY-MM-DD'), 'В процессе', 2);
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Уфа - Оренбург', 500, TO_DATE('2025-02-15', 'YYYY-MM-DD'), 'Ожидает', 3);
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Нижний Новгород - Челябинск', 800, TO_DATE('2025-02-20', 'YYYY-MM-DD'), 'Завершено', 4);
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Ижевск - Казань', 250, TO_DATE('2025-01-25', 'YYYY-MM-DD'), 'Ожидает', 1);
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Челябинск - Сургут', 1200, TO_DATE('2025-02-10', 'YYYY-MM-DD'), 'В процессе', 2);
INSERT INTO trip_request (route_name, distance, creation_date, status, required_vehicle_type_id) 
  VALUES ('Рязань - Воронеж', 300, TO_DATE('2025-02-12', 'YYYY-MM-DD'), 'Завершено', 3);

-- Поездки
INSERT INTO trip (start_datetime, end_datetime, trip_request_id, transport_id, driver_id) 
  VALUES (TO_TIMESTAMP('2025-01-11 08:00:00', 'YYYY-MM-DD HH24:MI:SS'),
          TO_TIMESTAMP('2025-01-11 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
          1, 'A123BC77', 1);

INSERT INTO trip (start_datetime, end_datetime, trip_request_id, transport_id, driver_id) 
  VALUES (TO_TIMESTAMP('2025-02-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
          TO_TIMESTAMP('2025-02-11 19:00:00', 'YYYY-MM-DD HH24:MI:SS'),
          2, 'B456DE99', 2);

INSERT INTO trip (start_datetime, end_datetime, trip_request_id, transport_id, driver_id) 
  VALUES (TO_TIMESTAMP('2025-02-16 07:00:00', 'YYYY-MM-DD HH24:MI:SS'),
          TO_TIMESTAMP('2025-02-16 17:00:00', 'YYYY-MM-DD HH24:MI:SS'),
          3, 'C789FG33', 3);

INSERT INTO trip (start_datetime, end_datetime, trip_request_id, transport_id, driver_id) 
  VALUES (TO_TIMESTAMP('2025-01-26 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
          TO_TIMESTAMP('2025-01-26 16:00:00', 'YYYY-MM-DD HH24:MI:SS'),
          5, 'D111HI55', 4);

INSERT INTO trip (start_datetime, end_datetime, trip_request_id, transport_id, driver_id) 
  VALUES (TO_TIMESTAMP('2025-02-07 08:00:00', 'YYYY-MM-DD HH24:MI:SS'),
          TO_TIMESTAMP('2025-02-07 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
          4, 'E222JK77', 5);

-- Дополнительные поездки
INSERT INTO trip (start_datetime, end_datetime, trip_request_id, transport_id, driver_id) 
  VALUES (TO_TIMESTAMP('2025-02-20 07:30:00', 'YYYY-MM-DD HH24:MI:SS'),
          TO_TIMESTAMP('2025-02-20 18:15:00', 'YYYY-MM-DD HH24:MI:SS'),
          6, 'E222JK77', 6);

INSERT INTO trip (start_datetime, end_datetime, trip_request_id, transport_id, driver_id) 
  VALUES (TO_TIMESTAMP('2025-03-01 06:45:00', 'YYYY-MM-DD HH24:MI:SS'),
          TO_TIMESTAMP('2025-03-01 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),
          7, 'D111HI55', 7);

INSERT INTO trip (start_datetime, end_datetime, trip_request_id, transport_id, driver_id) 
  VALUES (TO_TIMESTAMP('2025-03-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
          TO_TIMESTAMP('2025-03-10 22:45:00', 'YYYY-MM-DD HH24:MI:SS'),
          8, 'E222JK77', 1);

INSERT INTO trip (start_datetime, end_datetime, trip_request_id, transport_id, driver_id) 
  VALUES (TO_TIMESTAMP('2025-03-15 08:15:00', 'YYYY-MM-DD HH24:MI:SS'),
          TO_TIMESTAMP('2025-03-15 17:50:00', 'YYYY-MM-DD HH24:MI:SS'),
          9, 'E222JK77', 2);

INSERT INTO trip (start_datetime, end_datetime, trip_request_id, transport_id, driver_id) 
  VALUES (TO_TIMESTAMP('2025-03-20 09:40:00', 'YYYY-MM-DD HH24:MI:SS'),
          TO_TIMESTAMP('2025-03-20 19:20:00', 'YYYY-MM-DD HH24:MI:SS'),
          10, 'E222JK77', 3);

COMMIT;
