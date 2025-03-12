CREATE OR REPLACE PACKAGE generate_data_pkg AS
     
     
    PROCEDURE generate_license_category;
    PROCEDURE generate_vehicle_types;
    PROCEDURE generate_statuses;
    PROCEDURE generate_drivers(driver_count IN NUMBER);
    PROCEDURE generate_transport(transport_count IN NUMBER);
    PROCEDURE generate_trip_requests(request_count IN NUMBER);
    PROCEDURE  generate_all_data(driver_count IN NUMBER, transport_count IN NUMBER, request_count IN NUMBER);
    
END generate_data_pkg;
/

CREATE OR REPLACE PACKAGE BODY generate_data_pkg AS

 PROCEDURE generate_license_category AS
BEGIN
    INSERT INTO license_category (category_name) VALUES ('АМ');
    INSERT INTO license_category (category_name) VALUES ('А');
    INSERT INTO license_category (category_name) VALUES ('А1');
    INSERT INTO license_category (category_name) VALUES ('В');
    INSERT INTO license_category (category_name) VALUES ('С');
    INSERT INTO license_category (category_name) VALUES ('D');
    INSERT INTO license_category (category_name) VALUES ('ВЕ');
    INSERT INTO license_category (category_name) VALUES ('СЕ');
    INSERT INTO license_category (category_name) VALUES ('DЕ');
    INSERT INTO license_category (category_name) VALUES ('F');
    INSERT INTO license_category (category_name) VALUES ('I');
END generate_license_category;


    PROCEDURE generate_vehicle_types IS
    BEGIN
       INSERT INTO vehicle_type (type_name, required_license_id) 
    VALUES 
    ('Легковой автомобиль', 4),
    ('Микроавтобус', 6),
    ('Школьный автобус', 6),
    ('Грузовой автомобиль', 5),
    ('Малый грузовик', 5),
    ('Средний грузовик', 5),
    ('Тяжелый грузовик', 5),
    ('Трактор', 5),
    ('Экскаватор', 5),
    ('Грузовик с манипулятором', 5),
    ('Автобус до 30 мест', 6),
    ('Автобус более 30 мест', 6),
    ('Легковой автомобиль с прицепом', 7),
    ('Грузовик с прицепом', 8);
    END generate_vehicle_types;

    PROCEDURE generate_statuses IS
    BEGIN
        INSERT INTO status (status_name) VALUES ('Ожидает подтверждения');
        INSERT INTO status (status_name) VALUES ('Подтверждено');
        INSERT INTO status (status_name) VALUES ('В процессе');
        INSERT INTO status (status_name) VALUES ('Выполнено');
        INSERT INTO status (status_name) VALUES ('Отменено');
    END generate_statuses;


    PROCEDURE generate_drivers(driver_count IN NUMBER) IS
    TYPE stringarray IS TABLE OF VARCHAR2(50);
    
    namesarr stringarray := stringarray('Василий', 'Анатолий', 'Александр', 'Вячеслав', 'Николай', 'Мария', 'Игорь', 
                                       'Константин', 'Кирилл', 'Артем', 'Станислав', 'Дмитрий', 'Петр', 'Юрий', 'Максим', 
                                       'Екатерина', 'Евгений', 'Владимир', 'Григорий', 'Сергей', 'Роман', 'Андрей', 
                                       'Наталья', 'Ольга', 'София', 'Анна', 'Тимофей', 'Илья', 'Геннадий', 'Елена', 
                                       'Алиса', 'Вероника', 'Оксана', 'Светлана', 'Татьяна', 'Дарина', 'Людмила');

    surnamesarr stringarray := stringarray('Артемьев', 'Кузнецов', 'Никитин', 'Матвеев', 'Алексеев', 'Федотов', 
                                           'Баранов', 'Носов', 'Иванов', 'Морозов', 'Лебедев', 'Смирнов', 'Петров', 
                                           'Козлов', 'Орлов', 'Голубев', 'Дмитриев', 'Шевченко', 'Соловьев', 'Сидоров', 
                                           'Васильев', 'Чернов', 'Воробьев', 'Михайлов', 'Григорьев', 'Дьяков', 
                                           'Ребров', 'Зайцев', 'Семенов', 'Панин', 'Новиков', 'Бобров', 'Крылов');
                                           
    lastnamearr stringarray := stringarray('Алексеевич', 'Власиевич', 'Всеволодович', 'Георгиевич', 'Зосимович', 
                                           'Дмитриевич', 'Максимович', 'Тимофеевич', 'Романович', 'Петрович', 
                                           'Ильич', 'Евгеньевич', 'Андреевич', 'Константинович', 'Игоревич', 
                                           'Анатольевич', 'Владимирович', 'Сергиевич', 'Екатеринович', 'Николаевич', 
                                           'Григорьевич', 'Юрьевич', 'Геннадиевич', 'Станиславович', 'Федорович', 
                                           'Александрович', 'Денисович', 'Алексиевич', 'Дмитриевич', 'Григориевич');
                                           
    full_name VARCHAR2(150);
    generated_date DATE;
    start_date DATE := TO_DATE('1975-01-01', 'YYYY-MM-DD');
    end_date DATE := TO_DATE('2025-01-01', 'YYYY-MM-DD');
BEGIN
    FOR i IN 1..driver_count LOOP
        full_name := surnamesarr(TRUNC(DBMS_RANDOM.VALUE(1, surnamesarr.COUNT + 1))) || ' ' ||
                     namesarr(TRUNC(DBMS_RANDOM.VALUE(1, namesarr.COUNT + 1))) || ' ' ||
                     lastnamearr(TRUNC(DBMS_RANDOM.VALUE(1, lastnamearr.COUNT + 1)));

        generated_date := start_date + TRUNC(DBMS_RANDOM.VALUE(0, (end_date - start_date)));
        
        INSERT INTO driver (full_name, employment_start) 
        VALUES (full_name, generated_date);
    END LOOP;
END generate_drivers;


  PROCEDURE generate_transport(transport_count IN NUMBER) IS
        number_plate VARCHAR2(20);
        generated_date DATE;
    BEGIN
        FOR i IN 1..transport_count LOOP
            number_plate := DBMS_RANDOM.STRING('U', 2) || TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(1000, 9999)));
            generated_date := TO_DATE('2000-01-01', 'YYYY-MM-DD') + TRUNC(DBMS_RANDOM.VALUE(0, 10000));
            
            INSERT INTO transport (number_plate, vehicle_type_id, start_exploitation) 
            VALUES (number_plate, TRUNC(DBMS_RANDOM.VALUE(1, 8)), generated_date);
        END LOOP;
        COMMIT;
    END generate_transport;


    PROCEDURE generate_trip_requests(request_count IN NUMBER) IS
        route_name VARCHAR2(255);
        distance NUMBER;
        generated_date DATE;
        start_datetime TIMESTAMP;
        end_datetime TIMESTAMP;
    BEGIN
        FOR i IN 1..request_count LOOP
            route_name := 'Маршрут ' || TO_CHAR(i);
            distance := TRUNC(DBMS_RANDOM.VALUE(100, 1000));
            generated_date := TO_DATE('2024-01-01', 'YYYY-MM-DD') + TRUNC(DBMS_RANDOM.VALUE(0, 365));
            start_datetime := TO_TIMESTAMP('2024-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS') + INTERVAL '1' DAY * DBMS_RANDOM.VALUE(1, 30);
            end_datetime := start_datetime + INTERVAL '1' HOUR * DBMS_RANDOM.VALUE(3, 10);

            INSERT INTO trip_request (route_name, distance, creation_date, start_datetime, end_datetime, status_id, required_vehicle_type_id)
            VALUES (route_name, distance, generated_date, start_datetime, end_datetime, TRUNC(DBMS_RANDOM.VALUE(1, 5)), TRUNC(DBMS_RANDOM.VALUE(1, 8)));
        END LOOP;
    END generate_trip_requests;

   

 PROCEDURE generate_all_data(driver_count IN NUMBER, transport_count IN NUMBER, request_count IN NUMBER) IS
BEGIN
    generate_license_category;
    generate_vehicle_types;
    generate_statuses;
    generate_drivers(driver_count);
    generate_transport(transport_count);
    generate_trip_requests(request_count);
    
    COMMIT;
END generate_all_data;


END generate_data_pkg;
/
