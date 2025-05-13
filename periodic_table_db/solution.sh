UPDATE properties SET type = (SELECT type_id FROM types WHERE type=properties.type);
# ALTER TABLE test ALTER COLUMN id  TYPE integer USING (id::integer);
ALTER TABLE properties ALTER COLUMN type_id TYPE INT USING type_id::integer;
ALTER TABLE properties RENAME COLUMN type TO type_id;
UPDATE elements SET symbol = upper(substring(symbol FROM 1 FOR 1)) || substring(symbol FROM 2 FOR length(symbol));
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;
UPDATE properties SET atomic_mass=TRIM(TRAILING '0' FROM CAST(atomic_mass AS TEXT))::DECIMAL;
INSERT INTO elements(atomic_number, symbol, name) VALUES(9, 'F', 'Fluorine'), (10, 'Ne', 'Neon');
INSERT INTO properties(atomic_number, type_id, atomic_mass, melting_point_celsius, boiling_point_celsius) VALUES(9, 1, 18.998, -220, -188.1), (10, 1, 20.18, -248.6, -246.1);
