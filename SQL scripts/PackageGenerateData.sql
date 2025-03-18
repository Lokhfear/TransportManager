CREATE OR REPLACE PACKAGE generate_data_pkg AS
     
     
    PROCEDURE generate_license_category;
    PROCEDURE generate_transport_brands;
    PROCEDURE generate_vehicle_types;
    PROCEDURE generate_statuses;
    PROCEDURE generate_drivers(driver_count IN NUMBER);
    PROCEDURE generate_driver_licenses;
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
    INSERT INTO license_category (category_name) VALUES ('I');  -- 11
END generate_license_category;


PROCEDURE generate_transport_brands IS
BEGIN 
        INSERT INTO transport_brand (brand_name) VALUES ('BMW');
        INSERT INTO transport_brand (brand_name) VALUES ('Mercedes');
        INSERT INTO transport_brand (brand_name) VALUES ('Toyota');
        INSERT INTO transport_brand (brand_name) VALUES ('Ford');
        INSERT INTO transport_brand (brand_name) VALUES ('Audi');
        INSERT INTO transport_brand (brand_name) VALUES ('Volkswagen');
        INSERT INTO transport_brand (brand_name) VALUES ('Honda');
        INSERT INTO transport_brand (brand_name) VALUES ('Chevrolet');
        INSERT INTO transport_brand (brand_name) VALUES ('Hyundai');
        INSERT INTO transport_brand (brand_name) VALUES ('Nissan');
        INSERT INTO transport_brand (brand_name) VALUES ('Renault');
        INSERT INTO transport_brand (brand_name) VALUES ('Peugeot');
        INSERT INTO transport_brand (brand_name) VALUES ('Fiat');
        INSERT INTO transport_brand (brand_name) VALUES ('Kia');
        INSERT INTO transport_brand (brand_name) VALUES ('Subaru');
        INSERT INTO transport_brand (brand_name) VALUES ('Mazda');
        INSERT INTO transport_brand (brand_name) VALUES ('Jaguar');
        INSERT INTO transport_brand (brand_name) VALUES ('Mitsubishi');
        INSERT INTO transport_brand (brand_name) VALUES ('Chrysler');
        INSERT INTO transport_brand (brand_name) VALUES ('Buick');
        INSERT INTO transport_brand (brand_name) VALUES ('Cadillac');
        INSERT INTO transport_brand (brand_name) VALUES ('Lincoln');
        INSERT INTO transport_brand (brand_name) VALUES ('Alfa Romeo');
        INSERT INTO transport_brand (brand_name) VALUES ('Opel');
        INSERT INTO transport_brand (brand_name) VALUES ('Skoda');
        INSERT INTO transport_brand (brand_name) VALUES ('Seat');
        INSERT INTO transport_brand (brand_name) VALUES ('Smart');
        INSERT INTO transport_brand (brand_name) VALUES ('Dacia');
        INSERT INTO transport_brand (brand_name) VALUES ('Saab');
        INSERT INTO transport_brand (brand_name) VALUES ('MAZ');
        INSERT INTO transport_brand (brand_name) VALUES ('Gazel');
        INSERT INTO transport_brand (brand_name) VALUES ('KamAZ');
        INSERT INTO transport_brand (brand_name) VALUES ('UAZ');
        INSERT INTO transport_brand (brand_name) VALUES ('Lada');
        INSERT INTO transport_brand (brand_name) VALUES ('Vaz'); --34
END generate_transport_brands;


    PROCEDURE generate_vehicle_types IS
    BEGIN
       INSERT INTO vehicle_type (type_name, required_license_id) 
    VALUES 
    ('Легковой автомобиль', 4),
    ('Микроавтобус', 6),
    ('Грузовой автомобиль', 5),
    ('Малый грузовик', 5),
    ('Тяжелый грузовик', 5),
    ('Трактор', 5),
    ('Экскаватор', 5),
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
    

PROCEDURE generate_driver_licenses IS
    driver_count NUMBER;
    license_count NUMBER;
    issue_date DATE;
    expiration_date DATE;
    generated_license_category NUMBER;
BEGIN
    SELECT COUNT(id) INTO driver_count  from driver;
    
    FOR i IN 1..driver_count LOOP
        license_count := TRUNC(DBMS_RANDOM.VALUE(1, 4)); -- от 1 до 3 (кол-во прав)
        
        FOR j IN 1..license_count LOOP
            generated_license_category := TRUNC(DBMS_RANDOM.VALUE(1, 10));

            issue_date := SYSDATE - TRUNC(DBMS_RANDOM.VALUE(5 * 365, 15 * 365));   -- от 5 до 15 лет назад
            expiration_date := issue_date + (10 * 365);    -- Срок действия 10 лет

            DECLARE
                license_exists NUMBER;
            BEGIN

                SELECT COUNT(*) INTO license_exists
                FROM driver_license
                WHERE driver_id = i
                  AND license_category_id = generated_license_category;

                IF license_exists = 0 THEN
                    INSERT INTO driver_license (driver_id, license_category_id, issue_date, expiration_date)
                    VALUES (i, generated_license_category, issue_date, expiration_date);
                END IF;
            END;
        END LOOP;
        
    END LOOP;
END generate_driver_licenses;




  PROCEDURE generate_transport(transport_count IN NUMBER) IS
        number_plate VARCHAR2(20);
        generated_date DATE;
    BEGIN
        FOR i IN 1..transport_count LOOP
            number_plate := DBMS_RANDOM.STRING('U', 2) || TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(1000, 9999)));
            generated_date := TO_DATE('2000-01-01', 'YYYY-MM-DD') + TRUNC(DBMS_RANDOM.VALUE(0, 10000));
            
            INSERT INTO transport (number_plate, transport_brand_id, vehicle_type_id, start_exploitation) 
            VALUES (number_plate, TRUNC(DBMS_RANDOM.VALUE(1, 34)),  TRUNC(DBMS_RANDOM.VALUE(1, 8)), generated_date);
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
        generate_transport_brands;
        generate_vehicle_types;
        generate_statuses;
        generate_drivers(driver_count);
        generate_driver_licenses;
        generate_transport(transport_count);
        generate_trip_requests(request_count);
        
        COMMIT;
    END generate_all_data;


END generate_data_pkg;
/
