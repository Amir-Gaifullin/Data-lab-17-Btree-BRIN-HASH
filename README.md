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
<img width="761" alt="Снимок экрана 2023-05-10 в 16 51 27" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/62fd3728-da9e-4424-aef7-0ed76b0644a7">
<img width="1447" alt="Снимок экрана 2023-05-10 в 16 51 47" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/760def87-3d39-4927-bd63-3e2a4d72f563">



## Size of indexes

### For Product1(Btree) table
<img width="365" alt="Снимок экрана 2023-05-24 в 17 55 45" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/850d0433-be78-4966-bc7d-4e4b98639f9d">

### For Product2(BRIN) table
<img width="364" alt="Снимок экрана 2023-05-24 в 17 56 45" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/2f2894fb-e5c5-4dda-9de2-d755d36fe49d">


### For Product3(HASH) table
<img width="360" alt="Снимок экрана 2023-05-24 в 17 56 59" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/10e2e61f-cdbf-44e1-b6db-754e0a1780b5">


## Benchmark Commands

### For Product1(Btree) table

```
pgbench -c 10 -T 300 flyway_test -f <(echo "SELECT * FROM product1 WHERE name = 'Product0.49512310161248463';")
```

Result:
![telegram-cloud-photo-size-2-5395564228108209396-y](https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/b2aae918-e5d9-4b18-865d-0fbf27dcbf29)


### For Product2(BRIN) table

```
pgbench -c 10 -T 300 flyway_test -f <(echo "SELECT * FROM product2 WHERE name = 'Product0.11508160875507456';")
```

Result:
<img width="1022" alt="Снимок экрана 2023-05-10 в 19 37 24" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/5ce4a1f5-bce3-4071-bf47-68d3748b8c37">


### For Product3(HASH) table

```
pgbench -c 10 -T 300 flyway_test -f <(echo "SELECT * FROM product2 WHERE name = 'Product0.02984555856039517';")
```

Result:
<img width="1002" alt="Снимок экрана 2023-05-10 в 19 43 06" src="https://github.com/Amir-Gaifullin/Data-lab-17-Btree-BRIN-HASH/assets/47780452/033c1a42-d152-47d8-bcfe-cb26a8367521">

