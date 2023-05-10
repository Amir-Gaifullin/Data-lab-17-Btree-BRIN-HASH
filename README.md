# Data-lab-17-Btree-BRIN-HASH

* V1__Create_product1_table.sql
```
CREATE TABLE product1 (
  id INT,
  name VARCHAR
);

```
* V2__Create_product2_table.sql
```
CREATE TABLE product2 (
  id INT,
  name VARCHAR
);

```

* V3__Create_product3_table.sql

```
CREATE TABLE product3 (
  id INT,
  name VARCHAR
);

```

* V4__Add_data_to_products_tables.sql

```
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

```

* V5__Create_Btree_BRIN_HASH_indexes.sql

```
CREATE INDEX product1_name_idx ON product1 (name);
CREATE INDEX product2_name_idx ON product2 USING brin (name);
CREATE INDEX product3_name_idx ON product3 USING hash (name);

```

* flyway migrate:
<img width="761" alt="Снимок экрана 2023-05-10 в 16 51 27" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/62fd3728-da9e-4424-aef7-0ed76b0644a7">
<img width="1447" alt="Снимок экрана 2023-05-10 в 16 51 47" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/760def87-3d39-4927-bd63-3e2a4d72f563">
