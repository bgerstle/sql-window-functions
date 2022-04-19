-- CREATE TABLE IF NOT EXISTS payments
-- (
--     id           INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY
-- );
CREATE TABLE IF NOT EXISTS transactions
(
    id         INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    uuid       TEXT      NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL,
    type       TEXT      NOT NULL,
    status     TEXT      NOT NULL,
    payment_id INT       NOT NULL -- REFERENCES payments (id)
);

CREATE TABLE IF NOT EXISTS gateway_transactions
(
    id               INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    created_at       TIMESTAMP NOT NULL,
    status           TEXT      NOT NULL,
    transaction_uuid TEXT      NOT NULL REFERENCES transactions (uuid)
)
