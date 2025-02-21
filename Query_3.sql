SELECT 
    rental_date,
    return_date,
    DATE_PART('day', return_date - rental_date) AS doba_vypujcky,
    GREATEST(DATE_PART('day', return_date - rental_date) - 14, 0) * 0.01 AS pokuta
FROM 
    rental
WHERE 
    DATE_PART('day', return_date - rental_date) IS NOT NULL
ORDER BY 
    doba_vypujcky DESC;
