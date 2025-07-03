SELECT
    p.product_id,
    ROUND(
        CASE
            WHEN SUM(u.units) IS NULL OR SUM(u.units) = 0 THEN 0
            ELSE SUM(p.price * u.units) / SUM(u.units)
        END,
        2
    ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;

-- Explanation:
-- 1. We join the Prices and UnitsSold tables on the product_id column.
-- 2. We filter the UnitsSold table to only include rows where the purchase_date is between the start_date and end_date of the Prices table.
-- 3. We group the results by the product_id column.
-- 4. We calculate the average selling price for each product by dividing the total price of the units sold by the total number of units sold.
-- 5. We round the average selling price to 2 decimal places.
-- 6. We return the result table in any order.
-- Summary: FROM > GROUP BY > CASE WHEN > ROUND > SELECT