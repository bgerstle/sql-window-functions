# SQL Window Functions

This repository contains some example data & queries to demonstrate SQL window functions. This repository uses PostgreSQL, but window functions are part of standard SQL and available in a variety of dialects.

## Relevant Links

- [PostgreSQL Exercise](https://pgexercises.com/questions/aggregates/facrev3.html) 
- [PostgreSQL Window Tutorial](https://www.postgresql.org/docs/current/tutorial-window.html)

## Getting Started

- Run `docker-compose up -d` to start postgres
- Connect your database app of choice using the credentials specified in the container's environment (see `docker-compose.yml`)
- Run `V1__create_tables.sql` to create example tables
- Import example data from CSV files:
  - `transactions.csv`
  - `gateway_transactions.csv`

## Example Queries
### `detect_duplicate_transactions.sql`
Basic query using `COUNT(distinct)` and `GROUP BY` to aggregate payments down to a list of payment IDs with duplicate transactions (same `payment_id` and `type`).

### `find_duplicate_transactions.sql`
Similar to "detect," but uses window functions to add computed columns indicating the number of transactions in that row's "partition", which is then used to identify which transactions are duplicated (more than 1 in the partition).

### `gateway_tx_approval_rate.sql`
Uses window functions to determine the last gateway transaction for a given transaction, which attempt it was (first, second, etc.), and how long it has been since the first gateway transaction was created for that transaction.
