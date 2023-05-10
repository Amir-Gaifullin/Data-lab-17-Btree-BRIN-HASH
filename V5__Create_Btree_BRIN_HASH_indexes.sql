CREATE INDEX product1_name_idx ON product1 (name);
CREATE INDEX product2_name_idx ON product2 USING brin (name);
CREATE INDEX product3_name_idx ON product3 USING hash (name);

