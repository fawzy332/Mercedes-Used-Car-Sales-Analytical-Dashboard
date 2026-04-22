-- 1. Add the column
ALTER TABLE mercsales ADD car_age INT;

-- 2. Populate it (Assuming 2026 is the current year)
UPDATE mercsales 
SET car_age = (2026 - year);

-- 3. Check your range
SELECT 
    MIN(car_age) AS youngest_car, 
    MAX(car_age) AS oldest_car,
    COUNT(DISTINCT car_age) AS total_unique_years
FROM mercsales;
