--Napište jednoduchou funkci/proceduru pro přidání nového filmu našeho zápůjčkového systému.

CREATE TABLE IF NOT EXISTS filmy (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(255),
    rok INTEGER,
    zanr VARCHAR(255)
);

CREATE OR REPLACE FUNCTION pridat_film(nazev VARCHAR, rok INTEGER, zanr VARCHAR) 
RETURNS VOID AS $$

BEGIN -- vlozi data pomoci hodnot do  argumentu
    EXECUTE 'INSERT INTO filmy (nazev, rok, zanr) VALUES ($1, $2, $3)' USING nazev, rok, zanr;
END;
$$ LANGUAGE plpgsql;

SELECT pridat_film('Gran Torino', 2005, 'Drama');
SELECT pridat_film('Million dolar baby', 2000, 'Smutny zanr');
SELECT pridat_film('Hanebný parchanti', 2010, 'XXXXX');

--vypis vsech filmu
SELECT * FROM filmy

