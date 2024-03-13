# SQL

> Structured Query Language [...] is a domain-specific language used in programming and designed for managing data held in a relational database management system (RDBMS) [...]
> 
> -- Wiki


## Postgres Quickstart

[Quick Reference](https://quickref.me/postgres)

The `psql` binary jealously guards which users can access the database. Use the `-U` flag with user `postgres` usually works:

```
psql -U postgres
```

* `\?`: List all postgres commands
* `\l`: List all databases
* `\c <database>`: Connect to database
* `\dt`: List all tables in active database
* `\d <table>`: Describe table

* `\conninfo`: Show connection info

Show current database:
```
=# SELECT current_database();
```

Show all settings:
```
=# SHOW ALL;
```

Get current hostname:
```
=# SELECT boot_val, reset_val FROM pg_settings WHERE name='listen_addresses';
```

Describe schema of table:
```
SELECT
    column_name,
    data_type
FROM
    information_schema.columns
WHERE
    table_name = 'table_name';
```
