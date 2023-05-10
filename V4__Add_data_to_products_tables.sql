DO $$
DECLARE
  i INTEGER := 1;
BEGIN
  WHILE i <= 100000 LOOP
    INSERT INTO product1 VALUES (i, CONCAT('Product', RANDOM()));
    INSERT INTO product2 VALUES (i, CONCAT('Product', RANDOM()));
    INSERT INTO product3 VALUES (i, CONCAT('Product', RANDOM()));
    i := i + 1;
  END LOOP;
END $$;

