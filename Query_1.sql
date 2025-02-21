SELECT
	f.title AS vypujceny_film,
    c.first_name || ' ' || c.last_name AS cele_jmeno,
    a.address,
    ci.city,
    co.country,
    a.postal_code AS psc,
    r.rental_date
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE r.rental_date BETWEEN '2005-02-14' AND '2006-02-14'
ORDER BY r.rental_date ASC, cele_jmeno;
