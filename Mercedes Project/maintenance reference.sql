TRUNCATE TABLE Mercedes_Maint_Reference;

-- This script generates 60 years of data for all tiers
INSERT INTO Mercedes_Maint_Reference (Model_Tier, Car_Age_Years, Estimated_Annual_Cost, Service_Type)
SELECT 
    Tier, 
    Age,
    CASE 
        -- Years 1-15: Costs grow as parts wear out
        WHEN Age <= 15 THEN ROUND(BaseCost * POWER(1.08, Age - 1), 0)
        -- Years 16-60: Costs stabilize at a high "Classic" maintenance rate
        ELSE ROUND(BaseCost * POWER(1.08, 14), 0) 
    END AS AnnualCost,
    CASE WHEN Age % 2 = 0 THEN 'Major' ELSE 'Minor' END
FROM (
    SELECT 'Economy' AS Tier, 400 AS BaseCost UNION ALL
    SELECT 'Standard', 600 UNION ALL
    SELECT 'Premium', 900 UNION ALL
    SELECT 'Luxury', 1300
) Tiers
CROSS JOIN (
    SELECT (a.N + b.N * 10) AS Age
    FROM (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
    CROSS JOIN (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) b
) Ages
WHERE Age BETWEEN 1 AND 60;