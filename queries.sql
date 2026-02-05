USE Traffic_Management_System_2;
GO

-- ===============================
-- BASIC SELECT QUERIES
-- ===============================

-- 1. Show all drivers
SELECT * FROM Drivers;

-- 2. Show all vehicles with their drivers
SELECT v.vehicle_id, v.model, v.type, d.name AS driver_name
FROM Vehicle v
JOIN Drivers d ON v.driver_id = d.driver_id;

-- ===============================
-- JOIN QUERIES
-- ===============================

-- 3. Violations with driver, vehicle, and road details
SELECT vi.violation_id, d.name AS driver_name, v.vehicle_id, r.name AS road_name, vt.type_name
FROM Violations vi
JOIN Drivers d ON vi.driver_id = d.driver_id
JOIN Vehicle v ON vi.vehicle_id = v.vehicle_id
JOIN Road r ON vi.road_id = r.road_id
JOIN VioLation_Types vt ON vi.violation_type_id = vt.violation_type_id;

-- 4. Officers handling violations
SELECT o.name AS officer_name, vi.violation_id, r.name AS road_name
FROM Officers_Record orc
JOIN Traffic_Officers o ON orc.traffic_officer_id = o.traffic_officer_id
JOIN Violations vi ON orc.violation_id = vi.violation_id
JOIN Road r ON vi.road_id = r.road_id;

-- ===============================
-- AGGREGATE QUERIES
-- ===============================

-- 5. Total violations per road
SELECT r.name AS road_name, COUNT(*) AS total_violations
FROM Violations v
JOIN Road r ON v.road_id = r.road_id
GROUP BY r.name;

-- 6. Total fines amount by status
SELECT status, SUM(amount) AS total_amount
FROM Fines
GROUP BY status;

-- ===============================
-- SUBQUERIES
-- ===============================

-- 7. Drivers who committed high severity violations
SELECT name
FROM Drivers
WHERE driver_id IN (
    SELECT driver_id
    FROM Violations
    WHERE severity = 'High'
);

-- ===============================
-- VIEW USAGE
-- ===============================

-- 8. View unpaid fines (if view exists)
SELECT * FROM vw_DriverrUnpaidFines;

-- ===============================
-- UPDATE QUERY
-- ===============================

-- 9. Update camera status
UPDATE Cameras
SET status = 'Active'
WHERE camera_id = 'CAM-003';

-- ===============================
-- DELETE QUERY
-- ===============================

-- 10. Delete completed maintenance logs
DELETE FROM Maintenance_Log
WHERE status = 'Completed';

-- ===============================
-- COMPLEX QUERY
-- ===============================

-- 11. Officers with number of handled violations
SELECT o.name, COUNT(orc.violation_id) AS handled_violations
FROM Traffic_Officers o
JOIN Officers_Record orc ON o.traffic_officer_id = orc.traffic_officer_id
GROUP BY o.name
HAVING COUNT(orc.violation_id) > 0;
