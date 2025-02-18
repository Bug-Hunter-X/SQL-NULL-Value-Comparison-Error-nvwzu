In SQL, a common yet easily overlooked error arises when dealing with `NULL` values in comparisons.  The standard comparison operators (`=`, `!=`, `>`, `<`, `>=`, `<=`) do not behave intuitively with `NULL`.  `NULL` does not equal anything, including itself. Thus, `column_name = NULL` will always evaluate to `FALSE`, even if `column_name` actually contains `NULL`. This can cause queries to miss intended results.

For instance, consider a table:

```sql
CREATE TABLE employees (id INT, name VARCHAR(50), salary INT);
INSERT INTO employees (id, name, salary) VALUES (1, 'Alice', 50000), (2, 'Bob', NULL), (3, 'Charlie', 60000);
```

A query to find employees with a NULL salary might seem like this (but is incorrect):

```sql
SELECT * FROM employees WHERE salary = NULL;
```
This returns an empty set.  The correct way to check for NULL is using the `IS NULL` operator:

```sql
SELECT * FROM employees WHERE salary IS NULL;
```
This will correctly return the row for Bob.