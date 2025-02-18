The issue lies in the way SQL handles `NULL` values. Standard comparison operators (`=`, `!=`, etc.) do not work as expected with `NULL`.  `NULL` represents the absence of a value, and it's not considered equal or unequal to any other value, including another `NULL`. 

To correctly check for `NULL` values, use the `IS NULL` operator:

```sql
SELECT * FROM employees WHERE salary IS NULL;
```
This query will correctly identify and return rows where the `salary` column has a `NULL` value.

Similarly, to check for non-NULL values, use the `IS NOT NULL` operator:

```sql
SELECT * FROM employees WHERE salary IS NOT NULL;
```
This will return rows where the `salary` column has a value other than `NULL`.