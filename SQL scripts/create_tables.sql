
DROP TABLE trip_request CASCADE CONSTRAINTS;
DROP TABLE trip CASCADE CONSTRAINTS;
DROP TABLE transport CASCADE CONSTRAINTS;
DROP TABLE driver_license CASCADE CONSTRAINTS;
DROP TABLE driver CASCADE CONSTRAINTS;
DROP TABLE vehicle_type CASCADE CONSTRAINTS;
DROP TABLE status;
DROP TABLE license_category;
DROP TABLE transport_brand;


CREATE TABLE license_category (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    category_name VARCHAR2(5) NOT NULL UNIQUE
);




CREATE TABLE vehicle_type (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    type_name VARCHAR2(100) NOT NULL UNIQUE,
    required_license_id NUMBER NOT NULL,
    FOREIGN KEY (required_license_id) REFERENCES license_category(id)
); 

--марка
CREATE TABLE transport_brand (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    brand_name VARCHAR2(100) NOT NULL UNIQUE
);


CREATE TABLE transport (
    number_plate VARCHAR(20) PRIMARY KEY,
    transport_brand_id NUMBER,
    vehicle_type_id NUMBER,
    start_exploitation DATE,
    end_exploitation DATE,
    FOREIGN KEY (transport_brand_id) REFERENCES transport_brand(id),
    FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_type(id)
);


CREATE TABLE driver (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    full_name VARCHAR2(255) NOT NULL,
    employment_start DATE NOT NULL,
    employment_end DATE
);


CREATE TABLE driver_license (
    driver_id NUMBER,
    license_category_id NUMBER,
    issue_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    PRIMARY KEY (driver_id, license_category_id),
    FOREIGN KEY (driver_id) REFERENCES driver(id) ON DELETE CASCADE,
    FOREIGN KEY (license_category_id) REFERENCES license_category(id)
);


CREATE TABLE status (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    status_name varchar2(45) NOT NULL
);




CREATE TABLE trip_request (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    route_name VARCHAR2(255) NOT NULL,
    distance NUMBER,
    creation_date DATE NOT NULL,
    status_id NUMBER NOT NULL,
    required_vehicle_type_id NUMBER,
    start_datetime TIMESTAMP(0) NOT NULL,
    end_datetime TIMESTAMP(0) NOT NULL,
    FOREIGN KEY (required_vehicle_type_id) REFERENCES vehicle_type(id),
    FOREIGN KEY (status_id) REFERENCES status(id)
);



CREATE TABLE trip (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    trip_request_id NUMBER NOT NULL UNIQUE,
    transport_id VARCHAR(20),
    driver_id NUMBER,
    FOREIGN KEY (trip_request_id) REFERENCES trip_request(id),
    FOREIGN KEY (transport_id) REFERENCES transport(number_plate),
    FOREIGN KEY (driver_id) REFERENCES driver(id)
);


