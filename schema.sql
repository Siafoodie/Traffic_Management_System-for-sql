CREATE DATABASE Traffic_Management_System_2;
GO
USE Traffic_Management_System_2;
GO

-- 1. Licenses
CREATE TABLE Licenses (
    license_id VARCHAR(50) PRIMARY KEY,
    issue_date DATE,
    expire_date DATE,
    type VARCHAR(50)
);

-- 2. Traffic Officers
CREATE TABLE Traffic_Officers (
    traffic_officer_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    phone_no VARCHAR(20),
    rank VARCHAR(50),
    station VARCHAR(100)
);

-- 3. Road
CREATE TABLE Road (
    road_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(50),
    speed_limit INT,
    city VARCHAR(50)
);

-- 4. Officer Assigned
CREATE TABLE Officer_Assigned (
    assigned_id VARCHAR(50) PRIMARY KEY,
    traffic_officer_id VARCHAR(50),
    road_id VARCHAR(50),
    duty_date DATE,
    shift VARCHAR(50),
    FOREIGN KEY (traffic_officer_id) REFERENCES Traffic_Officers(traffic_officer_id),
    FOREIGN KEY (road_id) REFERENCES Road(road_id)
);

-- 5. Drivers
CREATE TABLE Drivers (
    driver_id VARCHAR(50) PRIMARY KEY,
    license_id VARCHAR(50),
    name VARCHAR(50),
    age INT,
    address VARCHAR(100),
    phone_no VARCHAR(20),
    FOREIGN KEY (license_id) REFERENCES Licenses(license_id)
);

-- 6. Vehicle
CREATE TABLE Vehicle (
    vehicle_id VARCHAR(50) PRIMARY KEY,
    driver_id VARCHAR(50),
    model VARCHAR(50),
    type VARCHAR(50),
    year INT,
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- 7. Traffic Signals
CREATE TABLE Traffic_Signals (
    signal_id VARCHAR(50) PRIMARY KEY,
    road_id VARCHAR(50),
    type INT,
    location VARCHAR(100),
    FOREIGN KEY (road_id) REFERENCES Road(road_id)
);

-- 8. Emergency Services
CREATE TABLE Emergency_Services (
    service_id VARCHAR(50) PRIMARY KEY,
    road_id VARCHAR(50),
    service_name VARCHAR(50),
    location VARCHAR(50),
    contact_no VARCHAR(20),
    FOREIGN KEY (road_id) REFERENCES Road(road_id)
);

-- 9. Violation Types
CREATE TABLE VioLation_Types (
    violation_type_id VARCHAR(50) PRIMARY KEY,
    type_name VARCHAR(100),
    description VARCHAR(200),
    penalty_amount INT
);

-- 10. Violations
CREATE TABLE Violations (
    violation_id VARCHAR(50) PRIMARY KEY,
    vehicle_id VARCHAR(50),
    driver_id VARCHAR(50),
    violation_type_id VARCHAR(50),
    road_id VARCHAR(50),
    date DATE,
    Vio_time DECIMAL(4,2),
    severity VARCHAR(50),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
    FOREIGN KEY (violation_type_id) REFERENCES VioLation_Types(violation_type_id)
);

-- 11. Cameras
CREATE TABLE Cameras (
    camera_id VARCHAR(50) PRIMARY KEY,
    road_id VARCHAR(50),
    location VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (road_id) REFERENCES Road(road_id)
);

-- 12. Camera Record
CREATE TABLE Cam_Record (
    evidence_id VARCHAR(50) PRIMARY KEY,
    violation_id VARCHAR(50),
    camera_id VARCHAR(50),
    record_time DECIMAL(4,2),
    FOREIGN KEY (violation_id) REFERENCES Violations(violation_id),
    FOREIGN KEY (camera_id) REFERENCES Cameras(camera_id)
);

-- 13. Emergency Response
CREATE TABLE Emergency_Response (
    response_id VARCHAR(50) PRIMARY KEY,
    violation_id VARCHAR(50),
    service_id VARCHAR(50),
    res_time DECIMAL(4,2),
    FOREIGN KEY (violation_id) REFERENCES Violations(violation_id),
    FOREIGN KEY (service_id) REFERENCES Emergency_Services(service_id)
);

-- 14. Fines
CREATE TABLE Fines (
    fine_id INT PRIMARY KEY,
    violation_id VARCHAR(50),
    amount INT,
    status VARCHAR(50),
    FOREIGN KEY (violation_id) REFERENCES Violations(violation_id)
);

-- 15. Officers Record
CREATE TABLE Officers_Record (
    record_id VARCHAR(50) PRIMARY KEY,
    violation_id VARCHAR(50),
    traffic_officer_id VARCHAR(50),
    OR_time DECIMAL(4,2),
    FOREIGN KEY (violation_id) REFERENCES Violations(violation_id),
    FOREIGN KEY (traffic_officer_id) REFERENCES Traffic_Officers(traffic_officer_id)
);

-- 16. Damages
CREATE TABLE Damages (
    damage_id VARCHAR(50) PRIMARY KEY,
    violation_id VARCHAR(50),
    description VARCHAR(200),
    estimated_cost INT,
    d_severity VARCHAR(50),
    FOREIGN KEY (violation_id) REFERENCES Violations(violation_id)
);

-- 17. Maintenance Log
CREATE TABLE Maintenance_Log (
    Maintenance_id VARCHAR(50) PRIMARY KEY,
    damage_id VARCHAR(50),
    cost INT,
    status VARCHAR(50),
    FOREIGN KEY (damage_id) REFERENCES Damages(damage_id)
);

-- 18. Fines Delete Log
CREATE TABLE Fines_Delete_Log (
    fine_id INT,
    violation_id VARCHAR(50),
    amount INT,
    status VARCHAR(50),
    deleted_at DATE,
    PRIMARY KEY (fine_id, deleted_at)
);
