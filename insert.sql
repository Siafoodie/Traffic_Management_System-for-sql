USE Traffic_Management_System_2;
GO

-- Licenses
INSERT INTO Licenses VALUES
('LIC-001','2020-01-01','2030-01-01','Professional'),
('LIC-002','2019-06-10','2029-06-10','Private'),
('LIC-003','2021-03-15','2031-03-15','Private');

-- Traffic Officers
INSERT INTO Traffic_Officers VALUES
('OFF-001','Rahim Ahmed','01711111111','Inspector','Dhaka North'),
('OFF-002','Karim Hossain','01822222222','Sergeant','Dhaka South'),
('OFF-003','Salma Akter','01933333333','Constable','Mirpur');

-- Road
INSERT INTO Road VALUES
('R-001','Mirpur Road','Main',60,'Dhaka'),
('R-002','Airport Road','Highway',80,'Dhaka'),
('R-003','Gulshan Avenue','Main',50,'Dhaka');

-- Officer Assigned
INSERT INTO Officer_Assigned VALUES
('AS-001','OFF-001','R-001','2024-01-10','Morning'),
('AS-002','OFF-002','R-002','2024-01-11','Evening'),
('AS-003','OFF-003','R-003','2024-01-12','Night');

-- Drivers
INSERT INTO Drivers VALUES
('D-001','LIC-001','Hasan Ali',35,'Mirpur, Dhaka','01611111111'),
('D-002','LIC-002','Nusrat Jahan',28,'Uttara, Dhaka','01622222222'),
('D-003','LIC-003','Sabbir Khan',40,'Gulshan, Dhaka','01633333333');

-- Vehicle
INSERT INTO Vehicle VALUES
('V-001','D-001','Toyota Corolla','Car',2018),
('V-002','D-002','Honda Civic','Car',2020),
('V-003','D-003','Yamaha FZ','Bike',2019);

-- Traffic Signals
INSERT INTO Traffic_Signals VALUES
('S-001','R-001',3,'Mirpur 10'),
('S-002','R-002',4,'Airport'),
('S-003','R-003',3,'Gulshan 1');

-- Emergency Services
INSERT INTO Emergency_Services VALUES
('ES-001','R-001','Ambulance','Mirpur','999'),
('ES-002','R-002','Fire Service','Airport','998'),
('ES-003','R-003','Police','Gulshan','100');

-- Violation Types
INSERT INTO VioLation_Types VALUES
('VT-001','Speeding','Exceeding speed limit',2000),
('VT-002','Signal Break','Breaking traffic signal',3000),
('VT-003','No Helmet','Riding without helmet',1000);

-- Violations
INSERT INTO Violations VALUES
('VI-001','V-001','D-001','VT-001','R-001','2024-02-01',10.30,'Medium'),
('VI-002','V-002','D-002','VT-002','R-002','2024-02-03',15.45,'High'),
('VI-003','V-003','D-003','VT-003','R-003','2024-02-05',18.20,'Low');

-- Cameras
INSERT INTO Cameras VALUES
('CAM-001','R-001','Mirpur 10','Active'),
('CAM-002','R-002','Airport','Active'),
('CAM-003','R-003','Gulshan 1','Inactive');

-- Camera Record
INSERT INTO Cam_Record VALUES
('EV-001','VI-001','CAM-001',10.31),
('EV-002','VI-002','CAM-002',15.46),
('EV-003','VI-003','CAM-003',18.21);

-- Emergency Response
INSERT INTO Emergency_Response VALUES
('ER-001','VI-002','ES-002',16.00);

-- Fines
INSERT INTO Fines VALUES
(1,'VI-001',2000,'Unpaid'),
(2,'VI-002',3000,'Paid'),
(3,'VI-003',1000,'Unpaid');

-- Officers Record
INSERT INTO Officers_Record VALUES
('OR-001','VI-001','OFF-001',11.00),
('OR-002','VI-002','OFF-002',16.10),
('OR-003','VI-003','OFF-003',18.40);

-- Damages
INSERT INTO Damages VALUES
('DM-001','VI-002','Minor vehicle damage',5000,'Medium');

-- Maintenance Log
INSERT INTO Maintenance_Log VALUES
('ML-001','DM-001',5000,'Completed');
