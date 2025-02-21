SELECT 
    c.name AS filmove_kategorie,
    COUNT(f.film_id) AS pocet_filmu_v_kategorii
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY pocet_filmu_v_kategorii DESC;
