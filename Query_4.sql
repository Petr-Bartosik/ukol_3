--Napište SQL query pro manažera, který vrátí kolik zápůjček udělal jednotlivý zaměstnanci v každém roce. 
--Rozděleno na jednotlivé prodejny. Vymyslete, jak by mohla fungovat aktualizace dat.

CREATE TABLE IF NOT EXISTS zapujcky_statistika (
    prodejna_id INT,
    zamestnanec_id INT,
    zamestnanec TEXT,
    rok INT,
    pocet_zapujcek INT,
    PRIMARY KEY (prodejna_id, zamestnanec_id, rok)
);


TRUNCATE TABLE zapujcky_statistika; -- Vymaže staré záznamy

INSERT INTO zapujcky_statistika (prodejna_id, zamestnanec_id, zamestnanec, rok, pocet_zapujcek)

SELECT 
    s.store_id AS prodejna_id,
    s.staff_id AS zamestnanec_id,
    s.first_name || ' ' || s.last_name AS zamestnanec,
    EXTRACT(YEAR FROM r.rental_date) AS rok,
    COUNT(*) AS pocet_zapujcek
FROM rental r
JOIN staff s ON r.staff_id = s.staff_id
GROUP BY prodejna_id, zamestnanec_id, zamestnanec, rok
ORDER BY rok DESC, pocet_zapujcek DESC;

--vybere vse z zapujcky_statistika a seradi /desc/
SELECT * 
FROM zapujcky_statistika
ORDER BY rok DESC, pocet_zapujcek DESC;

--testovani
INSERT INTO zapujcky_statistika (prodejna_id, zamestnanec_id, zamestnanec, rok, pocet_zapujcek)
VALUES (10000, 100000000, 'Testovani vlozeneho zaznamu', 10000, 10000000);

--vypis 
SELECT * 
FROM zapujcky_statistika 
ORDER BY rok DESC;