WITH first_year_sales AS (
    SELECT
        product_id,
        year,
        quantity,
        price,
        RANK() OVER (PARTITION BY product_id ORDER BY year) as year_rank
    FROM Sales
)
SELECT
    product_id,
    year as first_year,
    quantity,
    price
FROM first_year_sales
WHERE year_rank = 1;