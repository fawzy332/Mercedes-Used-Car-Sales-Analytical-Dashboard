CREATE OR REPLACE VIEW v_Complete_Mercedes_Analysis AS
SELECT 
    TRIM(s.model) AS model_name,
    s.year AS model_year,
    s.price AS sale_price,
    s.mileage,
    s.car_age,
    m.Estimated_Annual_Cost AS yearly_maint,
    -- Add a specialized category for the classic cars in your data
    CASE 
        WHEN s.car_age >= 25 THEN 'Classic Preservation'
        ELSE m.Service_Type 
    END AS maintenance_status,
    -- Tiering logic for the join
    CASE 
        WHEN TRIM(UPPER(s.model)) IN ('S CLASS', 'SL CLASS', 'G CLASS', 'GL CLASS', 'GLS CLASS', 'CL CLASS') THEN 'Luxury'
        WHEN TRIM(UPPER(s.model)) IN ('E CLASS', 'CLS CLASS', 'GLC CLASS', 'GLE CLASS', 'M CLASS', 'R CLASS', 'V CLASS', 'X-CLASS', 'CLK R CLASS') THEN 'Premium'
        WHEN TRIM(UPPER(s.model)) IN ('A CLASS', 'B CLASS', 'CLA CLASS', 'GLA CLASS', '180', '200') THEN 'Economy'
        ELSE 'Standard' 
    END AS assigned_tier
FROM mercsales s
LEFT JOIN mercedes_maint_reference m 
    ON s.car_age = m.Car_Age_Years
    AND m.Model_Tier = (
        CASE 
            WHEN TRIM(UPPER(s.model)) IN ('S CLASS', 'SL CLASS', 'G CLASS', 'GL CLASS', 'GLS CLASS', 'CL CLASS') THEN 'Luxury'
            WHEN TRIM(UPPER(s.model)) IN ('E CLASS', 'CLS CLASS', 'GLC CLASS', 'GLE CLASS', 'M CLASS', 'R CLASS', 'V CLASS', 'X-CLASS', 'CLK R CLASS') THEN 'Premium'
            WHEN TRIM(UPPER(s.model)) IN ('A CLASS', 'B CLASS', 'CLA CLASS', 'GLA CLASS', '180', '200') THEN 'Economy'
            ELSE 'Standard' 
        END
    );
