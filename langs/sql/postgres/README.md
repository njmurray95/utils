# Postgres

> PostgreSQL [...] also known as Postgres, is a free and open-source relational database management system (RDBMS) emphasizing extensibility and SQL compliance. It was originally named POSTGRES, referring to its origins as a successor to the Ingres database developed at the University of California, Berkeley.
>
> -- https://en.wikipedia.org/wiki/PostgreSQL

* `psql` -- interactive shell

* [Docs]( https://www.postgresql.org/docs/current/)
* [Quick Reference ](https://quickref.me/postgres)

## Postgres Quickstart


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
    table_name = '<table_name>';
```
