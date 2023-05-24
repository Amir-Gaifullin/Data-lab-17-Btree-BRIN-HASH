# Data-lab-17-Btree-BRIN-HASH

## Create 3 tables and indexes

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
<img width="892" alt="Снимок экрана 2023-05-24 в 20 40 14" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/4d3104ba-1ac7-479f-b4de-4ca4a4a1b287">


## Size of indexes

### For Product1(Btree) table
<img width="378" alt="Снимок экрана 2023-05-24 в 20 41 20" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/fc65796a-d439-4b5e-80de-7ef0aa242651">


### For Product2(BRIN) table
<img width="364" alt="Снимок экрана 2023-05-24 в 20 41 37" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/d90daa3b-bba4-439b-9fa1-27b867f27fc9">

### For Product3(HASH) table
<img width="361" alt="Снимок экрана 2023-05-24 в 20 42 09" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/5e0e7965-060a-4bec-962a-f85f875a9fc6">

## Benchmark Commands

### For Product1(Btree) table

```
pgbench -c 10 -T 300 flyway_test -f <(echo "SELECT * FROM product1 WHERE name = 'Product0.49512310161248463';")
```

Result:

<img width="896" alt="Снимок экрана 2023-05-24 в 21 21 14" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/ff609455-5782-4940-9370-a1cfb7647298">


### For Product2(BRIN) table

```
pgbench -c 10 -T 300 flyway_test -f <(echo "SELECT * FROM product2 WHERE name = 'Product0.8627514487373578';")
```

Result:

<img width="880" alt="Снимок экрана 2023-05-24 в 21 43 37" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/c1f66d4e-5bfb-4376-bd9b-18109e387085">

### For Product3(HASH) table

```
pgbench -c 10 -T 300 flyway_test -f <(echo "SELECT * FROM product3 WHERE name = 'Product0.02984555856039517';")
```

Result:

<img width="886" alt="Снимок экрана 2023-05-24 в 21 37 21" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/50bc54dd-889f-4578-91e9-a65fc1832783">



