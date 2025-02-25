
DROP TABLE trip_request CASCADE CONSTRAINTS;
DROP TABLE trip CASCADE CONSTRAINTS;
DROP TABLE transport CASCADE CONSTRAINTS;
DROP TABLE driver_vehicle_type CASCADE CONSTRAINTS;
DROP TABLE driver CASCADE CONSTRAINTS;
DROP TABLE vehicle_type CASCADE CONSTRAINTS;


CREATE TABLE vehicle_type (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    type_name VARCHAR2(100) NOT NULL
);


CREATE TABLE transport (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    vehicle_type_id NUMBER,
    start_exploitation DATE,
    end_exploitation DATE,
    FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_type(id)
);


CREATE TABLE driver (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    full_name VARCHAR2(255) NOT NULL,
    employment_start DATE
);


CREATE TABLE driver_vehicle_type (
    driver_id NUMBER PRIMARY KEY,
    vehicle_type_id NUMBER,
    FOREIGN KEY (driver_id) REFERENCES driver(id),
    FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_type(id)
);



CREATE TABLE trip_request (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    route_name VARCHAR2(255) NOT NULL,
    distance NUMBER,
    creation_date DATE NOT NULL,
    status VARCHAR2(20) DEFAULT 'Ожидает' NOT NULL,
    required_vehicle_type_id NUMBER,
    FOREIGN KEY (required_vehicle_type_id) REFERENCES vehicle_type(id),
    CHECK (status IN ('Ожидает', 'В процессе', 'Завершено'))
);



CREATE TABLE trip (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    start_datetime TIMESTAMP,                                    --запланированное или фактическое время старта
    end_datetime TIMESTAMP,
    trip_request_id NUMBER NOT NULL UNIQUE,
    transport_id NUMBER,
    driver_id NUMBER,
    FOREIGN KEY (trip_request_id) REFERENCES trip_request(id),
    FOREIGN KEY (transport_id) REFERENCES transport(id),
    FOREIGN KEY (driver_id) REFERENCES driver(id)
);


