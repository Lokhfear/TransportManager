CREATE OR REPLACE PROCEDURE generate_random_data AS

    --для генерации водителей
    TYPE stringarray IS
        TABLE OF VARCHAR2(50);
    namesarr       stringarray := stringarray('Василия', 'Анатолий', 'Александр', 'Вячеслав', 'Николай',
                                        'Мария', 'Игорь', 'Константин', 'Кирилл', 'Артем',
                                        'Станислав');
    surnamesarr    stringarray := stringarray('Артемьев', 'Кузнецов', 'Никитин', 'Матвеев', 'Алексеев',
                                           'Федотов', 'Баранов', 'Носов', 'Иванов');
    lastnamearr    stringarray := stringarray('Алексеевич', 'Власиевич', 'Всеволод', 'Георгиевич', 'Зосимович');



    -- границы для рандомных дат
    start_date     DATE := TO_DATE ( '1975-01-01', 'YYYY-MM-DD' );
    end_date       DATE := TO_DATE ( '2025-01-01', 'YYYY-MM-DD' );
    
    number_plate   VARCHAR2(15);
    full_name      VARCHAR2(150);
    generated_date DATE;
BEGIN
    -- 7 видов
    INSERT INTO vehicle_type ( type_name ) VALUES ( 'Легковой автомобиль' );

    INSERT INTO vehicle_type ( type_name ) VALUES ( 'Микроавтобус' );

    INSERT INTO vehicle_type ( type_name ) VALUES ( 'Спецтранспорт' );

    INSERT INTO vehicle_type ( type_name ) VALUES ( 'Грузовой автомобиль' );

    INSERT INTO vehicle_type ( type_name ) VALUES ( 'Трактор' );

    INSERT INTO vehicle_type ( type_name ) VALUES ( 'Автобус' );

    INSERT INTO vehicle_type ( type_name ) VALUES ( 'Газель' );

    --80 водителей
    FOR i IN 1..80 LOOP
    
        -- Рандомные ФИО из массивов
        full_name := surnamesarr(trunc(dbms_random.value(1, surnamesarr.count + 1)))
                     || ' '
                     || namesarr(trunc(dbms_random.value(1, namesarr.count + 1)))
                     || ' '
                     || lastnamearr(trunc(dbms_random.value(1, lastnamearr.count + 1)));

        generated_date := start_date + trunc(dbms_random.value(0,(end_date - start_date)));

        INSERT INTO driver (
            full_name,
            employment_start
        ) VALUES ( full_name,
                   generated_date );

    END LOOP;

-- водители и типы тарнспорта
    FOR i IN 1..80 LOOP
        FOR j IN 1..trunc(dbms_random.value(0, 3)) LOOP
            INSERT INTO driver_vehicle_type (
                driver_id,
                vehicle_type_id
            ) VALUES ( i,
                       trunc(dbms_random.value(1, 8)) );

        END LOOP;
    END LOOP;

    COMMIT;
    
    
    --50 транспорта
    FOR i IN 1..50 LOOP
        number_plate := dbms_random.string('U', 2)
                        || to_char(trunc(dbms_random.value(1000, 9999)));

        generated_date := start_date + trunc(dbms_random.value(0,(end_date - start_date)));

        INSERT INTO transport (
            number_plate,
            vehicle_type_id,
            start_exploitation
        ) VALUES ( number_plate,
                   trunc(dbms_random.value(1, 8)),
                   generated_date );

    END LOOP;

END generate_random_data;
/